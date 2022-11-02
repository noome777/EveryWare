package com.kh.app00.booking.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.app00.booking.service.BookingService;
import com.kh.app00.booking.vo.BookingVo;

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
	
	
	
	//예약 추가
	
	//예약 상세
	
	//예약 삭제
	

	
	

}
