package com.kh.app00.contacts.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("contacts")
public class ContactController {

	//주소록 목록
	@GetMapping("contactList")
	public String contactList() {
		return "contacts/contactList";
	}
	
	
}
