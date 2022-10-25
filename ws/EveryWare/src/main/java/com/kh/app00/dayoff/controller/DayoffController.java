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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.dayoff.service.DayoffService;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.RightVo;

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
        
        //로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        vo.setDeptCode(loginMember.getDeptCode());
        
        //만약, 로그인 유저가 관리자, 결재 관리자, 인사 관리자 등등이면 다른 페이지 보여주기 (RIGHT_CODE가 4가 아닐 때)
        //RIGHT_CODE 조회하기
        EmpVo rvo = service.selectRightVo(vo);
        
        if(!rvo.getRightCode().equals("4")) {
            return "redirect:/dayoff/admin/1";
        }
        
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

        //로그인 유저 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        //사원의 부서 정보 vo에 저장
        DayoffVo deptVo = service.getDeptVo(vo);
        vo.setDeptCode(deptVo.getDeptCode());
        
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
    
    //휴가의 관리자 페이지
    @GetMapping("admin/{pno}")
    public String dayoffAdmin(@PathVariable int pno, Model model, DayoffVo vo, 
            String offStartDate, String offEndDate){
        
        //기간 선택 조회 여부(휴가 메인의 전체리스트 || 기간 선택 후 리스트)
        if(offStartDate != null && offEndDate != null) {
            //기간 선택을 했을 경우
            //기간 선택 목록 조회 (+페이징)
            vo.setOffStartDate(offStartDate);
            vo.setOffEndDate(offEndDate);
            
            //기간 선택 후 신청글 수 조회
            int adDateCount = service.selectAdDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(adDateCount, pno, 5, 10);
            
            List<DayoffVo> AdDateList = service.selectAdDateList(vo, pv2);
            
            model.addAttribute("AdDateList", AdDateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("adDateCount", adDateCount);
        }else {
            //기간 선택을 하지 않았을 경우
            //휴가 결재를 위한 전체 목록 조회 (+ 페이징)
            int adListCount = service.selectAdminTotalCnt();
            PageVo pv = Pagination.getPageVo(adListCount, pno, 5, 10);
            
            List<DayoffVo> voList = service.adminDayoffList(pv);
            
            model.addAttribute("adListCount", adListCount);
            model.addAttribute("pv", pv);
            model.addAttribute("voList", voList);
        }
        
        return "dayoff/adminDayoff";
       
    }
    
    //관리자의 결재 상태 반영
    @PostMapping("sendApproval")
    public String sendApproval(String num, String approval, DayoffVo vo, Model model) {
        
        //결재 상태 바꾸는 게시글 setting 해주기
 
        approval = approval.substring(approval.length()-1, approval.length());

        vo.setOffCode(num);
        vo.setOffApproval(approval);
        
        System.out.println(vo);
        int result = service.updateApproval(vo);
        
        
        if(result == 1) {
            return "redirect:/dayoff/admin/1";
        }else {
            model.addAttribute("alertMsg", "결재 실패");
            return "dayoff/adminDayoff";
        }
        
        
    }
    
    
    @GetMapping("calendar")
    public String calendar() {
        return "dayoff/dayoffCal";
    }
    
//    @GetMapping("calendar")
//    public ModelAndView calendar(ModelAndView mv, HttpServletRequest req) {
//        
//        String viewpage = "calendar";
//        List<Calendar> calendar = null;
//        try {
//            calendar = calendarService.getCalendar();
//            request.setAttribute("calendarList", calendar);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        mv.setViewName(viewpage);
//        return mv;
//    }

}
