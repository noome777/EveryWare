package com.kh.app00.organization.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.dao.OrganizationDao;
import com.kh.app00.organization.vo.DeptVo;

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


	//부서 정보 가져오기
	@Override
	public List<DeptVo> selectDeptList() {
		return organizationDao.selectDeptList(sqlSessionTemplate);
	}


	//임직원 관리 위한 페이징
	@Override
	public int selectTotalCnt() {
			return organizationDao.selectCountAll(sqlSessionTemplate);
	}


	//임직원 관리 - 페이징
	@Override
	public List<EmpVo> selectEmpListByPage(PageVo pv) {
		return organizationDao.selectEmpListByPage(sqlSessionTemplate,pv);
	}

}
