package com.kh.app00.calendar.controller;

import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.app00.calendar.service.CalendarService;
import com.kh.app00.calendar.vo.CalendarVo;

@Controller
@RequestMapping("calendar")
public class CalendarController {

	private final CalendarService service;
	
	@Autowired
	public CalendarController(CalendarService service) {
		this.service = service;
	}
	
	@GetMapping("personal/select")
	public ModelAndView getPerCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar/per-calendar";
		List<CalendarVo> calendar = null;
		try {
			calendar = service.getPerCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	
	@GetMapping("department/select")
	public ModelAndView getDepartCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar/department-calendar";
		List<CalendarVo> calendar = null;
		try {
			calendar = service.getDepartCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	   
	
	@PostMapping("personal/insert")
	public String insert(CalendarVo vo, HttpSession session) {

		System.out.println(vo);
		
		int result = service.insertOne(vo); 
		
		System.out.println(result);
		
		if(result == 1) {
			return "redirect:/calendar/personal/select";			
		}else if(result == -2) {
			session.setAttribute("alertMsg", "제목과 내용을 채워주세요");
		}
		return "redirect:/calendar/personal/select";			

	}
	
	@PostMapping("department/insert")
	public String insert(CalendarVo vo, HttpSession session, Model model) {

		System.out.println(vo);
		
		int result = service.insertOne(vo); 
		
		System.out.println(result);
		
		if(result == 1) {
			return "redirect:/calendar/department/select";			
		}else if(result == -2) {
			session.setAttribute("alertMsg", "제목과 내용을 채워주세요");
		}
		return "redirect:/calendar/department/select";			

	}

	
	@GetMapping("delete")
	public int deleteOne() {
		int result = 1;
		System.out.println("옴");
		return result;
	}
	
	
	@GetMapping("sample")
	public String sample() {
		return "calendar/sample";
	}
}
