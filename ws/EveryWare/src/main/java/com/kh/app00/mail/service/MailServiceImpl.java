package com.kh.app00.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.mail.dao.MailDao;
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
	public List<MailVo> selectList(PageVo pv) {
		return dao.selectList(sst,pv);
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
	public List<MailVo> selectTrashlist() {
		return dao.selectTrashlist(sst);
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
	public List<MailVo> selectSendlist() {
		return dao.selectSendlist(sst);
	}


	@Override
	public List<MailVo> selectRelist(PageVo pv) {
		return dao.selectRelist(sst,pv);
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
	public List<MailVo> selectSelflist() {
		return dao.selectSelflist(sst);
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
	public int selectTotalCnt() {
		return dao.selectCountAll(sst);
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
	public List<MailVo> selectSearchList(MailVo mailVo, PageVo pv2) {
		return dao.selectSearchList(sst,mailVo, pv2);
	}


	@Override
	public int selectSearchTotalCnt(MailVo mvo) {
		return dao.selectSearchTotalCnt(sst,mvo);
	}
	
}
