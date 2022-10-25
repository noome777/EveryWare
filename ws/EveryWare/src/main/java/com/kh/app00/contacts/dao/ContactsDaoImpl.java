package com.kh.app00.contacts.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.contacts.vo.ContactsVo;

@Repository
public class ContactsDaoImpl implements ContactsDao{

	//주소록 목록
	@Override
	public List<ContactsVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("contactsMapper.selectList");
	}

}
