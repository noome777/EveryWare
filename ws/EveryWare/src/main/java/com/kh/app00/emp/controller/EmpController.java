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

import com.google.gson.Gson;
import com.kh.app00.emp.service.EmpService;
import com.kh.app00.emp.vo.EmpVo;

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
    
     @GetMapping("myPage")
     public String openMyPage() {
    	 return "/emp/myPage";
     }
     
     @PostMapping("myPage")
     public String saveMyPage() {
    	return ""; 
     }
    
    
}
