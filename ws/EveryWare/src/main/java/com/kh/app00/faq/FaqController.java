package com.kh.app00.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("faq")
public class FaqController {

	@GetMapping("faqList")
	public String faqList() {
		return "faq/faqList";
	}
	
}
