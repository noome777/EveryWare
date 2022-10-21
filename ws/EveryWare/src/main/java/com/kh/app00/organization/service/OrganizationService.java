package com.kh.app00.organization.service;

import java.util.List;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

public interface OrganizationService {

	//임직원 정보 불러오기
	List<EmpVo> selectEmpList();

	//검색한 임직원 정보 불러오기
	List<EmpVo> selectEmpListByWord(String word);

	//부서 정보 가져오기
	List<DeptVo> selectDeptList();

	//임직원 관리 - 페이징을 위한 카운트
	int selectTotalCnt();

	//임직원 관리 - 페이징
	List<EmpVo> selectEmpListByPage(PageVo pv);

	//임직원 관리 - 임직원 추가
	int insertEmp(EmpVo empVo);

}
