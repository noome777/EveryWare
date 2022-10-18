package com.kh.app00.emp.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.app00.emp.service.EmpService;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.smtp.SmtpVo;

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
    
    //로그인 실행
//    @PostMapping("login")
//    public String login(EmpVo vo, Model model, String saveEmail, HttpSession session, HttpServletResponse resp) {
//        
//        //아이디 저장 (쿠키)
//        if(saveEmail != null) {
//            Cookie cookie = new Cookie("saveEmail", vo.getEmpEMail());
//            resp.addCookie(cookie);
//        }
//        
//        //서비스 호출
//        EmpVo loginMember = service.login(vo);
//        
//        if(loginMember != null) {
//            //로그인 성공
//            session.setAttribute("loginMember", loginMember);
//            return "redirect:/";
//        }else {
//            //로그인 실패
//            model.addAttribute("msg","로그인 실패");
//            return "emp/login";
//        }
//    }
    
    //로그인 실행 (ajax)
    @PostMapping("login")
    @ResponseBody
    public String login(EmpVo vo, Model model, String saveId, HttpSession session, HttpServletResponse resp) {
        
        System.out.println(saveId);
        //아이디 저장 (쿠키)
        if(saveId != null) {
            Cookie cookie = new Cookie("saveId", vo.getEmpId());
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
    
    //아이디 찾기 실행
//    @PostMapping("searchId")
//    public String searchId(EmpVo vo, Model model) {
//        
//        EmpVo idVo = service.selectIdInfo(vo);
//        
//        System.out.println(idVo);
//        
//        if(idVo != null) {
//            model.addAttribute("idVo", idVo);
//            return "emp/searchId";
//        }else {
//            return "error/404";
//        }
//    }
    
//    @RequestMapping("searchId")
//    public String searchId2(EmpVo vo, Model model) {
//        EmpVo idVo = service.selectIdInfo(vo);
//        
//        if(idVo != null) {
//            model.addAttribute("idVo", idVo);
//            return "emp/searchId";
//        }else {
//            return "error/404";
//        }
//    }
    
    //비밀번호 찾기 화면
    @GetMapping("searchPwd")
    public String searchPwd() {
        return "emp/searchPwd";
    }
    
    //비밀번호 찾기
//    @PostMapping("searchPwd")
//    public String searchPwd(String empName, String empEMail, EmpVo vo, String subject, String content, String format, HttpServletRequest req) {
//        //이름, 이메일이 사원의 정보와 일치한지 확인
//        EmpVo pwdVo = service.selectPwdInfo(vo);
//        
//      //이메일이 ~인 회원의 비밀번호 랜덤 난수 설정하여 업데이트 하기(서비스에 하고 디비에서 업데이트 하기),
////    String contentPwd = content.substring(19, 21);
//      String contentPwd = "ILOVEU";
//      String contentAll = content.substring(0, 20) + contentPwd + content.substring(20);
//      
//      
//      //이후 메일을 update 한 비밀번호를 담은 내용으로 전송하기
//      req.setAttribute("contentAll", contentAll);
//        
////        if(pwdVo != null) {
//            return "stmp/sendProcess";
////        }else {
////            return "fail";
////        }
//    }
    
   
    
    //이메일
//    getmapping, postmapping searchPwd로 바꾸고, searchPwd.jsp를 emailSendMain.jsp에 맞게 변경하기
    @GetMapping("mailMain")
    public String email() {
        return "stmp/EmailSendMain";
    }
   
    @PostMapping("mailSend")
    public String success(String empEMail, String content, HttpServletRequest req) {
        System.out.println(empEMail);
        System.out.println(content);
        
        
        //이메일이 ~인 회원의 비밀번호 랜덤 난수 설정하여 업데이트 하기(서비스에 하고 디비에서 업데이트 하기),
//      String contentPwd = content.substring(19, 21);
        String contentPwd = "ILOVEU";
        String contentAll = content.substring(0, 20) + contentPwd + content.substring(20);
        
        
        //이후 메일을 update 한 비밀번호를 담은 내용으로 전송하기
        req.setAttribute("contentAll", contentAll);
        
        
        return "stmp/sendProcess";
    }
    
    
}
