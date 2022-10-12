package com.kh.app00.calendar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("calendar")
public class CalendarController {

	@GetMapping("select")
	public String select() {
		
		return "calendar/calendar";
	}
}
