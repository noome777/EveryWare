package com.kh.app00.commute.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("commute")
public class CommuteController {

      private final CommuteService service;

      @Autowired
      public CommuteController(CommuteService service) {
        this.service = service;
      }

      // 근태 메인화면
      @GetMapping("main")
      public String commuteMain() {
        return "commute/commuteMain";
      }

      // 근태 메인화면에서 출퇴근 버튼 입력 후 submit시
      @PostMapping("main")
      public String commuteMain(CommuteVo vo, HttpSession session) throws ParseException {
          
       
//      if(loginMember != null) {
//          session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
//          return "redirect:/emp/login";
//      }
      
      System.out.println(vo);
      
      //사원의 코드를 vo에 추가하기
      EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
      vo.setECode(loginMember.getEmpCode());
      
      
      //사원의 근태 상태를 vo에 추가하기 -> 정상출근/결근/지각/조기퇴근 -> 클래스 따로 만들어서 작업하기
      String normal = "정상출근";
      String absent = "결근";
      String late = "지각";
      String early = "조기퇴근";
      
      String starTime = vo.getStartTime().substring(0,7);
      String endTime = vo.getStartTime().substring(0,7);
      
      SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
      
      Date startFormat = format.parse(starTime);
      Date endFormat = format.parse(endTime);
      Date onTimeIn = new SimpleDateFormat("HH:mm:ss").parse("01:15:00");
      Date onTimeOut = new SimpleDateFormat("HH:mm:ss").parse("01:15:00");
      
      if(onTimeIn.after(startFormat)) {
          //정상출근
          vo.setComStatus(normal);
      }else if(onTimeIn.before(startFormat) && onTimeOut.before(endFormat)) {
          //지각
          vo.setComStatus(late);
      }
//      else if{
//          //조기퇴근
//      }else {
//          //결근
//      }
      System.out.println(vo);
      
      //DB 에 사원의 근태 insert
      int result = service.insertCommute(vo);
      
      //사원의 근태 목록 조회 (+ 페이징)
//      PageVo pv = Pagination.getPageVo(result, result, result, result);
//      List<CommuteVo> voList = service.commuteList();
      
      
      if(result == 1) {
          //근태 테이블에 insert 성공
          return "commute/commuteMain";
      }else {
          //실패
          return "error/404";
      }
      
    }
      
      
      
      
      
      
      
      
//      System.out.println(startTime);
//      System.out.println(endTime);
//      System.out.println(onTime);
      
//      Date format = new SimpleDateFormat("HH:mm:ss");
//      
//      Date startTime = format.parse(vo.getStartTime().substring(0,7));
//      Date endTime = null;;
//      
//        try {
//            startTime = format.parse(vo.getStartTime().substring(0,7));
//            endTime = format.parse(vo.getEndTime().substring(0,7));
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }
//      
//      System.out.println(startTime.toString());
//      System.out.println(endTime.toString());
//   
//
//      Date d1 = null;
//      Date d2 = null;
//      try {
//          d1 = format.parse(startTime);
//          d2 = format.parse(endTime);
//      } catch (ParseException e) {
//          e.printStackTrace();
//      }    
//      
//      long diff = d1.
//      
//      System.out.println(diff);
      //사원의 근태 상태를 vo에 추가하기 -> 정상출근/결근/지각/조기퇴근
      //ORA-01400: NULL을 ("C##EVERYWARE"."COMMUTE"."END_TIME") 안에 삽입할 수 없습니다
      //CommuteVo(comCode=null, ecode=3, startTime=9:28:52 PM, endTime=, enrollDate=null, comStatus=null)
