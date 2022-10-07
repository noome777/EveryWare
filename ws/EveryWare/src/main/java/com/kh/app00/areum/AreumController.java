package com.kh.app00.areum;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AreumController {
	
	@GetMapping("areum")
	public String areum() {
		return "areum";
	}
	

}
