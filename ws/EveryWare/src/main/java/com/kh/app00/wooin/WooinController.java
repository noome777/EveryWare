package com.kh.app00.wooin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WooinController {
	
	@GetMapping("wooin")
	public String wooin() {
		return"wooin";
	}
}
