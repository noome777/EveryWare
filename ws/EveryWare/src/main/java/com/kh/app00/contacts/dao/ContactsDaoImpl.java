package com.kh.app00.contacts.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.common.PageVo;
import com.kh.app00.contacts.vo.ContactsVo;

@Repository
public class ContactsDaoImpl implements ContactsDao{
	
	//주소록 목록
	@Override
	public List<ContactsVo> selectList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset , pv.getBoardLimit());
		
		return sst.selectList("contactsMapper.selectList", null , rb);
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

	//주소록 상세보기
	@Override
	public ContactsVo selectOne(SqlSessionTemplate sst, String no) {
		return sst.selectOne("contactsMapper.selectOne", no);
	}

	//주소록 수정
	@Override
	public int updateOne(SqlSessionTemplate sst, ContactsVo vo) {
		return sst.update("contactsMapper.updateOne", vo);
	}

	//주소록 게시글 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("contactsMapper.selectCountAll");
	}

	
	

	
}
