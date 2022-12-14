package com.kh.app00.booking.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.booking.vo.BookingVo;
import com.kh.app00.common.PageVo;

public interface BookingDao {

	//예약 목록
	List<BookingVo> selectList(SqlSessionTemplate sst, PageVo pv);

	//예약 작성
	int write(SqlSessionTemplate sst, BookingVo vo);

	//예약 삭제
	int delete(SqlSessionTemplate sst, String no);

	//예약 게시글 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);

}
