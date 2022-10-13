package com.kh.app00.commute.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.commute.vo.CommuteStatusVo;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("commute")
public class CommuteController {

//    private final CommuteService service;

//    @Autowired
//    public CommuteController(CommuteService service) {
//        this.service = service;
//    }

    // 근태 메인화면
    @GetMapping("main")
    public String commuteMain() {
        return "commute/commuteMain";
    }

    // 근태 메인화면에서 출퇴근 버튼 입력 후 submit시
    /*
     * @PostMapping("main")
     * public String commuteMain(CommuteVo vo, HttpSession session, CommuteStatusVo
     * csvo) {
     * System.out.println(vo);
     * 
     * //사원의 코드를 vo에 추가하기
     * EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
     * vo.setEcode(loginMember.getEmpCode());
     * 
     * //사원의 근태 상태를 vo에 추가하기 -> 정상출근/결근/지각/조기퇴근 -> select로 디비 다녀와야되나 ?
     * //ORA-01400: NULL을 ("C##EVERYWARE"."COMMUTE"."END_TIME") 안에 삽입할 수 없습니다
     * //CommuteVo(comCode=null, ecode=3, startTime=9:28:52 PM, endTime=,
     * enrollDate=null, comStatus=null)
     * if(9 to 6이면 정상출근) {
     * 
     * }else if(9 이후에 오면 지각){
     * 
     * }else if(출퇴근 없으면 결근) {
     * 
     * }else if(연/반차 안 쓰고 6시 이전에 퇴근하면 조기퇴근) {
     * 
     * }
     * 
     * vo.setComStatus(csvo.getComStatusName());
     * 
     * System.out.println(vo);
     * int result = service.insertCommute(vo);
     * 
     * 
     * if(result == 1) {
     * //근태 테이블에 insert 성공
     * return "commute/commuteMain";
     * }else {
     * //실패
     * return "error/404";
     * }
     * 
     * }
     * 
     */
    @GetMapping("selectByMonth")
    public String selectByMonth() {
        return "commute/selectByMonth";
    }

    @GetMapping("overwork")
    public String overwork() {
        return "commute/overwork";
    }

}
