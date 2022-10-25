package com.kh.app00.organization.service;

import java.util.List;
import java.util.Map;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;

public interface OrganizationService {

	//임직원 정보 불러오기
	List<EmpVo> selectEmpList();

	//검색한 임직원 정보 불러오기
	List<EmpVo> selectEmpListByWord(String word);

	//부서 정보 가져오기
	List<DeptVo> selectDeptList();

	//임직원 관리 - 페이징을 위한 카운트
	int selectTotalCnt();

	
	//임직원 관리 - 페이징 및 EmpVo List
	List<EmpVo> selectEmpListByPage(PageVo pv);

	//직위 리스트
	List<RankVo> selectRankList();
	
	//직무 리스트
	List<JobVo> selectJobList();


	//임직원 관리 - 임직원 추가
	int insertEmp(EmpVo empVo);

	//아이디 중복 확인
	int checkIdDup(String id);

	//임직원 관리 - 임직원 검색
	List<EmpVo> selectEmpListByEmpData(String empData);

	//임직원 관리 - 체크된 임직원 직위 변경
	int updateCheckedRank(Map<String, List<String>> updateTarget);

	//임직원 관리 - 직위 변경된 임직원 직위 확인
	List<EmpVo> selectRankOnly(List<String> empCodeList);


}
