package com.kh.app00.contacts.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.contacts.dao.ContactsDao;
import com.kh.app00.contacts.vo.ContactsVo;

@Service
public class ContactsServiceImpl implements ContactsService{

	private final ContactsDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ContactsServiceImpl(ContactsDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}


	//주소록 목록
	@Override
	public List<ContactsVo> selectList() {
		return dao.selectList(sst);
	}

}