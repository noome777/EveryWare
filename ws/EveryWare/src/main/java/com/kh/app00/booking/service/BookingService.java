package com.kh.app00.booking.service;

import java.util.List;

import com.kh.app00.booking.vo.BookingVo;

public interface BookingService {

	//예약 목록
	List<BookingVo> selectList();

	//예약 작성
	int write(BookingVo vo);

	//예약 삭제
	int delete(String no);

}
