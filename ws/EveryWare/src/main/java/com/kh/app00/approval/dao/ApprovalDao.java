package com.kh.app00.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.doc.vo.DocSecurityVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

public interface ApprovalDao {
	
	//문서종류 불러오기
	List<DocFormVo> selectFormList(SqlSessionTemplate sst);

	//보존연한 불러오기
	List<DocPeriodVo> selectPeriodList(SqlSessionTemplate sst);
	
	//보안등급 불러오기
	List<DocSecurityVo> selectSecurityList(SqlSessionTemplate sst);
	
	//양식항목 불러오기
	List<DocFormMapperVo> formSelect(SqlSessionTemplate sst, int formCode);
	
	//결재타입 불러오기
	List<ApprovalTypeVo> selectTypeList(SqlSessionTemplate sst);

	//부서 불러오기
	List<DeptVo> selectDeptList(SqlSessionTemplate sst);

	//임직원 불러오기
	List<EmpVo> selectEmpList(SqlSessionTemplate sst);

	//부서별 임직원 불러오기
	List<EmpVo> selectDeptEmp(SqlSessionTemplate sst, int deptCode);

	
}
