package com.kh.app00.commute.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.commute.vo.CommuteVo;
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
      Date onTime = new SimpleDateFormat("HH:mm:ss").parse("02:13:00");
      
      if(onTime.before(startFormat)) {
          vo.setComStatus(normal);
          System.out.println(vo);
      }else {
          System.out.println("떙 다시");
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
//      if(9 to 6이면 정상출근) {
//      
//      }else if(9 이후에 오면 지각){
//      
//      }else if(출퇴근 없으면 결근) {
//      
//      }else if(연/반차 안 쓰고 6시 이전에 퇴근하면 조기퇴근) {
//      
//      }
      
      
//      System.out.println(vo);
      
      
      
      
      
      int result = service.insertCommute(vo);
      
      
      if(result == 1) {
          //근태 테이블에 insert 성공
          return "commute/commuteMain";
      }else {
          //실패
          return "error/404";
      }
      
    }
      
     
    @GetMapping("selectByMonth")
    public String selectByMonth() {
        return "commute/selectByMonth";
    }

    @GetMapping("overwork")
    public String overwork() {
        return "commute/overwork";
    }

}
