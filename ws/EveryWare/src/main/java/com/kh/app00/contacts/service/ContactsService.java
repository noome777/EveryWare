package com.kh.app00.contacts.service;

import java.util.List;

import com.kh.app00.contacts.vo.ContactsVo;

public interface ContactsService {

	//주소록 목록
	List<ContactsVo> selectList();

	//주소록 삭제
	int delete(String no);

	//주소록 작성
	int write(ContactsVo vo);

	//주소록 상세조회
	ContactsVo selectOne(String no);

	//주소록 수정
	int edit(ContactsVo vo);

}
