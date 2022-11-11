package com.kh.app00.organization.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

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
	private SpaceRemover spaceRemover;
	
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
		
		word = spaceRemover.removeSpace(word);
		
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
		
		empData = SpaceRemover.removeSpace(empData);
		
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


	//권한관리 -> 관리자 삭제
	@Override
	public int updateAdmin(String adminCode) {
		return organizationDao.updateAdmin(sqlSessionTemplate, adminCode);
	}


	//권한 관리 -> 임직원 검색
	@Override
	public List<EmpVo> selectEmpListForAdmin(String word) {
		
		word = spaceRemover.removeSpace(word);
		
		return organizationDao.selectEmpListForAdmin(sqlSessionTemplate,word);
	}


	//권한 관리 - 관리자 추가
	@Override
	public int updateEmpToAdmin(Map<String, List<String>> updateTarget) {
		return organizationDao.updateEmpToAdmin(sqlSessionTemplate,updateTarget);
	}


   //포지션 관리 - 직위 불러오기
	@Override
	public List<RankVo> selectRankListForManagement() {
		return organizationDao.selectRankListForManagement(sqlSessionTemplate);
	}


	//직위 추가
	@Override
	public int insertRank(RankVo rankVo) {
		String replacedRankName = spaceRemover.removeSpace(rankVo.getRankName());
		
		int rankNameLength = replacedRankName.length();
		boolean nameHangel = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", replacedRankName);
		
		if(rankNameLength>15) {
			return -5;
		} else if (nameHangel!=true) {
			return -10;
		}
		
		rankVo.setRankName(replacedRankName);
		
		return organizationDao.insertRank(sqlSessionTemplate, rankVo);
	}


	//직위 수정
	@Override
	public int updateRankName(Map<String, List<String>> updateTarget) {
		return organizationDao.updateRankName(sqlSessionTemplate, updateTarget);
	}


	//직위 삭제
	@Override
	public int updateRankToDelete(List<String> rankCodeList) {
		return organizationDao.updateRankToDelete(sqlSessionTemplate,rankCodeList);
	}



	//직무 추가
	@Override
	public int insertJob(String jobName) {
		
		String replacedJobName = spaceRemover.removeSpace(jobName);
		
		int rankNameLength = replacedJobName.length();
		boolean nameHangel = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", replacedJobName);
		
		if(rankNameLength>15) {
			return -5;
		} else if (nameHangel!=true) {
			return -10;
		}
		
		return organizationDao.insertJob(sqlSessionTemplate, replacedJobName);
	}



	//직무 수정
	@Override
	public int updateJob(String jobName, String previousName) {
		String replacedJobName = spaceRemover.removeSpace(jobName);
		
		int rankNameLength = replacedJobName.length();
		boolean nameHangel = Pattern.matches("^[ㄱ-ㅎ가-힣]*$", replacedJobName);
		
		if(rankNameLength>15) {
			return -5;
		} else if (nameHangel!=true) {
			return -10;
		}
		
		Map<String,String> jobNameMap = new HashMap<String, String>();
		jobNameMap.put("jobName", replacedJobName);
		jobNameMap.put("previousName", previousName);
		
		return organizationDao.updateJob(sqlSessionTemplate, jobNameMap);
	}



	//직무 삭제
	@Override
	public int updateJobToD(String jobName) {
		return organizationDao.updateJobToD(sqlSessionTemplate,jobName);
	}


	//임직원 관리 - 임직원정보 수정
	@Override
	public int updateEmp(EmpVo empVo) {
		
		if(empVo.getEmpPwd()!=null || empVo.getEmpPwd()!="") {
			String replacedPwd = SpaceRemover.removeSpace(empVo.getEmpPwd());
			empVo.setEmpPwd(replacedPwd);
			empVo.encodePwd(pwdEnc);
		}
		
		if(empVo.getEmpTel().length()!=11) {
			return -2;
		} else if (empVo.getEmpPhone().length()!=11) {
			return -3;
		} else if (empVo.getEmpEMail().length()>30) {
			return -4;
		} else if (empVo.getEmpAddress1().length()>50) {
			return -5;
		} else if (empVo.getEmpAddress2().length()>50) {
			return -6;
		}
		
		int result =  organizationDao.updateEmp(sqlSessionTemplate, empVo);
		
		if(result==1) {
			return result;
		} else {
			return -1;
		}
		
		
	}


	//부서관리 - 부서 가져오기
	@Override
	public List<DeptVo> selectDeptListForChart() {
		return organizationDao.selectDeptListForChart(sqlSessionTemplate);
	}


	//부서관리 - 부서 검색
	@Override
	public List<DeptVo> selectDeptListByWord(String word) {
		return organizationDao.selectDeptListByWord(sqlSessionTemplate, word);
	}


	//부서관리 - 부서 추가
	@Override
	public int insertDept(Map<String, List<String>> insertTarget) {
		return organizationDao.insertDept(sqlSessionTemplate, insertTarget);
	}


	//부서관리 - 부서 수정을 위한 부서선택
	@Override
	public List<DeptVo> selectDeptListForEdit() {
		return organizationDao.selectDeptListForEdit(sqlSessionTemplate);
	}


	//부서관리 - 부서수정
	@Override
	public int updateDept(List<String> highDeptList, List<String> targetNameList, List<String> targetList) {
		
		// start
		
		// 전체 리스트 조회
		// A 에서 B 로 이동 //
		//	함수 (A 를 B로 이동) //재귀호출 //자식 없으면 ? 리턴
		
		List<DeptVo> deptList = organizationDao.selectDeptList(sqlSessionTemplate); //전체
		Map<String, DeptVo> allMap = new HashMap<String, DeptVo>();
		for(DeptVo vo : deptList) {
			allMap.put(vo.getDeptCode(), vo);
		}
		
		List<String> editedList = new ArrayList<String>();
		
		int len = targetList.size();
		
		for (int i = 0; i < len; i++) {
			String target = targetList.get(i);
			String highDept = highDeptList.get(i);
			String targetName = targetNameList.get(i);
			
			edit(allMap, allMap.get(target), allMap.get(highDept), targetName , editedList);
		}
		
		Map<String,List<DeptVo>> targetMap = new HashMap<String, List<DeptVo>>();
		List<DeptVo> editedDeptlist = new ArrayList<DeptVo>();
		
		for(DeptVo deptVo : allMap.values()) {
			for(String editedCode : editedList) {
				if(deptVo.getDeptCode().equals(editedCode)) {
					editedDeptlist.add(deptVo);
				}
			}
		}
		targetMap.put("editedDeptlist", editedDeptlist);
	
		return organizationDao.updateDept(sqlSessionTemplate,targetMap);
		
	}//method
	
	
	private void edit(Map<String, DeptVo>allMap , DeptVo targetVo , DeptVo highVo, String targetName, List<String> editedList) {
		
		//target 수정
		targetVo.setHighDeptCode(highVo.getDeptCode());
		targetVo.setDeptDepth(String.valueOf(Integer.parseInt(highVo.getDeptDepth())+1));
		if(targetName.length()>1) {
			targetVo.setDeptName(targetName);
		}
		targetName="";
		editedList.add(targetVo.getDeptCode());
		
		//자식들 수정
		for(DeptVo vo : allMap.values()) {
			if(vo.getHighDeptCode().equals(targetVo.getDeptCode())) {
				edit(allMap , vo , targetVo, targetName , editedList);
			}
		}
	}


	//사원수 가져오기
	@Override
	public String selectEmpCnt() {
		return organizationDao.selectEmpCnt(sqlSessionTemplate);
	}


	//부서관리 - 부서 삭제
	@Override
	public int deleteDept(List<String> targetList) {
		
		// star
				List<DeptVo> deptList = organizationDao.selectDeptList(sqlSessionTemplate); 
				Map<String, DeptVo> allMap = new HashMap<String, DeptVo>();
				
				List<String> highList = new ArrayList<String>();
				for(DeptVo vo : deptList) {
					allMap.put(vo.getDeptCode(), vo);
				}
				
				String highDeptCode = "";
				for(String targetCode : targetList) {
					highDeptCode = allMap.get(targetCode).getHighDeptCode();
					highList.add(highDeptCode);
				}
				List<String> deletedList = new ArrayList<String>();
				
				int len = targetList.size();
				
				for (int i = 0; i < len; i++) {
					String target = targetList.get(i);
					String highDept = highList.get(i);
					editToD(allMap, allMap.get(target), allMap.get(highDept), deletedList);
				}
				Map<String,List<String>> targetMap = new HashMap<String, List<String>>();
				targetMap.put("deletedList", deletedList);
				
				return organizationDao.deleteDept(sqlSessionTemplate,targetMap);		
		
	}


	//부서관리 - 부서 삭제 후 하위부서 재귀호출
	private void editToD (Map<String, DeptVo>allMap , DeptVo targetVo , DeptVo highVo , List<String> deletedList) {
		
		targetVo.setHighDeptCode(highVo.getDeptCode());
		
		deletedList.add(targetVo.getDeptCode());
				
		//자식들 수정
		for(DeptVo vo : allMap.values()) {
			if(vo.getHighDeptCode().equals(targetVo.getDeptCode())) {
				editToD(allMap , vo, targetVo , deletedList);
			}
		}
				
	}



	





	



	

}
