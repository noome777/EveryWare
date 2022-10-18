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
	
	@GetMapping("send")
	public String mailSend() {
		return "mail/mailSend";
	}
	
	@GetMapping("self")
	public String mailSelf() {
		return "mail/mailSelf";
	}
	
	@GetMapping("trash")
	public String mailTrash() {
		return "mail/mailTrash";
	}
	
	@GetMapping("detail")
	public String mailDetail() {
		return "mail/mailDetail";
	}
}
