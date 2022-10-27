package com.kh.app00.contacts.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
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

	//주소록 삭제
	@Override
	public int delete(SqlSessionTemplate sst, String no) {

		return sst.delete("contactsMapper.delete", no);
	}

	//주소록 작성
	@Override
	public int insertContacts(SqlSessionTemplate sst, ContactsVo vo) {
		return sst.insert("contactsMapper.insert", vo);
	}

	
	

	
}
