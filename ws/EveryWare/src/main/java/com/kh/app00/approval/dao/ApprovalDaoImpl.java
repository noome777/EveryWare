package com.kh.app00.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.app00.approval.doc.vo.DocFormDetailTemplateVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.vo.ApprovalDocVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.common.PageVo;
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

	
	
	//게시글 갯수 조회
	@Override
	public int selectCountAll(SqlSessionTemplate sst) {
		return sst.selectOne("approvalMapper.selectCountAll");
	}

	//게시글 목록 조회
	@Override
	public List<ApprovalDocVo> selectDocList(SqlSessionTemplate sst, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("approvalMapper.selectDocList", null, rb);
	}

	
	
	
	//문서 상세항목 불러오기
	@Override
	public List<DocFormDetailTemplateVo> selectFormDetailList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectFormDetailList");
	}

	//문서양식 insert
	//docForm insert
	@Override
	public int insertDocForm(SqlSessionTemplate sst, DocFormVo formVo) {
		return sst.insert("approvalMapper.insertDocForm", formVo);
	}
	//docFormMapping insert
	@Override
	public int insertDocFormMapping(SqlSessionTemplate sst, List<DocFormMapperVo> mappingList) {
		return sst.insert("approvalMapper.insertDocFormMapping", mappingList);
	}
	
	

}
