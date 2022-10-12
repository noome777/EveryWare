package com.kh.app00.organization.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("organization")
public class OrganizationController {
	
	@GetMapping("info")
	public String aa() {
		return "organization/info";
	}

}
