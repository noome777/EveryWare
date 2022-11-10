package com.kh.app00.booking.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.booking.vo.BookingVo;
import com.kh.app00.common.PageVo;

@Repository
public class BookingDaoImpl implements BookingDao{

	//예약 목록
	@Override
	public List<BookingVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("bookingMapper.selectList", null, rb);
	}

	//예약 작성
	@Override
	public int write(SqlSessionTemplate sst, BookingVo vo) {
		return sst.insert("bookingMapper.insertOne", vo);
	}

	//예약 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String no) {
		return sst.delete("bookingMapper.deleteOne", no);
	}

	//예약 게시글 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("bookingMapper.selectCountAll");
	}
	
	
	

}
