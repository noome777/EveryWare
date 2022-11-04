package com.kh.app00.approval.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

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
	int insertApprovalDoc(ApprovalDocVo docVo, MultipartFile[] files, HttpServletRequest req);
	
	//작성된 문서 상세정보 불러오기
	ApprovalDocVo selectDocDetail(String docCode);
	//작성된 문서내용 불러오기
	List<DocDataVo> selectDocDataList(String docCode);
	//작성된 문서 결재자 불러오기
	List<ApprovalListVo> selectApproverList(String docCode);
	//작성된 문서 참조인 불러오기
	List<ApprovalRefVo> selectRefVoList(String docCode);
	//작성된 파일 불러오기
	List<ApprovalFileVo> selectFileVoList(String docCode);
	//결재타입 갯수 구하기
	List<ApprovalListVo> selectTypeCountList(String docCode);
	//반려 메세지
	DocCommentVo selectUnApprComment(String docCode);
	//결재 수정,삭제 여부 판단
	ApprovalListVo selectSeq(String docCode);
	//문서 수정
	int updateApprovalDoc(ApprovalDocVo docVo);
	//문서 삭제
	int updateDocDelete(ApprovalDocVo vo);
	//문서 승인
	int updateApprove(ApprovalListVo vo);
	//문서 반려
	int updateUnApprove(ApprovalListVo apprVo);
	
	//문서 갯수 조회
	int selectProgressTotalCnt(ApprovalDocVo vo);
	//문서 목록 조회
	List<ApprovalDocVo> selectProgressDocList(ApprovalDocVo vo, PageVo pv);
	//결재 예정 리스트 개수 구하기
	int selectExpectCount(ApprovalDocVo vo);
	//결재 예정 문서 목록 조회
	List<ApprovalDocVo> selectExpectDocList(ApprovalDocVo vo, PageVo pv);
	//결재 확인 문서 전체 갯수 조회
	int selectRefListTotalCnt(ApprovalDocVo vo);
	//결재 확인 문서 목록 조회
	List<ApprovalDocVo> selectRefDocList(ApprovalDocVo vo, PageVo pv);
	//결재 대기 문서 전체 갯수 조회
	int selectWaitListTotalCnt(ApprovalDocVo vo);
	//결재 대기 문서 목록 조회
	List<ApprovalDocVo> selectWaitList(ApprovalDocVo vo, PageVo pv);
	//결재 진행 문서 전체 갯수 조회
	int selectProgressListTotalCnt(ApprovalDocVo vo);
	//결재 진행 문서 목록 조회
	List<ApprovalDocVo> selectProgressList(ApprovalDocVo vo, PageVo pv);
	
	//문서함 - 전체 문서 갯수
	int selectCompletAllTotalCnt(ApprovalDocVo vo);
	//문서함 - 전체 문서 목록 조회
	List<ApprovalDocVo> selectCompletAllList(ApprovalDocVo vo, PageVo pv);
	//문서함 - 기안 문서 전체 갯수
	int selectCompletWriteTotalCnt(ApprovalDocVo vo);
	//문서함 - 기안 문서 목록 조회
	List<ApprovalDocVo> selectCompletWriteDocList(ApprovalDocVo vo, PageVo pv);
	//문서함 - 결재 문서 전체 갯수
	int selectCompletApprTotalCnt(ApprovalDocVo vo);
	//문서함 - 결재 문서 목록 조회
	List<ApprovalDocVo> selectCompletApprDocList(ApprovalDocVo vo, PageVo pv);
	//문서함 - 참조 문서 전체 갯수
	int selectCompletRefTotalCnt(ApprovalDocVo vo);
	//문서함 - 참조 문서 목록 조회
	List<ApprovalDocVo> selectCompletRefDocList(ApprovalDocVo vo, PageVo pv);
	//문서함 - 반려 문서 전체 갯수
	int selectUnApprTotalCnt(ApprovalDocVo vo);
	//문서함 - 반려 문서 목록 조회
	List<ApprovalDocVo> selectUnApprDocList(ApprovalDocVo vo, PageVo pv);

	
	//문서 양식 목록 조회
	List<DocFormVo> selectDocFormList();
	//문서 양식 상세 조회
	DocFormVo selectDocForm(int formCode);
	
	
	
	
	//문서 양식상세 항목 불러오기
	List<DocFormDetailTemplateVo> selectFormDetailList();
	//문서양식 insert
	int insertForm(DocFormVo formVo);
	//문서양식 수정
	int updateDocForm(DocFormVo vo);
	//전체 문서 갯수 조회
	int selectAllDocTotalCnt(ApprovalDocVo vo);
	//전체 문서 목록 조회
	List<ApprovalDocVo> selectAllDocList(ApprovalDocVo vo, PageVo pv);
	//삭제 문서 갯수 조회
	int selectApprDeleteDocTotalCnt(ApprovalDocVo vo);
	//삭제 문서 목록 조회
	List<ApprovalDocVo> selectApprDeleteDocList(ApprovalDocVo vo, PageVo pv);
	
	
	
	
	
	
	
	

	










	
	
	
}
