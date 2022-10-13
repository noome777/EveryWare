package com.kh.app00.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("calendar")
public class CalendarController {

	@GetMapping("personal/select")
	public String personal() {
		
		return "calendar/per-calendar";
	}
	
	@GetMapping("department/select")
	public String department() {
		
		return "calendar/department-calendar";
	}
}
