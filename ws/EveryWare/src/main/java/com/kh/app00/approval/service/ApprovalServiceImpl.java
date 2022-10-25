package com.kh.app00.approval.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app00.approval.dao.ApprovalDao;
import com.kh.app00.approval.doc.vo.DocDataVo;
import com.kh.app00.approval.doc.vo.DocFormDetailTemplateVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.vo.ApprovalDocVo;
import com.kh.app00.approval.vo.ApprovalFileVo;
import com.kh.app00.approval.vo.ApprovalListVo;
import com.kh.app00.approval.vo.ApprovalRefVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

@Service
public class ApprovalServiceImpl implements ApprovalService {

	private final ApprovalDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public ApprovalServiceImpl(ApprovalDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}

	//문서종류
	@Override
	public List<DocFormVo> selectFormList() {
		return dao.selectFormList(sst);
	}

	//보존연한
	@Override
	public List<DocPeriodVo> selectPeriodList() {
		return dao.selectPeriodList(sst);
	}

	//양식항목
	@Override
	public List<DocFormMapperVo> formSelect(int formCode) {
		return dao.formSelect(sst, formCode);
	}
	
	//결재타입
	@Override
	public List<ApprovalTypeVo> selectTypeList() {
		return dao.selectTypeList(sst);
	}
	
	//부서정보
	@Override
	public List<DeptVo> selectDeptList() {
		return dao.selectDeptList(sst);
	}

	//임직원 정보
	@Override
	public List<EmpVo> selectEmpList() {
		return dao.selectEmpList(sst);
	}

	//부서별 임직원 정보
	@Override
	public List<EmpVo> selectDeptEmp(int deptCode) {
		return dao.selectDeptEmp(sst, deptCode);
	}

	//결재문서 작성
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public int insertApprovalDoc(ApprovalDocVo docVo) {
		System.out.println(docVo);
		
		int approvalDocResult = dao.insertApprovalDoc(sst, docVo);
		String constructedDocCode = docVo.getDocCode();
		
		List<DocDataVo> docDataList = docVo.getDocDataList();
		List<ApprovalListVo> approverList = docVo.getApproverList();
		List<ApprovalRefVo> approvalRefList = docVo.getApprovalRefList();
		List<ApprovalFileVo> approvalFileList = docVo.getApprovalFileList();
		
		if(docDataList != null) {
			for(DocDataVo vo : docDataList) {
				vo.setDocCode(constructedDocCode);
			}
			System.out.println(docDataList);
			int docDataResult = dao.insertDocData(sst, docDataList);
		}
		if(approverList != null) {
			for(ApprovalListVo vo : approverList) {
				vo.setDocCode(constructedDocCode);
			}
			System.out.println(approverList);
			int approverListResult = dao.insertApproverList(sst, approverList);
		}
		if(approvalRefList != null) {
			for(ApprovalRefVo vo : approvalRefList) {
				vo.setDocCode(constructedDocCode);
			}
			System.out.println(approvalRefList);
			int approvalRefResult = dao.insertApprovalRef(sst, approvalRefList);
		}
		if(approvalFileList != null) {
			for(ApprovalFileVo vo : approvalFileList) {
				vo.setDocCode(constructedDocCode);
			}
			System.out.println(approvalFileList);
			int approvalFileResult = dao.insertApprovalFile(sst, approvalFileList);
		}
		
		return 0;
	}
	
	//문서 갯수 조회
	@Override
	public int selectTotalCnt() {
		return dao.selectCountAll(sst);
	}

	//문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectDocList(PageVo pv) {
		return dao.selectDocList(sst, pv);
	}
	
	//문서 양식상세 항목 불러오기
	@Override
	public List<DocFormDetailTemplateVo> selectFormDetailList() {
		return dao.selectFormDetailList(sst);
	}

	//문서양식 insert
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public int insertForm(DocFormVo formVo) {

		int docFormResult = dao.insertDocForm(sst, formVo);
		
		// insert된 pk select key로 가져왔으니 값이 있어야함
		String constructedFormCode = formVo.getFormCode();
		
		List<DocFormMapperVo> mappingList = formVo.getFormDetailList();
		for(DocFormMapperVo vo : mappingList) {
			vo.setFormCode(constructedFormCode);
		}
		
		int docFormMappingResult = dao.insertDocFormMapping(sst, mappingList);
		
		return docFormResult * docFormMappingResult;
	}

	

	
	
	

}
