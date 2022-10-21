package com.kh.app00.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeDao {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList(SqlSessionTemplate sst);
	
	//사내공지 작성
	int insertNotice(SqlSessionTemplate sst, NoticeVo vo);
	
	//사내공지 상세 조회
	NoticeVo selectOne(SqlSessionTemplate sst, String noticeCode);
	
	//조회수 증가
	int increaseHit(SqlSessionTemplate sst, String noticeCode);


}
