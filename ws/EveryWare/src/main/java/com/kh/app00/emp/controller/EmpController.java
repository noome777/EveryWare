package com.kh.app00.emp.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.app00.emp.service.EmpService;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.common.FileUploader;

@Controller
@RequestMapping("emp")
public class EmpController {
    
    private final EmpService service;
    
    @Autowired
    public EmpController(EmpService service) {
        this.service = service;
    }

    //로그인 화면
    @GetMapping("login")
    public String login() {
        return "emp/login";
    }
    
    //로그인 실행 (ajax)
    @PostMapping("login")
    @ResponseBody
    public String login(EmpVo vo, Model model, String saveId, HttpSession session, HttpServletResponse resp) {
        
        //아이디 저장 (쿠키)
        if(saveId.equals("true")) {
            //아이디 저장 체크했을 경우
            Cookie cookie = new Cookie("saveId", vo.getEmpId());
            cookie.setMaxAge(60*60*24);
            resp.addCookie(cookie);
            
        }else if(saveId.equals("false")) {
            //아이디 저장 체크 안 했을 경우
            Cookie cookie = new Cookie("saveId", vo.getEmpId());
            // 쿠키의 유효시간을 0으로 설정하여 만료시킨다
            cookie.setMaxAge(0);
            // 응답 헤더에 추가한다
            resp.addCookie(cookie);
        }

        //서비스 호출
        EmpVo loginMember = service.login(vo);
        
        if(loginMember != null) {
            //로그인 성공
            session.setAttribute("loginMember", loginMember);
            return "success";
        }else {
            //로그인 실패
            model.addAttribute("msg","로그인 실패");
            return "fail";
        }
    }
    
    //아이디 찾기 화면
    @GetMapping("searchId")
    public String searchId() {
        return "emp/searchId";
    }
    
    //아이디 찾기 실행 (ajax)
    @PostMapping(value = "searchId", produces = "application/json; charset=UTF-8")
    @ResponseBody /*ajax 사용할 떄 꼭 추가하기 !!*/
    public String searchId(String empName, String empPhone, EmpVo vo, HttpSession session) {
        System.out.println(vo);
        
        EmpVo idVo = service.selectIdInfo(vo);
        
        Map<String, String> idMap = new HashMap<String, String>();
        idMap.put("empId", idVo.getEmpId());
        System.out.println(idMap);
        
        Gson gson = new Gson();
        String gsonStr = gson.toJson(idMap);
        
        if(idVo != null) {
            return gsonStr;
        }else {
            return "error/404";
        }
    }
    
