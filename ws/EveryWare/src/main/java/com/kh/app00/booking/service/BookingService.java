package com.kh.app00.booking.service;

import java.util.List;

import com.kh.app00.booking.vo.BookingVo;
import com.kh.app00.common.PageVo;

public interface BookingService {

	//예약 목록
	List<BookingVo> selectList(PageVo pv);

	//예약 작성
	int write(BookingVo vo);

	//예약 삭제
	int delete(String no);

	//예약 게시물 총 개수
	int selectTotalCnt();

}
