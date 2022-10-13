package com.kh.app00;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TempController {
	
	@GetMapping("zzz")
	@ResponseBody
	public String zzz() {
		return "zzzzzzz";
	}

}
