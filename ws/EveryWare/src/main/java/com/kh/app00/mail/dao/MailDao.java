package com.kh.app00.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailVo;

public interface MailDao {
	
	//전체 메일함 조회
	List<MailVo> selectList(SqlSessionTemplate sst,PageVo pv);
	
	
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
	List<MailVo> selectRelist(SqlSessionTemplate sst,PageVo pv);

	//답장 작성
	int replyMail(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓰기
	int selfWrite(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓴 메일함 조회
	List<MailVo> selectSelflist(SqlSessionTemplate sst);

	//메일 상세 조회	
	MailVo selectMail(SqlSessionTemplate sst, String mailCode);

	//보낸 메일 삭제
	int deleteOne(SqlSessionTemplate sst, String mailCode);

	//메일 메인글 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);

	//메일 삭제 갯수 조회
	int selectDeleteCnt(SqlSessionTemplate sst);

	//조회수 증가
	int increaseViews(SqlSessionTemplate sst, String mailCode);

	//읽음 처리
	int readMail(SqlSessionTemplate sst, String mailCode);
	
	//안읽음 처리
	int noreadMail(SqlSessionTemplate sst, String mailCode);

	//검색 처리
	List<MailVo> selectSearchList(SqlSessionTemplate sst, MailVo mailVo, PageVo pv2);

	//검색 갯수
	int selectSearchTotalCnt(SqlSessionTemplate sst, MailVo mvo);


	

}
