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

}
