package com.kh.app00.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.mail.vo.MailVo;

public interface MailDao {
	
	//전체 메일함 조회
	List<MailVo> selectList(SqlSessionTemplate sst);
	
	
	//메일 작성
	int insertMail(SqlSessionTemplate sst, MailVo mvo);

	//선택 삭제
	int deleteMail(SqlSessionTemplate sst, String mailCode);
	

}
