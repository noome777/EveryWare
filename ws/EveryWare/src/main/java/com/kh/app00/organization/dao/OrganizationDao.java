package com.kh.app00.organization.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;

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

	//직위 리스트 가져오기
	List<RankVo> selectRankList(SqlSessionTemplate sqlSessionTemplate);
	
	//직무 리스트 가져오기
	List<JobVo> selectJobList(SqlSessionTemplate sqlSessionTemplate);
	

	//임직원 관리 - 임직원 추가
	int insertEmp(SqlSessionTemplate sqlSessionTemplate, EmpVo replacedEmpVo);

	//아이디 확인
	int checkIdDup(SqlSessionTemplate sqlSessionTemplate, String id);

	//임직원 관리 - 임직원 검색
	List<EmpVo> selectEmpListByEmpData(SqlSessionTemplate sqlSessionTemplate, String empData);

	//임직원 관리 - 체크된 임직원 직위 변경
	int updateCheckedRank(SqlSessionTemplate sqlSessionTemplate, Map<String, List<String>> updateTarget);

	//변경된 직위확인
	EmpVo selectUpdatedRank(SqlSessionTemplate sqlSessionTemplate, String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 직무 변경
	int updateCheckedJob(SqlSessionTemplate sqlSessionTemplate, Map<String, List<String>> updateTarget);

	//변경된 직무확인
	String selectUpdatedJob(SqlSessionTemplate sqlSessionTemplate, String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 부서 변경
	int updateCheckedDept(SqlSessionTemplate sqlSessionTemplate, Map<String, List<String>> updateTarget);

	//변경된 부서 확인
	String selectUpdatedDept(SqlSessionTemplate sqlSessionTemplate, String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 상태 변경
	int updateCheckedStatus(SqlSessionTemplate sqlSessionTemplate, Map<String, List<String>> updateTarget);

	//변경된 상태 확인
	String selectUpdatedStatus(SqlSessionTemplate sqlSessionTemplate, String updatedEmpCode);

	//임직원 관리 - 체크된 임직원 프로필 이름 변경
	int updateCheckedFileName(SqlSessionTemplate sqlSessionTemplate, Map<String, List<String>> updateTarget);

	//변경된 프로필 네임 확인
	String selectUpdatedFileName(SqlSessionTemplate sqlSessionTemplate, String updatedEmpCode);

	//권한 관리 - 관리자 불러오기
	List<EmpVo> selectAdminList(SqlSessionTemplate sqlSessionTemplate);



}