//      if(9 to 6이면 정상출근 ) {
//      
//      }else if(9 이후에 출근 && 6시 이후 퇴근하면 지각){
//      
//      }else if(출퇴근 없으면 결근) {
//      
//      }else if(연/반차 안 쓰고 6시 이전에 퇴근하면 조기퇴근) {
//      
//      }
      
      
//      System.out.println(vo);
      
      
      
      
      
      
      
     
    @GetMapping("selectByMonth")
    public String selectByMonth() {
        return "commute/selectByMonth";
    }

    
    
    //시간 외 근무 화면 && 리스트 조회
    @GetMapping("overwork/{pno}")
    public String overwork(OverworkVo vo, Model model, HttpSession session, 
            @PathVariable int pno, String overDate) {
        System.out.println(overDate);
        
        //사원 정보 vo에 저장
        //로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        vo.setDeptCode(loginMember.getDeptCode());
        
        //만약, 로그인 유저가 관리자, 결재 관리자, 인사 관리자 등등이면 다른 페이지 보여주기 (RIGHT_CODE가 4가 아닐 때)
        //RIGHT_CODE 조회하기
        EmpVo rvo = service.selectRightVo(vo);
        
        if(!rvo.getRightCode().equals("4")) {
            return "redirect:/commute/admin/1";
        }
        
        //기간 선택 조회 여부(시간 외 근무 메인의 전체리스트 || 기간 선택 후 리스트)
        if(overDate != null) {
            //기간 선택을 했을 경우
            //사원의 시간 외 근무 기간 선택 목록 조회 (+페이징)
            vo.setOverDate(overDate);
            
            //기간 선택 후 신청글 수 조회
            int dateCount = service.selectDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(dateCount, pno, 5, 5);
            
            List<OverworkVo> dateList = service.selectDateList(vo, pv2);
            System.out.println(dateList);
            
            model.addAttribute("dateList", dateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("dateCount", dateCount);
            
        }else {
            //기간 선택을 안 했을 경우
            //사원의 시간 외 근무 전체 목록 조회 (+ 페이징)
            int listCount = service.selectTotalCnt(vo);
            PageVo pv = Pagination.getPageVo(listCount, pno, 5, 5);
            
            List<OverworkVo> voList = service.overworkList(vo, pv);
            
            model.addAttribute("voList", voList);
            model.addAttribute("pv", pv);
            model.addAttribute("listCount", listCount);
            
        }
        
        return "commute/overwork";
    }
    
    
    //시간 외 근무 신청
    @PostMapping("overwork/{pno}")
    public String overwork(OverworkVo vo, HttpSession session, @PathVariable int pno, String overDate) {
        
        //사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        
        //사원의 부서 정보 vo에 저장
        DayoffVo deptVo = service.getDeptVo(vo);
        vo.setDeptCode(deptVo.getDeptCode());
        
        if(overDate.length() == 21) {
            vo.setOverDate(overDate.substring(11));
        }
        
        //DB에 신청 정보 insert
        int result = service.insertOver(vo);
        
        if(result == 1) {
            session.setAttribute("alertMsg", "연장 근무 신청이 완료 되었습니다.");
            return "redirect:/commute/overwork/1";
        } else {
            session.setAttribute("alertMsg", "신청에 실패하셨습니다.");
            return "commute/overwork";
        }
        
    }
    
    //시간 외 근무의 관리자 페이지
    @GetMapping("admin/{pno}")
    public String overworkAdmin(@PathVariable int pno, Model model, OverworkVo vo, 
            String overDate) {
        
        //기간 선택 조회 여부(시간 외 근무 메인의 전체리스트 || 기간 선택 후 리스트)
        if(overDate != null) {
            //기간 선택을 했을 경우
            //사원의 시간 외 근무 기간 선택 목록 조회 (+페이징)
            vo.setOverDate(overDate);
            
            //기간 선택 후 신청글 수 조회
            int adDateCount = service.selectAdDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(adDateCount, pno, 5, 10);
            
            List<OverworkVo> AdDateList = service.selectAdDateList(vo, pv2);
            
            model.addAttribute("AdDateList", AdDateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("adDateCount", adDateCount);
            
        }else {
            //기간 선택을 안 했을 경우
            //사원의 시간 외 근무 전체 목록 조회 (+ 페이징)
            int adListCount = service.selectAdminTotalCnt();
            PageVo pv = Pagination.getPageVo(adListCount, pno, 5, 10);
            
            List<OverworkVo> voList = service.adminOverworkList(pv);
            
            model.addAttribute("voList", voList);
            model.addAttribute("pv", pv);
            model.addAttribute("adListCount", adListCount);
            
        }
        
        return "commute/adminOverwork";
    }

    
    
}
