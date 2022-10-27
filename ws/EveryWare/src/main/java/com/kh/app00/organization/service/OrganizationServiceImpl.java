package com.kh.app00.organization.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.app00.common.PageVo;
import com.kh.app00.common.SpaceRemover;
import com.kh.app00.common.SpaceRemover;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.dao.OrganizationDao;
import com.kh.app00.organization.vo.DeptVo;
import com.kh.app00.organization.vo.JobVo;
import com.kh.app00.organization.vo.RankVo;

@Service
public class OrganizationServiceImpl implements OrganizationService {

	private final OrganizationDao organizationDao;
	private final SqlSessionTemplate sqlSessionTemplate;
	private final PasswordEncoder  pwdEnc;
	
	@Autowired
	public OrganizationServiceImpl(OrganizationDao organizationDao, SqlSessionTemplate sqlSessionTemplate, PasswordEncoder  pwdEnc) {
		this.organizationDao = organizationDao;
		this.sqlSessionTemplate = sqlSessionTemplate;
		this.pwdEnc = pwdEnc;
	}



	//임직원 정보 불러오기
	@Override
	public List<EmpVo> selectEmpList() {
		return organizationDao.selectEmpList(sqlSessionTemplate);
	}


	//검색으로 임직원 정보 불러오기
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

	//임직원 관리 - 페이징 적용된 empList
	@Override
	public List<EmpVo> selectEmpListByPage(PageVo pv) {
		return organizationDao.selectEmpListByPage(sqlSessionTemplate,pv);
	}
	
	//임직원 관리 - 직위 리스트
	@Override
	public List<RankVo> selectRankList() {
		return organizationDao.selectRankList(sqlSessionTemplate);
	}


	//임직원 관리 - 직무 리스트
	@Override
	public List<JobVo> selectJobList() {
		return organizationDao.selectJobList(sqlSessionTemplate);
	}
	

	//임직원 관리 - 임직원 추가
	@Override
	public int insertEmp(EmpVo empVo) {
		SpaceRemover spaceRemover;
		
		if(empVo.getEmpName() == null || empVo.getEmpId() == null || empVo.getEmpPwd() == null) {
			return 0;
		} else {
			EmpVo replacedEmpVo = SpaceRemover.removeEmpWhiteSpace(empVo);
			replacedEmpVo.encodePwd(pwdEnc);
			
				int result = organizationDao.insertEmp(sqlSessionTemplate,replacedEmpVo);
			if(result==1) {
				return result;
			} else {
				return -1;
			}
		}
		
	}


	//아이디 중복 확인
	@Override
	public int checkIdDup(String id) {
		return organizationDao.checkIdDup(sqlSessionTemplate,id);
	}




	//임직원 관리 - 임직원 검색
	@Override
	public List<EmpVo> selectEmpListByEmpData(String empData) {
		return organizationDao.selectEmpListByEmpData(sqlSessionTemplate,empData);
	}


	//임직원 관리 - 체크된 임직원 직위변경


	@Override
	public int updateCheckedRank(Map<String, List<String>> updateTarget) {
		return organizationDao.updateCheckedRank(sqlSessionTemplate, updateTarget);
	}


	//변경된 직위확인
	@Override
	public EmpVo selectUpdatedRank(String updatedEmpCode) {
		return organizationDao.selectUpdatedRank(sqlSessionTemplate,updatedEmpCode);
	}


	//임직원 관리 - 체크된 임직원 직무변경
	@Override
	public int updateCheckedJob(Map<String, List<String>> updateTarget) {
		return organizationDao.updateCheckedJob(sqlSessionTemplate, updateTarget);
	}


	//변경된 직무확인
	@Override
	public String selectUpdatedJob(String updatedEmpCode) {
		return organizationDao.selectUpdatedJob(sqlSessionTemplate, updatedEmpCode);
	}


	//임직원 관리 - 체크된 임직원 부서 변경
	@Override
	public int updateCheckedDept(Map<String, List<String>> updateTarget) {
		return organizationDao.updateCheckedDept(sqlSessionTemplate, updateTarget);
	}


	//변경된 부서 확인
	@Override
	public String selectUpdatedDept(String updatedEmpCode) {
		return organizationDao.selectUpdatedDept(sqlSessionTemplate, updatedEmpCode);
	}


	//임직원 관리 - 체크된 임직원 상태 변경
	@Override
	public int updateCheckedStatus(Map<String, List<String>> updateTarget) {
		return organizationDao.updateCheckedStatus(sqlSessionTemplate, updateTarget);
	}


	//변경된 상태 확인
	@Override
	public String selectUpdatedStatus(String updatedEmpCode) {
		return organizationDao.selectUpdatedStatus(sqlSessionTemplate, updatedEmpCode);
	}


	//임직원 관리 - 체크된 임직원 파일 변경
	@Override
	public int updateCheckedFileName(Map<String, List<String>> updateTarget) {
		return organizationDao.updateCheckedFileName(sqlSessionTemplate,updateTarget);
	}


	//변경된 파일명 확인
	@Override
	public String selectUpdatedFileName(String updatedEmpCode) {
		return organizationDao.selectUpdatedFileName(sqlSessionTemplate,updatedEmpCode);
	}


	//관리자 리스트 불러오기
	@Override
	public List<EmpVo> selectAdminList() {
		return organizationDao.selectAdminList(sqlSessionTemplate);
	}





	



	

}
