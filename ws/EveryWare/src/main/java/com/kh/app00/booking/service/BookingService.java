package com.kh.app00.booking.service;

import java.util.List;

import com.kh.app00.booking.vo.BookingVo;

public interface BookingService {

	//예약 목록
	List<BookingVo> selectList();

}
