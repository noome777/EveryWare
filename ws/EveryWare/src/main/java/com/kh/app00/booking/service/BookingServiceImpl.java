package com.kh.app00.booking.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.booking.dao.BookingDao;
import com.kh.app00.booking.vo.BookingVo;

@Service
public class BookingServiceImpl implements BookingService{

	private final BookingDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public BookingServiceImpl(BookingDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//예약 목록
	@Override
	public List<BookingVo> selectList() {
		return dao.selectList(sst);
	}

}
