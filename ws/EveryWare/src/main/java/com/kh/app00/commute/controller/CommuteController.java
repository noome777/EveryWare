package com.kh.app00.commute.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.commute.vo.CommuteVo;
import com.kh.app00.commute.vo.OverworkVo;
import com.kh.app00.dayoff.vo.DayoffVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.JobVo;

@Controller
@RequestMapping("commute")
public class CommuteController {

    private final CommuteService service;

    @Autowired
    public CommuteController(CommuteService service) {
        this.service = service;
    }

    // 근태 메인화면 (근태 현황조회, 근무시간 조회, 근태 리스트 조회)
    @GetMapping("main/{pno}")
    public String commuteMain(Model model, HttpSession session, CommuteVo vo, EmpVo empVo,
            @PathVariable int pno, String enrollDate, String comStatus) {

        // 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }

        // 사원의 코드를 vo에 추가하기
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        String rightCode = loginMember.getRightCode();
        vo.setECode(loginMember.getEmpCode());

        if (!rightCode.equals("4")) {
            return "redirect:/commute/main/admin/1";
        }

        // 사원의 프로필 사진 업데이트 반영
        empVo.setEmpCode(loginMember.getEmpCode());
        EmpVo profileVo = service.selectEmpProfile(empVo);

        // emp프로필이 null일떄 체크
        if (profileVo != null) {
            model.addAttribute("profileVo", profileVo.getEmpProfileName());
        }

        // 사원 해당 월 근태 현황 조회
        int normalCnt = service.selectNormalCnt(vo);
        int earlyCnt = service.selectEarlyCnt(vo);
        int lateCnt = service.selectLateCnt(vo);
        int absentCnt = service.selectAbsentCnt(vo);

        model.addAttribute("normalCnt", normalCnt);
        model.addAttribute("earlyCnt", earlyCnt);
        model.addAttribute("lateCnt", lateCnt);
        model.addAttribute("absentCnt", absentCnt);

        // 사원의 해당 월 근무 시간 조회
        int workDays = service.selectWorkDays(vo);
        int workTimeAll = service.seletWorkTimeAll(vo);
        double workTimeAvg = (double) service.selectWorkTimeAvg(vo);
        int workToday = service.selectWorkToday(vo);

        model.addAttribute("workDays", workDays);
        model.addAttribute("workTimeAll", workTimeAll);
        model.addAttribute("workTimeAvg", workTimeAvg);
        model.addAttribute("workToday", workToday);

        // 사원 근태 리스트 조회
        if (enrollDate != null && comStatus != null) {
            // 기간 선택 했을 시
            vo.setEnrollDate(enrollDate);
            vo.setComStatus(comStatus);

            String enrollDate1 = vo.getEnrollDate().substring(0, 10);
            String enrollDate2 = vo.getEnrollDate().substring(11);

            // 사원의 근태 목록 조회(+페이징)
            int commuteDateCnt = service.selectCommuteDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(commuteDateCnt, pno, 5, 5);

            List<CommuteVo> comDateList = service.selectCommuteDateList(pv2, vo);

            model.addAttribute("comDateList", comDateList);
            model.addAttribute("pv", pv2);
            model.addAttribute("enrollDate1", enrollDate1);
            model.addAttribute("enrollDate2", enrollDate2);
            model.addAttribute("comStatus", vo.getComStatus());
            model.addAttribute("commuteDateCnt", commuteDateCnt);

        } else {
            // 기간 선택 안 했을경우
            // 사원의 근태 전체 목록 조회 (+ 페이징)
            int commuteCnt = service.selectCommuteTotalCnt(vo);
            PageVo pv = Pagination.getPageVo(commuteCnt, pno, 5, 5);

            List<CommuteVo> comList = service.selectCommuteList(pv, vo);

            model.addAttribute("comList", comList);
            model.addAttribute("pv", pv);
            model.addAttribute("commuteCnt", commuteCnt);
        }

        return "commute/commuteMain";
    }

    // 관리자 출퇴근 기록 조회
    @GetMapping("main/admin/{pno}")
    public String commuteMainAdmin(@PathVariable int pno) {
        return "commute/commuteAdminMain";
    }
    
