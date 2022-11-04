package com.kh.app00.mail.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.mail.vo.MailVo;

@Repository
public class MailDaoImpl implements MailDao {

	@Override
	public List<MailVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("mailMapper.selectList");
	}

	@Override
	public int insertMail(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.insertMail", mvo);
	}

	@Override
	public int deleteMail(SqlSessionTemplate sst, String mailCode) {
		return sst.delete("mailMapper.deleteMail", mailCode);
	}

	@Override
	public List<MailVo> selectTrashlist(SqlSessionTemplate sst) {
		return sst.selectList("mailMapper.selectTrashlist");
	}

	@Override
	public int clean(SqlSessionTemplate sst, String mailCode) {
		return sst.delete("mailMapper.cleanMail", mailCode);
	}

	@Override
	public int back(SqlSessionTemplate sst, String mailCode) {
		return sst.update("mailMapper.backMail", mailCode);
	}

	@Override
	public List<MailVo> selectSendlist(SqlSessionTemplate sst) {
		return sst.selectList("mailMapper.selectSendlist");
	}

	@Override
	public List<MailVo> selectRelist(SqlSessionTemplate sst) {
		return sst.selectList("mailMapper.selectRelist");
	}

	@Override
	public int replyMail(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.replyMail", mvo);
	}

	@Override
	public int selfWrite(SqlSessionTemplate sst, MailVo mvo) {
		return sst.insert("mailMapper.selfMail", mvo);
	}

	@Override
	public List<MailVo> selectSelflist(SqlSessionTemplate sst) {
		return sst.selectList("mailMapper.selectSelflist");
	}
}
