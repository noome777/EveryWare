package com.kh.app00.notice.service;

import java.util.List;

import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeService {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList();

}
