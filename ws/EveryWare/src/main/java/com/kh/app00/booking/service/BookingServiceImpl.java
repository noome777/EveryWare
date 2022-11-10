package com.kh.app00.booking.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.booking.dao.BookingDao;
import com.kh.app00.booking.vo.BookingVo;
import com.kh.app00.common.PageVo;

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
	public List<BookingVo> selectList(PageVo pv) {
		return dao.selectList(sst, pv);
	}

	//예약 작성
	@Override
	public int write(BookingVo vo) {
		return dao.write(sst, vo);
	}

	//예약 삭제
	@Override
	public int delete(String no) {
		return dao.delete(sst, no);
	}

	//예약 게시글 갯수 조회
	@Override
	public int selectTotalCnt() {
		return dao.selectCountAll(sst);
	}

}
