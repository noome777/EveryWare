package com.kh.app00.approval.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.app00.approval.dao.ApprovalDao;
import com.kh.app00.approval.doc.vo.DocCommentVo;
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
		
		if(docDataList.size() != 0) {
			for(DocDataVo vo : docDataList) {
				vo.setDocCode(constructedDocCode);
			}
			int docDataResult = dao.insertDocData(sst, docDataList);
		}
		if(approverList.size() != 0) {
			for(ApprovalListVo vo : approverList) {
				vo.setDocCode(constructedDocCode);
			}
			int approverListResult = dao.insertApproverList(sst, approverList);
		}
		if(approvalRefList.size() != 0) {
			for(ApprovalRefVo vo : approvalRefList) {
				vo.setDocCode(constructedDocCode);
			}
			int approvalRefResult = dao.insertApprovalRef(sst, approvalRefList);
		}
//		if(approvalFileList.size() != 0 && approvalFileList != null) {
//			
//			for(ApprovalFileVo vo : approvalFileList) {
//				vo.setDocCode(constructedDocCode);
//			}
//			System.out.println(approvalFileList);
//			int approvalFileResult = dao.insertApprovalFile(sst, approvalFileList);
//		}
		
		return approvalDocResult;
	}
	
	//작성된 문서 상세정보 불러오기
	@Override
	public ApprovalDocVo selectDocDetail(String docCode) {
		return dao.selectDocDetail(sst, docCode);
	}
	//작성된 문서내용 불러오기
	@Override
	public List<DocDataVo> selectDocDataList(String docCode) {
		return dao.selectDocDataList(sst, docCode);
	}
	//작성된 문서 결재자 불러오기
	@Override
	public List<ApprovalListVo> selectApproverList(String docCode) {
		return dao.selectApproverList(sst, docCode);
	}
	//작성된 문서 참조인 불러오기
	@Override
	public List<ApprovalRefVo> selectRefVoList(String docCode) {
		return dao.selectRefVoList(sst, docCode);
	}
	//결재타입 갯수 구하기
	@Override
	public List<ApprovalListVo> selectTypeCountList(String docCode) {
		return dao.selectTypeCountList(sst, docCode);
	}
	//반려 메세지 불러오기
	@Override
	public DocCommentVo selectUnApprComment(String docCode) {
		return dao.selectUnApprComment(sst, docCode);
	}
	//문서 승인
	@Override
	public int updateApprove(ApprovalListVo vo) {
		
		int updateAppr = dao.updateApprove(sst, vo);
		ApprovalListVo maxSeq = dao.maxApprSeq(sst, vo);
		if(vo.getApprSeq().equals(maxSeq.getMaxSeq())) {
			int updateApprDate = dao.updateDocApprDate(sst, vo);
		}
		
		return updateAppr;
	}
	//문서 반려
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public int updateUnApprove(ApprovalListVo apprVo) {
		
		//반려처리
		int apprResult = dao.updateUnApprove(sst, apprVo);
		//반려 메세지 insert
		int comResult = dao.insertUnApproveComment(sst, apprVo);
		//해당 결재문서 결재상태 처리
		int docUpdate = dao.updateDocApprStatus(sst, apprVo);
		//결재완료 날짜 update
		int apprDate = dao.updateDocApprDate(sst, apprVo);
		
		return apprResult * comResult * apprDate;
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

	
	
	
	
	//결재 예정 리스트 개수 구하기
	@Override
	public int selectExpectCount(ApprovalDocVo vo) {
		return dao.selectExpectCount(sst, vo);
	}
	//결재 예정 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectExpectDocList(ApprovalDocVo vo, PageVo pv) {
		return dao.selectExpectDocList(sst, vo, pv);
	}

	
	
	//결재 확인 문서 전체 갯수 조회
	@Override
	public int selectRefListTotalCnt(String empCode) {
		return dao.selectRefListTotalCnt(sst, empCode);
	}
	//결재 확인 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectRefDocList(String empCode, PageVo pv) {
		return dao.selectRefDocList(sst, empCode, pv);
	}
	//결재 대기 문서 전체 갯수 조회
	@Override
	public int selectWaitListTotalCnt(String empCode) {
		return dao.selectWaitListTotalCnt(sst, empCode);
	}
	//결재 대기 목록 조회
	@Override
	public List<ApprovalDocVo> selectWaitList(String empCode, PageVo pv) {
		return dao.selectWaitList(sst, empCode, pv);
	}
	//결재 진행 목록 전체 갯수 조회
	@Override
	public int selectProgressListTotalCnt(String empCode) {
		return dao.selectProgressListTotalCnt(sst, empCode);
	}
	//결재 진행 목록 조회
	@Override
	public List<ApprovalDocVo> selectProgressList(String empCode, PageVo pv) {
		return dao.selectProgressList(sst, empCode, pv);
	}

	

	

	

	

	

	

	

	

	

	
	
	

}
