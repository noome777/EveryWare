package com.kh.app00.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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

public interface ApprovalDao {
	
	//문서종류 불러오기
	List<DocFormVo> selectFormList(SqlSessionTemplate sst);
	//보존연한 불러오기
	List<DocPeriodVo> selectPeriodList(SqlSessionTemplate sst);
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

	//결재문서 작성
	int insertApprovalDoc(SqlSessionTemplate sst, ApprovalDocVo docVo);
	//문서실제데이터 insert
	int insertDocData(SqlSessionTemplate sst, List<DocDataVo> docDataList);
	//결재자리스트 insert
	int insertApproverList(SqlSessionTemplate sst,List<ApprovalListVo> approverList);
	//참조인 insert
	int insertApprovalRef(SqlSessionTemplate sst,List<ApprovalRefVo> approvalRefList);
	//첨부파일 insert
	int insertApprovalFile(SqlSessionTemplate sst,List<ApprovalFileVo> approvalFileList);
	
	//작성된 문서 상세정보 불러오기
	ApprovalDocVo selectDocDetail(SqlSessionTemplate sst, String docCode);
	//작성된 문서내용 불러오기
	List<DocDataVo> selectDocDataList(SqlSessionTemplate sst, String docCode);
	//작성된 문서 결재자 불러오기
	List<ApprovalListVo> selectApproverList(SqlSessionTemplate sst, String docCode);
	//작성된 문서 참조인 불러오기
	List<ApprovalRefVo> selectRefVoList(SqlSessionTemplate sst, String docCode);
	//작성된 파일 불러오기
	List<ApprovalFileVo> selectFileVoList(SqlSessionTemplate sst, String docCode);
	//결재타입 갯수 구하기
	List<ApprovalListVo> selectTypeCountList(SqlSessionTemplate sst, String docCode);
	//결재 수정,삭제 여부 판단
	ApprovalListVo selectSeq(SqlSessionTemplate sst, String docCode);
	//문서 삭제
	int updateDoc(SqlSessionTemplate sst, ApprovalDocVo docVo);
	int updateDocData(SqlSessionTemplate sst, List<DocDataVo> docDataList);
	//문서 삭제
	int updateDocDelete(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서 승인
	int updateApprove(SqlSessionTemplate sst, ApprovalListVo vo);
	//최종 결재권자 결재순서 가져오기
	ApprovalListVo maxApprSeq(SqlSessionTemplate sst, ApprovalListVo vo);
	//문서 반려
	int updateUnApprove(SqlSessionTemplate sst, ApprovalListVo apprVo);
	//문서 반려 코멘트
	int insertUnApproveComment(SqlSessionTemplate sst, ApprovalListVo apprVo);
	//반려로 인한 문서 결재상태 처리
	int updateDocApprStatus(SqlSessionTemplate sst, ApprovalListVo apprVo);
	//반려 메세지 조회
	DocCommentVo selectUnApprComment(SqlSessionTemplate sst, String docCode);
	//결재 완료일자 update
	int updateDocApprDate(SqlSessionTemplate sst, ApprovalListVo apprVo);
	
	//문서 갯수 조회
	int selectProgressTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서 목록 조회
	List<ApprovalDocVo> selectProgressDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//결재 예정 리스트 개수 구하기
	int selectExpectCount(SqlSessionTemplate sst, ApprovalDocVo vo);
	//결재 예정 문서 목록 조회
	List<ApprovalDocVo> selectExpectDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//결재 확인 문서 전체 갯수 조회
	int selectRefListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo);
	//결재 확인 문서 목록 조회
	List<ApprovalDocVo> selectRefDocList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv);
	//결재 대기 문서 전체 갯수 조회
	int selectWaitListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo);
	//결재 대기 문서 조회
	List<ApprovalDocVo> selectWaitList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv);
	//결재 진행 문서 전채 갯수 조회
	int selectProgressListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo);
	//결재 진행 문서 목록 조회
	List<ApprovalDocVo> selectProgressList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv);

	//문서함 - 전체 문서 갯수
	int selectCompletAllTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서함 - 전체 문서 목록 조회
	List<ApprovalDocVo> selectCompletAllList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//문서함 - 기안 문서 전체 갯수
	int selectCompletWriteTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서함 - 기안 문서 목록 조회
	List<ApprovalDocVo> selectCompletWriteDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//문서함 - 결재 문서 전체 갯수
	int selectCompletApprTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서함 - 결재 문서 목록 조회
	List<ApprovalDocVo> selectCompletApprDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//문서함 - 참조 문서 전체 갯수
	int selectCompletRefTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서함 - 참조 문서 목록 조회
	List<ApprovalDocVo> selectCompletRefDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//문서함 - 반려 문서 전체 갯수
	int selectUnApprTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//문서함 - 반려 문서 목록 조회
	List<ApprovalDocVo> selectUnApprDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	
	//문서 양식 목록 조회
	List<DocFormVo> selectDocFormList(SqlSessionTemplate sst);
	//문서 양식 상세 조회
	DocFormVo selectDocForm(SqlSessionTemplate sst, int formCode);


	//문서 양식상세 항목 불러오기
	List<DocFormDetailTemplateVo> selectFormDetailList(SqlSessionTemplate sst);
	//문서양식 insert
	//docForm insert
	int insertDocForm(SqlSessionTemplate sst, DocFormVo formVo);
	//docFormMapping insert
	int insertDocFormMapping(SqlSessionTemplate sst, List<DocFormMapperVo> mappingList);
	//문서양식 수정
	int updateDocForm(SqlSessionTemplate sst, DocFormVo vo);
	//전체 문서 갯수 조회
	int selectAllDocTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//전체 문서 목록 조회
	List<ApprovalDocVo> selectAllDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	//삭제 문서 갯수 조회
	int selectApprDeleteDocTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo);
	//삭제 문서 목록 조회
	List<ApprovalDocVo> selectApprDeleteDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv);
	
	
	
	
	
	

	
	
	






	
	




	
}
