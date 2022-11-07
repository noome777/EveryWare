package com.kh.app00.booking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.booking.service.BookingService;
import com.kh.app00.booking.vo.BookingVo;
import com.kh.app00.contacts.vo.ContactsVo;
import com.kh.app00.emp.vo.EmpVo;

@Controller
@RequestMapping("booking")
public class BookingController {
	
	private final BookingService service;
	
	@Autowired
	public BookingController(BookingService service) {
		this.service = service;
	}


	//예약 목록
	@GetMapping("bookingList")
	public String bookingList(Model model , HttpServletRequest req) {
		
		List<BookingVo> bList = service.selectList();
		
		model.addAttribute("bList" , bList);
		
		return "booking/bookingList";
	}
	
	//예약 작성
	@PostMapping("write")
	public String write(BookingVo vo , Model model , HttpSession session) {
		
		EmpVo loginMember = (EmpVo)session.getAttribute("loginMember");
		
		String empCode = loginMember.getEmpCode();
		
		vo.setBkWriter(empCode);
		
		int result = service.write(vo);
		
		if(result == 1) {
			//작성 성공
			session.setAttribute("alertMsg", "예약이 추가되었습니다.");
			return "redirect:/booking/bookingList";
		}else {
			//작성 실패
			model.addAttribute("msg" , "예약 추가 실패");
			return "redirect:/";
		}
	}
	
	
	
	//예약 삭제
	
	//예약 수정
	
	
	


}