    //관리자 출퇴근 기록 조회 (job, 사원이름 검색 실행)
    @PostMapping("main/admin/{pno}")
    public String commuteAdminSearch(@PathVariable int pno, String jobCode, 
            String name, CommuteVo vo, Model model) {

        if(jobCode != null && name != null) {
            
            //부서, 사원명으로 검색시
            //사원 이름
            EmpVo empVo = new EmpVo();
            empVo.setEmpName(name);
            empVo.setEmpJobCode(jobCode);
            
            //페이징 아직 안함
//            int commuteDateCnt = service.selectCommuteDateCnt(vo);
//            PageVo pv2 = Pagination.getPageVo(commuteDateCnt, pno, 5, 5);

            List<CommuteVo> voList = service.selectCommuteAdminList(empVo);
            model.addAttribute("voList", voList);
            
        }else {

            //출퇴근 전체 리스트 조회
//            List<CommuteVo> totalList = service.selectAdminTotalList();
            
//            int commuteCnt = service.selectCommuteTotalCnt(vo);
//            PageVo pv = Pagination.getPageVo(commuteCnt, pno, 5, 5);
//            
//            model.addAttribute("totalList", totalList);
            
        }
        
        
        
        return "commute/commuteAdminMain";
    }
    

    // 근태 메인화면에서 출퇴근 버튼 입력 후 submit시
    @PostMapping("main/{pno}")
    public String commuteMain(CommuteVo vo, HttpSession session,
            @PathVariable int pno, Model model, HttpServletResponse resp, HttpServletRequest req) throws ParseException{

        // 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
            return "redirect:/emp/login";
        }

        // 사원의 코드를 vo에 추가하기
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());

        // 사원의 근태 상태를 vo에 추가하기 -> 정상출근/결근/지각/조기퇴근 -> 클래스 따로 만들어서 작업하기
        String normal = "정상출근";
        String absent = "결근";
        String late = "지각";
        String early = "조기퇴근";

        String starTime = vo.getStartTime();
        String endTime = vo.getEndTime();
        String startTimeFormat = vo.getStartTimeFormat();
        String endTimeFormat = vo.getEndTimeFormat();

        SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");

        Date startFormat = format.parse(starTime);
        Date endFormat = format.parse(endTime);
        Date onTimeIn = new SimpleDateFormat("HH:mm:ss").parse("09:00:00");
        Date onTimeOut = new SimpleDateFormat("HH:mm:ss").parse("18:00:00");

        // 수정!!----------------------------------
        if (onTimeIn.after(startFormat) || onTimeIn.equals(startFormat)) {
            if (onTimeOut.after(endFormat)) {
                // 조기퇴근
                vo.setComStatus(early);
            } else {
                // 정상출근
                vo.setComStatus(normal);
            }
        } else if (onTimeIn.before(startFormat)) {
            if (onTimeOut.before(endFormat)) {
                // 결근
                vo.setComStatus(absent);
            } else {
                // 지각
                vo.setComStatus(late);
            }
        }
        System.out.println(vo);

        // DB 에 사원의 근태 insert
        int result = service.insertCommute(vo);
        if (result == 1) {
            // 근태 테이블에 insert 성공
            
            // 메인화면 근태 위젯에 출퇴근 시간 표시 -> 쿠키로 해서 세션??
            model.addAttribute("startTimeFormat", startTimeFormat);
            model.addAttribute("endTimeFormat", endTimeFormat);
            
            return "redirect:/commute/main/1";

        } else {
            // 실패
            return "error/404";
        }
    }

    // 월 근무 내역 조회
    @GetMapping("selectByMonth")
    public String selectByMonth() {
        return "commute/selectByMonth";
    }

    // 시간 외 근무 화면 && 리스트 조회
    @GetMapping("overwork/{pno}")
    public String overwork(OverworkVo vo, Model model, HttpSession session,
            @PathVariable int pno, String overDate) {
        System.out.println(overDate);

        // 사원 정보 vo에 저장
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());
        vo.setDeptCode(loginMember.getDeptCode());

        // 만약, 로그인 유저가 관리자, 결재 관리자, 인사 관리자 등등이면 다른 페이지 보여주기 (RIGHT_CODE가 4가 아닐 때)
        // RIGHT_CODE 조회하기
        EmpVo rvo = service.selectRightVo(vo);

        if (!rvo.getRightCode().equals("4")) {
            return "redirect:/commute/admin/1";
        }

        // 변경 예정
