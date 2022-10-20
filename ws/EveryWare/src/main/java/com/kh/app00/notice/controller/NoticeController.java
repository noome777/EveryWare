package com.kh.app00.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.notice.service.NoticeService;
import com.kh.app00.notice.vo.NoticeVo;

@Controller
@RequestMapping("notice")
public class NoticeController {

	private final NoticeService ns;

	@Autowired
	public NoticeController(NoticeService ns) {
		this.ns = ns;
	}
	
	//사내공지 목록 조회
	@GetMapping("main")
	public String noticeMain(Model model) {
		
		//Pagevo pv = Pagination.getPagevo(totalCount, pno, 5, 10); 
		
		List<NoticeVo> nList = ns.selectList();

		model.addAttribute("nList", nList);

		System.out.println(nList);
		return "notice/noticeMain";

	}

	@GetMapping("write")
	public String noticeWrite() {
		return "notice/noticeWrite";

	}

	@GetMapping("detail")
	public String noticeDetail() {
		return "notice/noticeDetail";

	}
}
