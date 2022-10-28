package com.kh.app00.approval.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

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
	
	//문서 갯수 조회
	int selectCountAll(SqlSessionTemplate sst);
	//문서 목록 조회
	List<ApprovalDocVo> selectDocList(SqlSessionTemplate sst, PageVo pv);

	
	
	//문서 양식상세 항목 불러오기
	List<DocFormDetailTemplateVo> selectFormDetailList(SqlSessionTemplate sst);
	//문서양식 insert
	//docForm insert
	int insertDocForm(SqlSessionTemplate sst, DocFormVo formVo);
	//docFormMapping insert
	int insertDocFormMapping(SqlSessionTemplate sst, List<DocFormMapperVo> mappingList);

	
	

	//작성된 문서 상세정보 불러오기
	ApprovalDocVo selectDocDetail(SqlSessionTemplate sst, String docCode);
	//작성된 문서내용 불러오기
	List<DocDataVo> selectDocDataList(SqlSessionTemplate sst, String docCode);
	//작성된 문서 결재자 불러오기
	List<ApprovalListVo> selectApproverList(SqlSessionTemplate sst, String docCode);
	//작성된 문서 참조인 불러오기
	List<ApprovalRefVo> selectRefVoList(SqlSessionTemplate sst, String docCode);
	//결재타입 갯수 구하기
	List<ApprovalListVo> selectTypeCountList(SqlSessionTemplate sst, String docCode);

	
	//결재 예정 리스트 개수 구하기
	int selectExpectCount(SqlSessionTemplate sst);
	//결재 예정 문서 목록 조회
	List<ApprovalDocVo> selectExpectDocList(SqlSessionTemplate sst, String empCode, PageVo pv);

	
	//결재 진행중인 참조된 문서
	List<ApprovalDocVo> selectRefDocList(SqlSessionTemplate sst, String empCode, PageVo pv);
	//결재 대기 문서 조회
	List<ApprovalDocVo> selectWaitList(SqlSessionTemplate sst, String empCode, PageVo pv);
	//결재 진행 문서 조회
	List<ApprovalDocVo> selectProgressList(SqlSessionTemplate sst, String empCode, PageVo pv);


	
	




	
}
