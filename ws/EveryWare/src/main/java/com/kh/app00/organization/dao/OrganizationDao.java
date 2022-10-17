package com.kh.app00.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.emp.vo.EmpVo;

public interface OrganizationDao {

	//임직원 정보 불러오기
	List<EmpVo> selectEmpList(SqlSessionTemplate sqlSessionTemplate);

	//이름으로 임직원 정보 불러오기
	List<EmpVo> selectEmpListByWord(SqlSessionTemplate sqlSessionTemplate, String word);

}
