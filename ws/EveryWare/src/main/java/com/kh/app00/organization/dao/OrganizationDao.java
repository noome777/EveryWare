package com.kh.app00.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

public interface OrganizationDao {

	//임직원 정보 불러오기
	List<EmpVo> selectEmpList(SqlSessionTemplate sqlSessionTemplate);

	//이름으로 임직원 정보 불러오기
	List<EmpVo> selectEmpListByWord(SqlSessionTemplate sqlSessionTemplate, String word);

	//부서 리스트 가져오기
	List<DeptVo> selectDeptList(SqlSessionTemplate sqlSessionTemplate);

	//임직원 관리 - 페이징 카운트
	int selectCountAll(SqlSessionTemplate sqlSessionTemplate);

	//임직원 관리 - 페이징
	List<EmpVo> selectEmpListByPage(SqlSessionTemplate sqlSessionTemplate, PageVo pv);

	//임직원 관리 - 임직원 추가
	int insertEmp(SqlSessionTemplate sqlSessionTemplate, EmpVo replacedEmpVo);

}
