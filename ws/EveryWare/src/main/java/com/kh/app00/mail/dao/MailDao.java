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

	//휴지통
	List<MailVo> selectTrashlist(SqlSessionTemplate sst);

	//휴지통 비우기
	int clean(SqlSessionTemplate sst,String mailCode);

	//복원
	int back(SqlSessionTemplate sst, String mailCode);

	
	//보낸 메일함 조회
	List<MailVo> selectSendlist(SqlSessionTemplate sst);

	//받은 메일함 조회
	List<MailVo> selectRelist(SqlSessionTemplate sst);

	//답장 작성
	int replyMail(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓰기
	int selfWrite(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓴 메일함 조회
	List<MailVo> selectSelflist(SqlSessionTemplate sst);

	//메일 상세 조회	
	MailVo selectMail(SqlSessionTemplate sst, String mailCode);


	

}
