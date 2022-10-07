package com.kh.app00.eunbi;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Eunbi {
	@GetMapping("eunbi")
	public String eunbi() {
		return "eunbi";
	}
}
