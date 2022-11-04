package com.kh.app00.approval.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.app00.approval.doc.vo.DocDataVo;

import lombok.Data;

@Data
public class ApprovalDocVo {
	private String docCode;
	private String periodCode;
	private String docFormCode;
	private String empCode;
	private String docTitle;
	private String docEnrollDate;
	private String docUpdated;
	private String docStatus;
	private String docApprDate;
	
	private String formName;
	private String empName;
	private String deptName;
	private String rankName;
	private String period;
	private String rightCode;
	private String status;
	private String deptCode;
	
	private List<DocDataVo> docDataList;
	private List<ApprovalListVo> approverList;
	private List<ApprovalRefVo> approvalRefList;
	
}