    //로그아웃
    @GetMapping("logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    
    //비밀번호 찾기 화면
    @GetMapping("searchPwd")
    public String searchPwd() {
        return "emp/searchPwd";
    }
    
    //이메일
    @GetMapping("mailMain")
    public String email() {
        return "smtp/EmailSendMain";
    }
   
    //비밀번호 찾기 시 메일전송
    @PostMapping("mailSend")
    public String success(EmpVo vo, HttpServletRequest req, HttpSession session) {
        
        //이름, 이메일이 사원의 정보와 일치한지 확인
        EmpVo pwdVo = service.selectPwdInfo(vo);
        System.out.println(pwdVo);
        
        //해당 회원이 존재할 때만 메일을 보내준다.
        if(pwdVo != null) {

            //임시 비밀번호 생성(UUID이용) -> 비밀번호를 랜덤 난수로 설정하기
            String tempPw = UUID.randomUUID().toString().replace("-", "");//-를 제거
            tempPw = tempPw.substring(0,10);//tempPw를 앞에서부터 10자리 잘라줌
            System.out.println("임시 비밀번호 ::: " + tempPw);
            
            
            //이메일이 ~인 회원의 비밀번호 랜덤 난수 설정하여 VO 업데이트 하기,
            String content = "EveryWare 임시 비밀번호는 [] 입니다.";
            String contentAll = content.substring(0, 20) + tempPw + content.substring(20);
            
            vo.setEmpPwd(tempPw);
            System.out.println(vo);
            
            
            //랜덤난수 + 암호화 된 비밀번호 db에서 업데이트 해주기
            int result = service.updateTempPwd(vo);
            
            //업데이트가 완료되면, 메일 전송하기
            //이후 메일을 update 한 비밀번호를 담은 내용으로 전송하기
            req.setAttribute("contentAll", contentAll);
            
            return "smtp/sendProcess";
        }else {
            session.setAttribute("alertMsg", "이름 또는 이메일을 확인해주세요.");
            return "redirect:/emp/mailMain";
        }
       
    }
    
    //임시비밀번호 비밀번호 재설정 화면
    @GetMapping("resetPwd")
    public String resetPwd() {
        return "emp/resetPwd";
    }
    
    //임시비밀번호로 비밀번호 재설정 실행
    @PostMapping("resetPwd")
    public String resetPwd(String empId, String empPwd, EmpVo vo, HttpSession session) {
        
        String[] tempAndNew = empPwd.split(",");
        String tempPwd = tempAndNew[0];
        String newPwd = tempAndNew[1];
        
        //임시비밀번호 vo에 세팅해주기
        vo.setEmpId(empId);
        vo.setEmpPwd(tempPwd);
        
        try {
            //임시비밀번호와 db의 비밀번호의 일치 여부 체크(조회)
            EmpVo searchTempPwd = service.selectSearchTempPwd(vo);
            
            //비밀번호 일치시, 새로운 비밀번호로 비밀번호 업데이트
            if(searchTempPwd != null) {
                vo.setEmpPwd(newPwd);
                
                //임시비밀번호를 새로운 비밀번호로 변경
                int result = service.updateNewPwd(vo);
                
                if(result == 1) {
                    session.setAttribute("alertMsg", "비밀번호를 성공적으로 변경하였습니다.");
                    return "emp/resetPwd";
                }else {
                    session.setAttribute("alertMsg", "비밀번호 변경에 실패하였습니다.");
                    return "emp/resetPwd";
                }
            }else {
                session.setAttribute("alertMsg", "입력하신 임시비밀번호를 확인해주세요.");
            }
        } catch (Exception e) {
            return "error/404";
        }
        
        return "emp/resetPwd";
    }
    
     @GetMapping("myPage")
     public String openMyPage() {
    	 return "/emp/myPage";
     }
     
     @PostMapping("edit")
     public String saveMyPage(EmpVo empVo, HttpSession session, HttpServletRequest request) {
    	 
    	 
    	 EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
 		 empVo.setEmpCode(loginMember.getEmpCode());
    	 
 		if(!empVo.getProfile().isEmpty() && empVo.getProfile()!=null) {
			//파일 있음
			//파일 업로드 후 저장된 파일명 얻기
			String saveProfilePath = request.getServletContext().getRealPath("/resources/upload/profile/");
			String changedProfileName = FileUploader.fileUpload(empVo.getProfile(),saveProfilePath);
			empVo.setEmpProfileName(changedProfileName);
		}
 		
 		if(!empVo.getSignFile().isEmpty() && empVo.getSignFile()!=null) {
			String saveFilePath = request.getServletContext().getRealPath("/resources/upload/signFile/");
			String changedSignFileName = FileUploader.fileUpload(empVo.getSignFile(),saveFilePath);
			empVo.setEmpFileName(changedSignFileName);
		}
 		
 		
    	 int result = service.updateEmp(empVo);
    	 
    	 System.out.println("결과 : " + result);
    	 
    	 if(result==1) {
 			EmpVo loginMeber = service.selectEmpByEmpCode(empVo.getEmpCode());
 			session.setAttribute("loginMember", loginMeber);
 			session.setAttribute("alertMsg", "임직원 수정에 성공하였습니다.");
 		}else if(result==-1){
 			session.setAttribute("alertMsg", "임직원 수정에 실패하였습니다.");
 		} else if(result==-2) {
 			session.setAttribute("errorMsg","임직원 수정에 실패하였습니다. 사내전화는 숫자로 11글자를 맞춰서 기입해주세요.");
 		} else if(result==-3) {
 			session.setAttribute("errorMsg","임직원 수정에 실패하였습니다. 개인전화는 숫자로 11글자를 맞춰서 기입해주세요.");
 		} else if(result==-4) {
 			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 이메일은 30글자 이하로 기입해주시길 바랍니다.");
 		} else if(result==-5) {
 			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 주소에는 각각 50글자 이하로 작성해주시길 바랍니다.");
 		} else if(result==-6) {
 			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 주소에는 각각 50글자 이하로 작성해주시길 바랍니다.");
 		} else if(result==-7) {
 			session.setAttribute("errorMsg", "임직원 수정에 실패하였습니다. 비밀번호는 5글자 이상으로 작성하여 주시길 바랍니다.");
 		} else {
 			session.setAttribute("errorMsg", "ErrorCode : " + result);
 		}
    	 
    	 System.out.println(result);
    	return "redirect:/emp/myPage"; 
     }
    
    
}
