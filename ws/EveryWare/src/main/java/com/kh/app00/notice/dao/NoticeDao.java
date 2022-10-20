package com.kh.app00.notice.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeDao {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList(SqlSessionTemplate sst);

}
