package com.kh.app00.contacts.service;

import java.util.List;

import com.kh.app00.contacts.vo.ContactsVo;

public interface ContactsService {

	//주소록 목록
	List<ContactsVo> selectList();

}
