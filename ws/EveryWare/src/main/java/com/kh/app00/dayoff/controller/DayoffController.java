package com.kh.app00.dayoff.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.dayoff.service.DayoffService;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("dayoff")
public class DayoffController {
    
    private final DayoffService service;

    @Autowired
    public DayoffController(DayoffService service) {
        this.service = service;
    }
    
    
    //휴가 신청 화면
    @GetMapping("main")
    public String main() {
        return "dayoff/dayoffMain";
    }
    

    //휴가 신청
    @PostMapping("main")
    public String insertOff(DayoffVo vo, HttpSession session) {
        
        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        System.out.println(vo);
        
        //DB에 신청 정보 insert
        int result = service.insertOff(vo);
        
        if(result == 1) {
            session.setAttribute("alertMsg", "휴가 신청이 완료 되었습니다.");
            return "dayoff/dayoffMain";
        } else {
            session.setAttribute("alertMsg", "신청에 실패하셨습니다.");
            return "dayoff/dayoffMain";
        }
        
        
    }
    
    
    
    
    @GetMapping("calendar")
    public String calendar() {
        return "dayoff/dayoffCal";
    }

}
