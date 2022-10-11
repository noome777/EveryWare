package com.kh.app00.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("notice")
public class NoticeController {
		
		
	@GetMapping("main")
	public String noticeMain() {
		return "notice/noticeMain";
		
		}
}
