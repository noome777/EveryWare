package com.kh.app00.mail.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailVo;

public interface MailService {
	
	//전체 메일함 조회
	List<MailVo> selectList(PageVo pv);
	
	//게시글 조회
	int selectTotalCnt();
	
	//메일 작성
	int write(MailVo mvo);
	
	//메일 삭제
	int delete(String mailCode);
	
	//휴지통
	List<MailVo> selectTrashlist();
	
	//휴지통 비우기
	int clean(String mailCode);
	
	//복원
	int back(String mailCode);
	
	//보낸 메일함 조회
	List<MailVo> selectSendlist();
	
	//받은 메일함
	List<MailVo> selectRelist(PageVo pv);
	
	//메일 답장
	int reply(MailVo mvo);
	
	//내게 쓰기
	int selfWrite(MailVo mvo);
	
	//내게 쓴 메일함
	List<MailVo> selectSelflist();
	
	//메일 상세조회
	MailVo selectOne(String mailCode);
	
	//보낸 메일 삭제
	int deleteOne(String mailCode);
	
	//삭제 메일 개수 조회
	int selectDeleteCnt();
	
	//읽음 처리
	int read(String mailCode);
	
	//안읽음 처리
	int noread(String mailCode);
	
	//검색 처리
	List<MailVo> selectSearchList(MailVo mailVo, PageVo pv2);
	
	//리스트 카운트
	int selectSearchTotalCnt(MailVo mvo);

	
	
	

}
