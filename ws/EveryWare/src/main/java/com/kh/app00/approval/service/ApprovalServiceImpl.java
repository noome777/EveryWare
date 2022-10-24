package com.kh.app00.approval.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app00.approval.dao.ApprovalDao;
import com.kh.app00.approval.doc.vo.DocFormDetailTemplateVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.vo.ApprovalDocVo;
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
	public int insertForm(DocFormVo formVo, List<String> detaiCodelList, List<String> detaiSeqList) {

		int docFormResult = dao.insertDocForm(sst, formVo);
		
		
		List<DocFormMapperVo> mappingList = new ArrayList<DocFormMapperVo>();
		for(int i=0; i<detaiCodelList.size(); i++) {
			DocFormMapperVo mappingVo = new DocFormMapperVo();
			mappingVo.setFormDetailCode(detaiCodelList.get(i));
			mappingVo.setFormDetailSeq(detaiSeqList.get(i));
			mappingList.add(mappingVo);
		}
		int docFormMappingResult = dao.insertDocFormMapping(sst, mappingList);
		
		return docFormResult * docFormMappingResult;
	}

	
	
	

}
