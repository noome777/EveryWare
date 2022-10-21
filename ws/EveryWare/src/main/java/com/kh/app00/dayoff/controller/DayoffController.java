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
    public String main(DayoffVo vo, Model model, HttpSession session, 
            @PathVariable int pno, String offStartDate, String offEndDate) {
        
        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        //휴가 현황 
        int offTotalCnt = service.offTotalCnt(vo);
        int offUsedCnt = service.offUsedCnt(vo);
        int offLeftCnt = offTotalCnt - offUsedCnt;
        
        //기간 선택 조회 여부(휴가 메인의 전체리스트 || 기간 선택 후 리스트)
        if(offStartDate != null && offEndDate != null) {
            //기간 선택을 했을 경우
            //사원의 기간 선택 목록 조회 (+페이징)
            vo.setOffStartDate(offStartDate);
            vo.setOffEndDate(offEndDate);
            
            //기간 선택 후 신청글 수 조회
            int dateCount = service.selectDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(dateCount, pno, 5, 5);
            
            List<DayoffVo> dateList = service.selectDateList(vo, pv2);
            
            model.addAttribute("dateList", dateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("dateCount", dateCount);
        }else {
            //기간 선택을 하지 않았을 경우
            //리스트의 전체 신청글 수 조회
            int listCount = service.selectTotalCnt(vo);
            PageVo pv1 = Pagination.getPageVo(listCount, pno, 5, 5);
            
            List<DayoffVo> voList = service.dayoffList(vo, pv1);
            
            model.addAttribute("voList", voList);
            model.addAttribute("pv", pv1);
            model.addAttribute("listCount", listCount);
        }
        
        model.addAttribute("offTotalCnt", offTotalCnt);
        model.addAttribute("offUsedCnt", offUsedCnt);
        model.addAttribute("offLeftCnt", offLeftCnt);
        
        return "dayoff/dayoffMain";
    }
    

    //휴가 신청
    @PostMapping("main/{pno}")
    public String insertOff(DayoffVo vo, HttpSession session, 
            String offStartDate, String offEndDate, @PathVariable int pno) {

        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        if(offStartDate.length() == 21 && offEndDate.length() == 21) {
            vo.setOffStartDate(offStartDate.substring(11));
            vo.setOffEndDate(offEndDate.substring(11));
        }
        
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
