package com.kh.app00.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeDao {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList(SqlSessionTemplate sst,PageVo pv);
	
	//사내공지 작성
	int insertNotice(SqlSessionTemplate sst,NoticeVo vo);
	
	//사내공지 상세 조회
	NoticeVo selectOne(SqlSessionTemplate sst, String noticeCode);
	
	//조회수 증가
	int increaseViews(SqlSessionTemplate sst, String noticeCode);
	
	//게시글 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);
	
	//게시글 삭제
	int delete(SqlSessionTemplate sst, String noticeCode);
	
	//게시글 수정
	int updateOne(SqlSessionTemplate sst, NoticeVo nvo);


}
