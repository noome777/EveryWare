package com.kh.app00.notice.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.notice.vo.NoticeFileVo;
import com.kh.app00.notice.vo.NoticeVo;

public interface NoticeService {
	
	//사내공지 목록 조회
	List<NoticeVo> selectList(PageVo pv);
	
	//사내공지 작성
	int write(NoticeVo vo);
	
	//사내공지 상세 조회
	NoticeVo selectOne(String noticeCode);
	
	//전체 개시글 갯수 조회
	int selectTotalCnt();
	
	//게시글 삭제
	int delete(String noticeCode);
	
	//게시글 수정하기
	int edit(NoticeVo nvo);
	
	//파일 첨부
	int fileWrite(NoticeFileVo nfvo);
	
	//파일 선택
	List<NoticeFileVo> selectFile(String noticeFilecode);
	
	//파일 조회
	List<NoticeFileVo> selectNoticeFileList(String noticeCode);
	
	//사내공지 조회
	List<NoticeVo> selectNList();

	
	

}
