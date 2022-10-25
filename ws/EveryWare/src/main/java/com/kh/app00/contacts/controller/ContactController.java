package com.kh.app00.contacts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.contacts.service.ContactsService;
import com.kh.app00.contacts.vo.ContactsVo;

@Controller
@RequestMapping("contacts")
public class ContactController {

	private final ContactsService service;
	
	@Autowired
	public ContactController(ContactsService service) {
		this.service = service;
	}

	
	//주소록 목록
	@GetMapping("contactList")
	public String contactList(Model model) {
		
		List<ContactsVo> cList = service.selectList();
		
		model.addAttribute("cList" , cList);
		
		//System.out.println(cList);
		
		return "contacts/contactList";
	}
	
	
	
	
	
}
