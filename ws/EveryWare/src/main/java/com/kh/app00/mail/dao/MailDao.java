package com.kh.app00.mail.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.mail.vo.MailVo;

public interface MailDao {
	
	//전체 메일함 조회
	List<MailVo> selectList(SqlSessionTemplate sst,String id,PageVo pv);
	
	
	//메일 작성
	int insertMail(SqlSessionTemplate sst, MailVo mvo);

	//선택 삭제
	int deleteMail(SqlSessionTemplate sst, String mailCode);

	//휴지통
	List<MailVo> selectTrashlist(SqlSessionTemplate sst,String id,PageVo pv);

	//휴지통 비우기
	int clean(SqlSessionTemplate sst,String mailCode);

	//복원
	int back(SqlSessionTemplate sst, String mailCode);

	
	//보낸 메일함 조회
	List<MailVo> selectSendlist(SqlSessionTemplate sst,String id, PageVo pv);

	//받은 메일함 조회
	List<MailVo> selectRelist(SqlSessionTemplate sst,String id,PageVo pv);

	//답장 작성
	int replyMail(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓰기
	int selfWrite(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓴 메일함 조회
	List<MailVo> selectSelflist(SqlSessionTemplate sst,String id, PageVo pv);

	//메일 상세 조회	
	MailVo selectMail(SqlSessionTemplate sst, String mailCode);

	//보낸 메일 삭제
	int deleteOne(SqlSessionTemplate sst, String mailCode);

	//메일 메인글 갯수 조회
	int selectCountAll(SqlSessionTemplate sst, String id);

	//메일 삭제 갯수 조회
	int selectDeleteCnt(SqlSessionTemplate sst);

	//조회수 증가
	int increaseViews(SqlSessionTemplate sst, String mailCode);

	//읽음 처리
	int readMail(SqlSessionTemplate sst, String mailCode);
	
	//안읽음 처리
	int noreadMail(SqlSessionTemplate sst, String mailCode);

	//검색 처리
	List<MailVo> selectSearchList(SqlSessionTemplate sst,MailVo mvo, PageVo pv2);

	//검색 갯수
	int selectSearchTotalCnt(SqlSessionTemplate sst, MailVo mvo);

	//파일 첨부
	int insertFile(SqlSessionTemplate sst, MailFileVo mfvo);

	//파일 선택
	List<MailFileVo> selectFile(SqlSessionTemplate sst, String mailFilecode);

	//파일 조회
	List<MailFileVo> selectMailFileList(SqlSessionTemplate sst, String mailCode);

	
	//보낸 메일함 갯수
	int selectSendTotalCnt(SqlSessionTemplate sst, String id);

	//내게 보낸 메일함 갯수
	int selectSelfTotalCnt(SqlSessionTemplate sst, String id);
	
	//보낸 메일함 검색 처리
	List<MailVo> selectSearchSendList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2);

	//보낸 메일함 검색 갯수
	int selectSearchSendCnt(SqlSessionTemplate sst, MailVo mvo);

	//내게 쓴 메일함 검색 처리
	List<MailVo> selectSearchSelfList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2);

	//내게 쓴 메일함 갯수 조회
	int selectSearchSelfCnt(SqlSessionTemplate sst, MailVo mvo);

	//휴지통  검색 리스트
	List<MailVo> selectSearchTrashList(SqlSessionTemplate sst, MailVo mvo, PageVo pv2);

	//휴지통 검색 리스트 갯수
	int selectSearchTrashCnt(SqlSessionTemplate sst, MailVo mvo);




	

}
