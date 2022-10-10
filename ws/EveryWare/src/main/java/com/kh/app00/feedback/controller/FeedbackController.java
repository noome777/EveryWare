package com.kh.app00.feedback.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("feedback")
public class FeedbackController {
	
	@GetMapping("main")
	public String list() {
		return "feedback/list";
	}
	
}
