package com.kh.app00.notice.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.app00.emp.vo.EmpVo;
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

	// 사내공지 목록 조회
	@GetMapping("main")
	public String noticeMain(Model model) {

		// Pagevo pv = Pagination.getPagevo(totalCount, pno, 5, 10);

		List<NoticeVo> nList = ns.selectList();

		model.addAttribute("nList", nList);

		System.out.println(nList);
		return "notice/noticeMain";

	}

	// 게시글 작성 (관리자 계정만)
	@GetMapping("write")
	public String noticeWrite() {
		return "notice/noticeWrite";

	}

	@PostMapping("write")
	public String write(NoticeVo vo, Model model, HttpSession session, EmpVo evo) {
		
			
			EmpVo loginMember = (EmpVo) session.getAttribute("loginMember");
			String no = loginMember.getEmpCode();
			
			evo.setDeptCode(no);
			
			int result = ns.write(vo);
			
			System.out.println(vo);
			
			// 화면 선택
			if (result == 1) {
				session.setAttribute("alertMsg", "사내공지 작성 성공!");
				return "redirect:/notice/noticeMain";
			} else {
				model.addAttribute("msg", "사내공지 작성 실패...");
				return "error/errorPage";
			}

		}
		
		

	// 상세 조회
	@GetMapping("detail/{noticeCode}")
	public String noticeDetail(@PathVariable String noticeCode, Model model) {

		NoticeVo nvo = ns.selectOne(noticeCode);

		model.addAttribute("nvo", nvo);
		return "notice/noticeDetail";

	}
}
