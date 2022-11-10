package com.kh.app00.mail.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.dao.MailDao;
import com.kh.app00.mail.vo.MailFileVo;
import com.kh.app00.mail.vo.MailVo;

@Service
public class MailServiceImpl implements MailService{
	
	private final MailDao dao;
	private final SqlSessionTemplate sst;
	
	public MailServiceImpl(MailDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}


	@Override
	public List<MailVo> selectList(String id,PageVo pv) {
		return dao.selectList(sst,id,pv);
	}


	@Override
	public int write(MailVo mvo) {
		return dao.insertMail(sst, mvo);
	}


	@Override
	public int delete(String mailCode) {
		return dao.deleteMail(sst, mailCode);
	}


	@Override
	public List<MailVo> selectTrashlist(String id,PageVo pv) {
		return dao.selectTrashlist(sst,id, pv);
	}


	@Override
	public int clean(String mailCode) {
		return dao.clean(sst,mailCode);
	}


	@Override
	public int back(String mailCode) {
		return dao.back(sst,mailCode);
	}


	@Override
	public List<MailVo> selectSendlist(String id,PageVo pv) {
		return dao.selectSendlist(sst,id, pv);
	}


	@Override
	public List<MailVo> selectRelist(String id,PageVo pv) {
		return dao.selectRelist(sst,id,pv);
	}


	@Override
	public int reply(MailVo mvo) {
		return dao.replyMail(sst, mvo);
	}


	@Override
	public int selfWrite(MailVo mvo) {
		return dao.selfWrite(sst,mvo);
	}


	@Override
	public List<MailVo> selectSelflist(String id,PageVo pv) {
		return dao.selectSelflist(sst,id, pv);
	}


	@Override
	public MailVo selectOne(String mailCode) {
		int result = dao.increaseViews(sst,mailCode);
		if(result == 1) {
		return dao.selectMail(sst, mailCode);
		}else {
			return null;
		}
	}


	@Override
	public int deleteOne(String mailCode) {
		return dao.deleteOne(sst, mailCode);
	}


	@Override
	public int selectTotalCnt(String id) {
		return dao.selectCountAll(sst,id);
	}


	@Override
	public int selectDeleteCnt() {
		return dao.selectDeleteCnt(sst);
	}


	@Override
	public int read(String mailCode) {
		return dao.readMail(sst,mailCode);
	}


	@Override
	public int noread(String mailCode) {
		return dao.noreadMail(sst,mailCode);
	}


	@Override
	public List<MailVo> selectSearchList(Map<String, String> map,PageVo pv2) {
		return dao.selectSearchList(sst,map,pv2);
	}


	@Override
	public int selectSearchTotalCnt() {
		return dao.selectSearchTotalCnt(sst);
	}


	@Override
	public int fileWrite(MailFileVo mfvo) {
		return dao.insertFile(sst, mfvo);
	}


	@Override
	public List<MailFileVo> selectFile(String mailFilecode) {
		return dao.selectFile(sst,mailFilecode);
	}


	@Override
	public List<MailFileVo> selectMailFileList(String mailCode) {
		return dao.selectMailFileList(sst,mailCode);
	}


	@Override
	public int selectSendTotalCnt(String id) {
		return dao.selectSendTotalCnt(sst,id);
	}


	@Override
	public int selectSelfTotalCnt(String id) {
		return dao.selectSelfTotalCnt(sst,id);
	}



	
}
