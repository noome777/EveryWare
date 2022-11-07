package com.kh.app00.booking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.booking.vo.BookingVo;

public interface BookingDao {

	//예약 목록
	List<BookingVo> selectList(SqlSessionTemplate sst);

	//예약 작성
	int write(SqlSessionTemplate sst, BookingVo vo);

}
