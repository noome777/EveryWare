package com.kh.app00.contacts.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.contacts.vo.ContactsVo;

public interface ContactsDao {

	//주소록 목록
	List<ContactsVo> selectList(SqlSessionTemplate sst);

}
