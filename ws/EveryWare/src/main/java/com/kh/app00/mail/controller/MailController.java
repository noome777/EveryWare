package com.kh.app00.mail.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.mail.service.MailService;
import com.kh.app00.mail.vo.MailVo;

@Controller
@RequestMapping("mail")
public class MailController {
	
	private final MailService ms;
	
	@Autowired
	public MailController(MailService ms) {
		this.ms = ms;
	}

	@GetMapping("mailMain")
	public String mailMain(Model model) {
		
		List<MailVo> mList = ms.selectList();
		
		model.addAttribute("mList", mList);
		
		System.out.println("mList : " + mList);
		
		return "mail/mailMain";
	}
	
	@GetMapping("write")
	public String mailWrite() {
		return "mail/mailWrite";
	}
	
	@GetMapping("reply")
	public String mailReply() {
		return "mail/mailReply";
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
