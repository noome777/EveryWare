package com.kh.app00.calendar.controller;

import java.util.List;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.app00.calendar.service.CalendarService;
import com.kh.app00.calendar.vo.CalendarVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("calendar")
public class CalendarController {

	private final CalendarService service;
	
	@Autowired
	public CalendarController(CalendarService service) {
		this.service = service;
	}
	
	
	/**
	 * 개인일정 조회
	 * @param mv
	 * @param request
	 * @param session
	 * @return
	 */
	@GetMapping("personal/select")
	public ModelAndView getPerCalendarList(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		// 로그인 여부 체크
        if (session.getAttribute("loginMember") == null) {
            session.setAttribute("alertMsg", "로그인 후 접근 가능합니다 !");
        }
        
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
		String viewpage = "calendar/per-calendar";
		List<CalendarVo> calendar = null;
		try {
			calendar = service.getPerCalendar(loginMember.getEmpCode());
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	/**
	 * 부서일정 조회
	 * @param mv
	 * @param request
	 * @param session
	 * @return
	 */
	@GetMapping("department/select")
	public ModelAndView getDepartCalendarList(ModelAndView mv, HttpServletRequest request, HttpSession session) {
		// 로그인 여부 체크
        
        // 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
        System.out.println(loginMember);
        
		String viewpage = "calendar/department-calendar";
		List<CalendarVo> calendar = null;
		try {
			calendar = service.getDepartCalendar(loginMember.getDeptCode());
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	   
	
	/**
	 * 개인일정 작성
	 * @param vo
	 * @param session
	 * @return
	 */
	@PostMapping("personal/insert")
	public String insert(CalendarVo vo, HttpSession session) {
		// 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
        vo.setEmpCode(loginMember.getEmpCode());
        
		int result = service.insertOne(vo); 
		
		if(result == 1) {
			return "redirect:/calendar/personal/select";			
		}else if(result == -2) {
			session.setAttribute("alertMsg", "제목과 내용을 채워주세요");
		}
		return "redirect:/calendar/personal/select";			

	}
	
	/**
	 * 부서일정 작성
	 * @param vo
	 * @param session
	 * @param model
	 * @return
	 */
	@PostMapping("department/insert")
	public String insert(CalendarVo vo, HttpSession session, Model model) {
		// 로그인 유저의 정보 vo에 저장
        EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
        
        vo.setEmpCode(loginMember.getEmpCode());
        
		int result = service.insertOne(vo); 
		
		if(result == 1) {
			return "redirect:/calendar/department/select";			
		}else if(result == -2) {
			session.setAttribute("alertMsg", "제목과 내용을 채워주세요");
		}
		return "redirect:/calendar/department/select";			

	}

	/**
	 * 일정 삭제기능
	 * @param param
	 * @return
	 */
	@ResponseBody
	@PostMapping("delete")
	 public List<Map<String, Object>> deleteOne(@RequestBody List<Map<String, Object>> param) {
        //0번째 row에서 date컬럼 값을 String으로 가져옴
        String no = param.get(0).get("no").toString();

        //가져온 값 확인
        
        int result = service.deleteOne(no);
        
		return param;
	}
}
