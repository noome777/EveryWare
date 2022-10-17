package com.kh.app00.booking.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("booking")
public class BookingController {
	
	//예약 목록
	@GetMapping("bookingList")
	public String bookingList() {
		return "booking/bookingList";
	}

}
