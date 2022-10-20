package com.kh.app00.approval.service;

import java.util.List;

import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.doc.vo.DocSecurityVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

public interface ApprovalService {

	//문서종류 불러오기
	List<DocFormVo> selectFormList();

	//보존연한 불러오기
	List<DocPeriodVo> selectPeriodList();
	
	//보안등급 불러오기
	List<DocSecurityVo> selectSecurityList();

	//양식 내용 불러오기
	List<DocFormMapperVo> formSelect(int formCode);
	
	//결재타입 불러오기
	List<ApprovalTypeVo> selectTypeList();
	
	//부서 불러오기
	List<DeptVo> selectDeptList();
	
	//임직원 불러오기
	List<EmpVo> selectEmpList();

	//부서별 임직원 불러오기
	List<EmpVo> selectDeptEmp(int deptCode);


	
	
	
}
