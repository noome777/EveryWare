package com.kh.app00.emp.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String login(EmpVo vo, Model model, String saveEmail, HttpSession session, HttpServletResponse resp) {
        
        //아이디 저장 (쿠키)
        if(saveEmail != null) {
            Cookie cookie = new Cookie("saveEmail", vo.getEmpEMail());
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
//    @PostMapping("searchId")
//    @ResponseBody /*ajax 사용할 떄 꼭 추가하기 !!*/
//    public String searchId(EmpVo vo, Model model) {
//        
//        EmpVo idVo = service.selectIdInfo(vo);
//        
//        System.out.println(idVo);
//        
//        if(idVo != null) {
//            model.addAttribute("idVo", idVo);
//            //https://supersett-diary.tistory.com/m/130 -> ajax로 아이디 찾기
//            return idVo.getEmpEMail();
//        }else {
//            return idVo.getEmpEMail();
//        }
//    }
    
    //아이디 찾기 실행
    @PostMapping("searchId")
    public String searchId(EmpVo vo, Model model) {
        
        EmpVo idVo = service.selectIdInfo(vo);
        
        System.out.println(idVo);
        
        if(idVo != null) {
            model.addAttribute("idVo", idVo);
            return "emp/searchId";
        }else {
            return "error/404";
        }
    }
    
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
    
    @GetMapping("searchPwd")
    public String searchPwd() {
        return "emp/searchPwd";
    }
}
