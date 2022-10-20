package com.kh.app00.dayoff.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
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
    
    
    //휴가 신청 화면 && 리스트 조회
    @GetMapping("main/{pno}")
    public String main(DayoffVo vo, Model model, HttpSession session, @PathVariable int pno, String offStartDate, String offEndDate) {
        System.out.println(offStartDate);
        System.out.println(offEndDate);
        
        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
//        if(offStartDate == null && offEndDate == null) {
//            //기간 선택을 하지 않았을 경우
//            vo.setOffStartDate(offStartDate);
//            vo.setOffEndDate(offEndDate);
//            
//            List<DayoffVo> dateList = service.selectDateList(vo);
//        }else {
//            //기간 선택을 했을 경우
//            
//        }
        
        //기간 선택하여 조회
//        List<DayoffVo> 
        
        //리스트의 전체 신청글 수 조회
        int listCount = service.selectTotalCnt(vo);
        
        //사원의 휴가 목록 조회 (+ 페이징)
        PageVo pv = Pagination.getPageVo(listCount, pno, 5, 5);
        List<DayoffVo> voList = service.dayoffList(vo, pv);
        
        model.addAttribute("voList", voList);
        model.addAttribute("pv", pv);
        return "dayoff/dayoffMain";
    }
    

    //휴가 신청
    @PostMapping("main/1")
    public String insertOff(DayoffVo vo, HttpSession session) {
        
        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        
        //DB에 신청 정보 insert
        int result = service.insertOff(vo);
        
        if(result == 1) {
            session.setAttribute("alertMsg", "휴가 신청이 완료 되었습니다.");
            return "redirect:/dayoff/main/1";
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
