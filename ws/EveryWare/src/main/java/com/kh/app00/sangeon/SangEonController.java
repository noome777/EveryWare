package com.kh.app00.sangeon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SangEonController {

	@GetMapping("sangeon")
	public String sangeon() {
		return "sangeon";
	}
}
