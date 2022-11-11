package com.kh.app00.contacts.controller;

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

import com.kh.app00.common.FileUploader;
import com.kh.app00.common.PageVo;
import com.kh.app00.common.Pagination;
import com.kh.app00.commute.service.CommuteService;
import com.kh.app00.contacts.service.ContactsService;
import com.kh.app00.contacts.vo.ContactsVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("contacts")
public class ContactController {

	private final ContactsService service;
	
	@Autowired
	public ContactController(ContactsService service) {
		this.service = service;
	}

	
	//주소록 목록
	@GetMapping("contactList/{pno}")
	public String contactList(Model model , @PathVariable int pno) {
		
		int totalCount = service.selectTotalCnt();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ContactsVo> cList = service.selectList(pv);
		
		model.addAttribute("cList" , cList);
		model.addAttribute("pv" , pv);
		
		return "contacts/contactList";
		
		}
	
	//주소록 삭제
	@GetMapping("delete/{no}")
	public String delete(@PathVariable String no , HttpSession session , Model model) {
		
		int result = service.delete(no);
		
		if(result == 1) {
			//삭제성공
			session.setAttribute("alertMsg", "주소록이 삭제되었습니다.");
			return "redirect:/contacts/contactList/1";
		}else {
			//삭제실패
			model.addAttribute("msg", "삭제 실패하였습니다.");
			return "error/errorPage";
		}
	}
	
	//주소록 작성
	@PostMapping("write")
	public String write(ContactsVo vo , Model model , HttpSession session, HttpServletRequest req) {
		
		if(vo.getProfile() != null && !vo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setFileName(changeName);
		}
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
		
		String empCode = loginMember.getEmpCode();
		
		vo.setConWriter(empCode);
		
		int result = service.write(vo);
		
		if(result == 1) {
			//작성 성공
			session.setAttribute("alertMsg", "주소록이 추가되었습니다.");
			return "redirect:/contacts/contactList/1";
		}else {
			//작성 실패
			model.addAttribute("msg" , "주소록 작성 실패!");
			return "error/errorPage";
		}
	}
	
	//주소록 내용 상세조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no , Model model) {
		
		ContactsVo vo = service.selectOne(no);
		
		model.addAttribute("vo" , vo);
		
		return "contacts/detail";
	}
	
	//주소록 수정_화면
	@GetMapping("edit/{no}")
	public String edit(@PathVariable String no , Model model) {
		ContactsVo vo = service.selectOne(no);
		model.addAttribute("vo" , vo);
		return "contacts/edit";
	}
	
	//주소록 수정
	@PostMapping("edit/{no}")
	public String edit(@PathVariable String no , ContactsVo vo, HttpServletRequest req, HttpSession session) {
		
		String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
		String fileName = vo.getFileName();
		File f = new File(savePath + fileName);
		if(f.exists()) {
			f.delete();
		}
		
		if(!vo.getProfile().isEmpty()) {
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setFileName(changeName);
		}

		vo.setConNo(no);
		
		int result = service.edit(vo);
		
		if(result == 1) {
			//수정 성공
			session.setAttribute("alertMsg", "수정되었습니다.");
			return "redirect:/contacts/contactList/1";
		}else {
			//수정 실패
			session.setAttribute("alertMsg", "수정 실패하였습니다.");
			return "redirect:/";
		}
	}
	
	

}//class
