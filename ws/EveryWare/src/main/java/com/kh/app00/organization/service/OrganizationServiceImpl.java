package com.kh.app00.organization.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.dao.OrganizationDao;

@Service
public class OrganizationServiceImpl implements OrganizationService {

	private final OrganizationDao organizationDao;
	private final SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public OrganizationServiceImpl(OrganizationDao organizationDao, SqlSessionTemplate sqlSessionTemplate) {
		this.organizationDao = organizationDao;
		this.sqlSessionTemplate = sqlSessionTemplate;
	}



	//임직원 정보 불러오기
	@Override
	public List<EmpVo> selectEmpList() {
		return organizationDao.selectEmpList(sqlSessionTemplate);
	}


	//검색으로 임직원 정보 불러오기
	//TODO 영어 및 숫자 입력 시 RETURN NULL
	@Override
	public List<EmpVo> selectEmpListByWord(String word) {
		return organizationDao.selectEmpListByWord(sqlSessionTemplate, word);
	}

}
