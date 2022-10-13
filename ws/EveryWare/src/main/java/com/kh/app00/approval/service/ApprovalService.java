package com.kh.app00.approval.service;

import java.util.List;

import com.kh.app00.approval.vo.DocFormMapperVo;
import com.kh.app00.approval.vo.DocFormVo;
import com.kh.app00.approval.vo.DocPeriodVo;
import com.kh.app00.approval.vo.DocSecurityVo;

public interface ApprovalService {

	//문서종류 불러오기
	List<DocFormVo> selectFormList();

	//보존연한 불러오기
	List<DocPeriodVo> selectPeriodList();
	
	//보안등급 불러오기
	List<DocSecurityVo> selectSecurityList();

	//양식 내용 불러오기
	List<DocFormMapperVo> formSelect(int formCode);

	
	
	
}