//        if (rvo.getRightCode().equals("1") || rvo.getRightCode().equals("2")) {
//            return "redirect:/commute/admin/1";
//        }

        // 기간 선택 조회 여부(시간 외 근무 메인의 전체리스트 || 기간 선택 후 리스트)
        if (overDate != null) {
            // 기간 선택을 했을 경우
            // 사원의 시간 외 근무 기간 선택 목록 조회 (+페이징)
            vo.setOverDate(overDate);

            // 기간 선택 후 신청글 수 조회
            int dateCount = service.selectDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(dateCount, pno, 5, 5);

            List<OverworkVo> dateList = service.selectDateList(vo, pv2);

            model.addAttribute("dateList", dateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("dateCount", dateCount);

        } else {
            // 기간 선택을 안 했을 경우
            // 사원의 시간 외 근무 전체 목록 조회 (+ 페이징)
            int listCount = service.selectTotalCnt(vo);
            PageVo pv = Pagination.getPageVo(listCount, pno, 5, 5);

            List<OverworkVo> voList = service.overworkList(vo, pv);

            model.addAttribute("voList", voList);
            model.addAttribute("pv", pv);
            model.addAttribute("listCount", listCount);

        }

        return "commute/overwork";
    }

    // 시간 외 근무 신청
    @PostMapping("overwork/{pno}")
    public String overwork(OverworkVo vo, HttpSession session, @PathVariable int pno, String overDate) {

        // 사원 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        vo.setECode(loginMember.getEmpCode());

        // 사원의 부서 정보 vo에 저장
        DayoffVo deptVo = service.getDeptVo(vo);
        vo.setDeptCode(deptVo.getDeptCode());

        if (overDate.length() == 21) {
            vo.setOverDate(overDate.substring(11));
        }

        // DB에 신청 정보 insert
        int result = service.insertOver(vo);

        if (result == 1) {
            session.setAttribute("alertMsg", "연장 근무 신청이 완료 되었습니다.");
            return "redirect:/commute/overwork/1";
        } else {
            session.setAttribute("alertMsg", "신청에 실패하셨습니다.");
            return "commute/overwork";
        }

    }

    // 시간 외 근무의 관리자 페이지 (시간 외 근무 결재)
    @GetMapping("admin/{pno}")
    public String overworkAdmin(@PathVariable int pno, Model model, OverworkVo vo,
            String overDate) {

        // 기간 선택 조회 여부(시간 외 근무 메인의 전체리스트 || 기간 선택 후 리스트)
        if (overDate != null) {
            // 기간 선택을 했을 경우
            // 사원의 시간 외 근무 기간 선택 목록 조회 (+페이징)
            vo.setOverDate(overDate);

            // 기간 선택 후 신청글 수 조회
            int adDateCount = service.selectAdDateCnt(vo);
            PageVo pv2 = Pagination.getPageVo(adDateCount, pno, 5, 10);

            List<OverworkVo> AdDateList = service.selectAdDateList(vo, pv2);

            model.addAttribute("AdDateList", AdDateList);
            model.addAttribute("vo", vo);
            model.addAttribute("pv", pv2);
            model.addAttribute("adDateCount", adDateCount);

        } else {
            // 기간 선택을 안 했을 경우
            // 사원의 시간 외 근무 전체 목록 조회 (+ 페이징)
            int adListCount = service.selectAdminTotalCnt();
            PageVo pv = Pagination.getPageVo(adListCount, pno, 5, 10);

            List<OverworkVo> voList = service.adminOverworkList(pv);

            model.addAttribute("voList", voList);
            model.addAttribute("pv", pv);
            model.addAttribute("adListCount", adListCount);

        }

        return "commute/adminOverwork";
    }

    // 관리자의 결재 상태 반영
    @PostMapping("sendApproval")
    public String sendApproval(String num, String approval, OverworkVo vo, Model model) {

        // 결재 상태 바꾸는 게시글 setting 해주기

        approval = approval.substring(approval.length() - 1, approval.length());

        vo.setOverCode(num);
        vo.setOverApproval(approval);

        int result = service.updateApproval(vo);

        if (result == 1) {
            return "redirect:/commute/admin/1";
        } else {
            model.addAttribute("alertMsg", "결재 실패");
            return "commute/adminOverwork";
        }

    }

}
