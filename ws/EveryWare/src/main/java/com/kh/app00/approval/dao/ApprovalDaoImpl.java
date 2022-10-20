package com.kh.app00.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.doc.vo.DocSecurityVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

@Repository
public class ApprovalDaoImpl implements ApprovalDao {
	
	//문서종류
	@Override
	public List<DocFormVo> selectFormList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectFormList");
	}

	//보존연한
	@Override
	public List<DocPeriodVo> selectPeriodList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectPeriodList");
	}
	
	//보안등급
	@Override
	public List<DocSecurityVo> selectSecurityList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectSecurityList");
	}
	
	//양식항목
	@Override
	public List<DocFormMapperVo> formSelect(SqlSessionTemplate sst, int formCode) {
		return sst.selectList("approvalMapper.formSelectList", formCode);
	}

	//결재타입
	@Override
	public List<ApprovalTypeVo> selectTypeList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectTypeList");
	}
	
	//부서 불러오기
	@Override
	public List<DeptVo> selectDeptList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectDeptList");
	}

	//임직원 불러오기
	@Override
	public List<EmpVo> selectEmpList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectEmpList");
	}

	//부서별 임직원 불러오기
	@Override
	public List<EmpVo> selectDeptEmp(SqlSessionTemplate sst, int deptCode) {
		return sst.selectList("approvalMapper.selectDeptEmpList", deptCode);
	}

}
