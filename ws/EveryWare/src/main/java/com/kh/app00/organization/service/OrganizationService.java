package com.kh.app00.organization.service;

import java.util.List;

import com.kh.app00.emp.vo.EmpVo;

public interface OrganizationService {

	//임직원 정보 불러오기
	List<EmpVo> selectEmpList();

	//검색한 임직원 정보 불러오기
	List<EmpVo> selectEmpListByWord(String word);

}
