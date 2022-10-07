package com.kh.app00.joonhyeok;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JoonhyeokController {

	@GetMapping("joonhyeok")
	public String pjh() {
		return "joonhyeok";
	}
}
