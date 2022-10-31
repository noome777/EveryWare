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

	// 변경된 직위확인
	EmpVo selectUpdatedRank(String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 직무 변경
	int updateCheckedJob(Map<String, List<String>> updateTarget);

	//변경된 직무확인
	String selectUpdatedJob(String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 부서 변경
	int updateCheckedDept(Map<String, List<String>> updateTarget);

	//변경된 부서확인
	String selectUpdatedDept(String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 상태 변경
	int updateCheckedStatus(Map<String, List<String>> updateTarget);

	//변경된 상태확인
	String selectUpdatedStatus(String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 파일명 변경
	int updateCheckedFileName(Map<String, List<String>> updateTarget);

	//변경된 파일명 확인
	String selectUpdatedFileName(String updatedEmpCode);

	//권한 관리 - 관리자 불러오기
	List<EmpVo> selectAdminList();

	//권한 관리 - 관리자 삭제
	int updateAdmin(String adminCode);

	//권한 관리 - 임직원 검색
	List<EmpVo> selectEmpListForAdmin(String word);

	//권한 관리 - 관리자 추가
	int updateEmpToAdmin(Map<String, List<String>> updateTarget);

	//포지션 관리 - 직위 불러오기
	List<RankVo> selectRankListForManagement();

	//직위 추가
	int insertRank(RankVo rankVo);

	//직위 수정
	int updateRankName(Map<String, List<String>> updateTarget);

	//직위 삭제
	int updateRankToDelete(List<String> rankCodeList);


}
