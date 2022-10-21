package com.kh.app00.notice.service;

import java.util.List;

import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeService {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList();
	
	//사내공지 작성
	int write(NoticeVo vo);
	
	//사내공지 상세 조회
	NoticeVo selectOne(String noticeCode);

}
