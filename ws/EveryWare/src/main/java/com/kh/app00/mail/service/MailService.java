package com.kh.app00.mail.service;

import java.util.List;

import com.kh.app00.mail.vo.MailVo;

public interface MailService {
	
	//전체 메일함 조회
	List<MailVo> selectList();
	
	//메일 작성
	int write(MailVo mvo);

}
