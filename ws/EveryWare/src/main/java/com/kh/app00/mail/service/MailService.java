package com.kh.app00.mail.service;

import java.util.List;

import com.kh.app00.mail.vo.MailVo;

public interface MailService {
	
	//전체 메일함 조회
	List<MailVo> selectList();
	
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
	List<MailVo> selectRelist();
	
	//메일 답장
	int reply(MailVo mvo);

}
