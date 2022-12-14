package com.kh.app00.approval.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	//결재문서 작성
	@Override
	public int insertApprovalDoc(SqlSessionTemplate sst, ApprovalDocVo docVo) {
		return sst.insert("approvalMapper.insertApprovalDoc", docVo);
	}
	//문서실제데이터 insert
	@Override
	public int insertDocData(SqlSessionTemplate sst, List<DocDataVo> docDataList) {
		return sst.insert("approvalMapper.insertDocData", docDataList);
	}
	//결재자리스트 insert
	@Override
	public int insertApproverList(SqlSessionTemplate sst, List<ApprovalListVo> approverList) {
		return sst.insert("approvalMapper.insertApproverList", approverList);
	}
	//참조인 insert
	@Override
	public int insertApprovalRef(SqlSessionTemplate sst, List<ApprovalRefVo> approvalRefList) {
		return sst.insert("approvalMapper.insertApprovalRef", approvalRefList);
	}
	//첨부파일 insert
	@Override
	public int insertApprovalFile(SqlSessionTemplate sst, List<ApprovalFileVo> approvalFileList) {
		return sst.insert("approvalMapper.insertApprovalFile", approvalFileList);
	}
	//작성된 문서 상세정보 불러오기
	@Override
	public ApprovalDocVo selectDocDetail(SqlSessionTemplate sst, String docCode) {
		return sst.selectOne("approvalMapper.selectDocDetail", docCode);
	}
	//작성된 문서내용 불러오기
	@Override
	public List<DocDataVo> selectDocDataList(SqlSessionTemplate sst, String docCode) {
		return sst.selectList("approvalMapper.selectDocDataList", docCode);
	}
	//작성된 문서 결재자 불러오기
	@Override
	public List<ApprovalListVo> selectApproverList(SqlSessionTemplate sst, String docCode) {
		return sst.selectList("approvalMapper.selectApproverList", docCode);
	}
	//작성된 문서 참조인 불러오기
	@Override
	public List<ApprovalRefVo> selectRefVoList(SqlSessionTemplate sst, String docCode) {
		return sst.selectList("approvalMapper.selectRefVoList", docCode);
	}
	//작성된 파일 불러오기
	@Override
	public List<ApprovalFileVo> selectFileVoList(SqlSessionTemplate sst, String docCode) {
		return sst.selectList("approvalMapper.selectFileVoList", docCode);
	}
	//결재타입 갯수 구하기
	@Override
	public List<ApprovalListVo> selectTypeCountList(SqlSessionTemplate sst, String docCode) {
		return sst.selectList("approvalMapper.selectTypeCountList", docCode);
	}
	//반려 메세지 조회
	@Override
	public DocCommentVo selectUnApprComment(SqlSessionTemplate sst, String docCode) {
		return sst.selectOne("approvalMapper.selectUnApprComment", docCode);
	}
	//첨부파일 다운로드
	@Override
	public ApprovalFileVo selectFileVo(SqlSessionTemplate sst, String fileCode) {
		return sst.selectOne("approvalMapper.selectFileVo", fileCode);
	}
	//결재 수정,삭제 여부 판단
	@Override
	public ApprovalListVo selectSeq(SqlSessionTemplate sst, String docCode) {
		return sst.selectOne("approvalMapper.selectSeq", docCode);
	}
	//문서 수정
	@Override
	public int updateDoc(SqlSessionTemplate sst, ApprovalDocVo docVo) {
		return sst.update("approvalMapper.updateDoc", docVo);
	}
	//기존 결재자 삭제
	@Override
	public int deleteApprover(SqlSessionTemplate sst, String docCode) {
		return sst.delete("approvalMapper.deleteApprover", docCode);
	}
	//기존 참조인 삭제
	@Override
	public int deleteRef(SqlSessionTemplate sst, String docCode) {
		return sst.delete("approvalMapper.deleteRef", docCode);
	}
	@Override
	public int updateDocData(SqlSessionTemplate sst, List<DocDataVo> docDataList) {
		return sst.update("approvalMapper.updateDocData", docDataList);
	}
	//기존 파일 삭제
	@Override
	public int deleteFile(SqlSessionTemplate sst, String docCode) {
		return sst.delete("approvalMapper.deleteFile", docCode);
	}
	//문서 삭제
	@Override
	public int updateDocDelete(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.update("approvalMapper.updateDocDelete", vo);
	}
	//문서 승인
	@Override
	public int updateApprove(SqlSessionTemplate sst, ApprovalListVo vo) {
		return sst.update("approvalMapper.updateApprove", vo);
	}
	//최종 결재권자 결재순서 가져오기
	@Override
	public ApprovalListVo maxApprSeq(SqlSessionTemplate sst, ApprovalListVo vo) {
		return sst.selectOne("approvalMapper.maxApprSeq", vo);
	}
	//문서 반려
	@Override
	public int updateUnApprove(SqlSessionTemplate sst, ApprovalListVo apprVo) {
		return sst.update("approvalMapper.updateUnApprove", apprVo);
	}
	//문서 반려 메세지
	@Override
	public int insertUnApproveComment(SqlSessionTemplate sst, ApprovalListVo apprVo) {
		return sst.insert("approvalMapper.insertUnApproveComment", apprVo);
	}
	//결재 문서 상태 변경 (반려)
	@Override
	public int updateDocApprStatus(SqlSessionTemplate sst, ApprovalListVo apprVo) {
		return sst.update("approvalMapper.updateDocApprStatus", apprVo);
	}
	//결재 완료 날짜
	@Override
	public int updateDocApprDate(SqlSessionTemplate sst, ApprovalListVo apprVo) {
		return sst.update("approvalMapper.updateDocApprDate", apprVo);
	}
	//진행 - 전체 문서 갯수 조회
	@Override
	public int selectProgressTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectProgressTotalCnt", vo);
	}
	//진행 - 전체 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectProgressDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectProgressDocList", vo, rb);
	}
	//결재 예정 리스트 개수 구하기
	@Override
	public int selectExpectCount(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectExpectCount", vo);
	}
	//결재 예정 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectExpectDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		
		return sst.selectList("approvalMapper.selectExpectDocList", vo, rb);
	}
	//결재 확인 문서 전체 갯수 조회
	@Override
	public int selectRefListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectRefListTotalCnt", vo);
	}
	//결재 확인 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectRefDocList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectRefDocList", vo, rb);
	}
	//결제 대기 문서 전체 갯수 조회
	@Override
	public int selectWaitListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectWaitListTotalCnt", vo);
	}
	//결재 대기 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectWaitList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectWaitList", vo, rb);
	}
	//결재 진행 문서 목록 전체 갯수 조회
	@Override
	public int selectProgressListTotalCnt(SqlSessionTemplate sst,  ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectProgressListTotalCnt", vo);
	}
	//결재 진행 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectProgressList(SqlSessionTemplate sst,  ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectProgressList", vo, rb);
	}
	//문서함 - 전체 문서 갯수
	@Override
	public int selectCompletAllTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectCompletAllTotalCnt", vo);
	}
	//문서함 - 전체 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectCompletAllList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectCompletAllList", vo, rb);
	}
	//문서함 - 기안 문서 전체 갯수
	@Override
	public int selectCompletWriteTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectCompletWriteTotalCnt", vo);
	}
	//문서함 - 기안 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectCompletWriteDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectCompletWriteDocList", vo, rb);
	}
	//문서함 - 결재 문서 전체 갯수
	@Override
	public int selectCompletApprTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectCompletApprTotalCnt", vo);
	}
	//문서함 - 결재 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectCompletApprDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectCompletApprDocList", vo, rb);
	}
	//문서함 - 참조 문서 전체 갯수
	@Override
	public int selectCompletRefTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectCompletRefTotalCnt", vo);
	}
	//문서함 - 참조 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectCompletRefDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectCompletRefDocList", vo, rb);
	}
	//문서함 - 반려 문서 전체 갯수
	@Override
	public int selectUnApprTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectUnApprTotalCnt", vo);
	}
	//문서함 - 반려 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectUnApprDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectUnApprDocList", vo, rb);
	}
	//임시저장 문서 전체 갯수
	@Override
	public int selectStorageTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectStorageTotalCnt", vo);
	}
	//임시저장 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectStorageList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectStorageList", vo, rb);
	}
	//임시저장 문서 삭제
	@Override
	public int deleteStorage(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.update("approvalMapper.deleteStorage", vo);
	}
	//문서 양식 목록 조회
	@Override
	public List<DocFormVo> selectDocFormList(SqlSessionTemplate sst) {
		return sst.selectList("approvalMapper.selectDocFormList");
	}
	//문서 양식 상세 조회
	@Override
	public DocFormVo selectDocForm(SqlSessionTemplate sst, int formCode) {
		return sst.selectOne("approvalMapper.selectDocForm", formCode);
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
	//문서양식 수정
	@Override
	public int updateDocForm(SqlSessionTemplate sst, DocFormVo vo) {
		return sst.update("approvalMapper.updateDocForm", vo);
	}
	//전체 문서 갯수 조회
	@Override
	public int selectAllDocTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectAllDocTotalCnt", vo);
	}
	//전체 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectAllDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectAllDocList", vo, rb);
	}
	//삭제 문서 갯수 조회
	@Override
	public int selectApprDeleteDocTotalCnt(SqlSessionTemplate sst, ApprovalDocVo vo) {
		return sst.selectOne("approvalMapper.selectApprDeleteDocTotalCnt", vo);
	}
	//삭제 문서 목록 조회
	@Override
	public List<ApprovalDocVo> selectApprDeleteDocList(SqlSessionTemplate sst, ApprovalDocVo vo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("approvalMapper.selectApprDeleteDocList", vo, rb);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	
	

	
	

	

	

	
	
	
	

}
