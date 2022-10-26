package com.kh.app00.approval.service;

import java.util.List;
import java.util.Map;

import com.kh.app00.approval.doc.vo.DocDataVo;
import com.kh.app00.approval.doc.vo.DocFormDetailTemplateVo;
import com.kh.app00.approval.doc.vo.DocFormMapperVo;
import com.kh.app00.approval.doc.vo.DocFormVo;
import com.kh.app00.approval.doc.vo.DocPeriodVo;
import com.kh.app00.approval.vo.ApprovalDocVo;
import com.kh.app00.approval.vo.ApprovalListVo;
import com.kh.app00.approval.vo.ApprovalRefVo;
import com.kh.app00.approval.vo.ApprovalTypeVo;
import com.kh.app00.common.PageVo;
import com.kh.app00.emp.vo.EmpVo;
import com.kh.app00.organization.vo.DeptVo;

public interface ApprovalService {

	//문서종류 불러오기
	List<DocFormVo> selectFormList();

	//보존연한 불러오기
	List<DocPeriodVo> selectPeriodList();
	
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

	//결재문서 작성
	int insertApprovalDoc(ApprovalDocVo docVo);
	
	
	
	
	//문서 갯수 조회
	int selectTotalCnt();
	//문서 목록 조회
	List<ApprovalDocVo> selectDocList(PageVo pv);

	
	//문서 양식상세 항목 불러오기
	List<DocFormDetailTemplateVo> selectFormDetailList();
	//문서양식 insert
	int insertForm(DocFormVo formVo);
	
	//작성된 문서 상세정보 불러오기
	ApprovalDocVo selectDocDetail(String docCode);
	//작성된 문서내용 불러오기
	List<DocDataVo> selectDocDataList(String docCode);
	//작성된 문서 결재자 불러오기
	List<ApprovalListVo> selectApproverList(String docCode);
	//작성된 문서 참조인 불러오기
	List<ApprovalRefVo> selectRefVoList(String docCode);
	//결재타입 갯수 구하기
	List<ApprovalListVo> selectTypeCountList(String docCode);






	
	
	
}
