package com.kh.app00.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mail")
public class MailController {
	
	
	@GetMapping("main")
	public String mail() {
		return "mail/mailMain";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		return "mail/mailWrite";
	}
	
	@GetMapping("receive")
	public String mailReceive() {
		return "mail/mailReceive";
	}
	
}
