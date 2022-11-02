package com.kh.app00.booking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.booking.vo.BookingVo;

@Repository
public class BookingDaoImpl implements BookingDao{

	//예약 목록
	@Override
	public List<BookingVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("bookingMapper.selectList");
	}
	
	
	

}
