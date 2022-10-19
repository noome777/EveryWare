package com.kh.app00.calendar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar/per-calendar";
		List<CalendarVo> calendar = null;
		try {
			calendar = service.getCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	
	@PostMapping("personal/insert")
	public String insert(CalendarVo vo) {
		/*
		 * String calTitle = (String) req.getAttribute("calTitle"); String calContent
		 * =(String) req.getAttribute("calContent"); String calType =(String)
		 * req.getAttribute("calType"); String calStart =(String)
		 * req.getAttribute("calStart"); String startTime =(String)
		 * req.getAttribute("startTime"); String calEnd =(String)
		 * req.getAttribute("calEnd"); String EndTime =(String)
		 * req.getAttribute("EndTime"); String calAllday =(String)
		 * req.getAttribute("calAllday");
		 * 
		 * System.out.println(calTitle); System.out.println(calContent);
		 * System.out.println(calType); System.out.println(calStart);
		 * System.out.println(startTime); System.out.println(calEnd);
		 * System.out.println(EndTime); System.out.println(calAllday);
		 */
		
		System.out.println(vo);
		
		int result = service.insertOne(vo); 
		
		return "redirect:/calendar/personal/select";
	}

	
	
	
	@GetMapping("department/select")
	public String department() {
		
		return "calendar/department-calendar";
	}
}
