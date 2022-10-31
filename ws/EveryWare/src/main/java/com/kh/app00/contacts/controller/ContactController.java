package com.kh.app00.contacts.controller;

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
	@GetMapping("contactList")
	public String contactList(Model model , HttpServletRequest req) {
		
		//String no = ((EmpVo)req.getSession().getAttribute("loginMember")).getEmpCode();
		
		List<ContactsVo> cList = service.selectList();
		
		model.addAttribute("cList" , cList);
		
		return "contacts/contactList";
		
		}
	
	//주소록 삭제
	@GetMapping("contactList/{no}")
	public String delete(@PathVariable String no , HttpSession session , Model model) {
		
		int result = service.delete(no);
		
		if(result == 1) {
			//삭제성공
			session.setAttribute("alertMsg", "주소록이 삭제되었습니다.");
			return "redirect:/contacts/contactList";
		}else {
			//삭제실패
			model.addAttribute("msg", "삭제 실패하였습니다.");
			return "contacts/contactList";
		}
	}
	
	//주소록 작성
	@PostMapping("write")
	public String write(ContactsVo vo , Model model , HttpSession session) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
		String name = loginMember.getEmpName();
		
		vo.setConWriter(name);
		
		int result = service.write(vo);
		
		if(result == 1) {
			//작성 성공
			session.setAttribute("alertMsg", "주소록이 추가되었습니다.");
			return "redirect:/contacts/contactList";
		}else {
			//작성 실패
			model.addAttribute("msg" , "주소록 작성 실패!");
			return "contacts/contactList";
		}
	}
	
	//주소록 내용 상세조회
	@GetMapping("detail/{no}")
	public String detail(@PathVariable String no , Model model) {
		
		ContactsVo vo = service.selectOne(no);
		
		model.addAttribute("vo" , vo);
		
		return "contacts/contactList";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class
