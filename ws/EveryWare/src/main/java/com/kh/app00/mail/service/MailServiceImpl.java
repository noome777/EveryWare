package com.kh.app00.mail.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

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
	public List<MailVo> selectList() {
		return dao.selectList(sst);
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
	public List<MailVo> selectRelist() {
		return dao.selectRelist(sst);
	}


	@Override
	public int reply(MailVo mvo) {
		return dao.replyMail(sst, mvo);
	}
	
}
