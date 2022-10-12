package com.kh.app00.contacts;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("contacts")
public class ContactController {


	@GetMapping("contactList")
	public String contactList() {
		return "contacts/contactList";
	}
	
	
}
