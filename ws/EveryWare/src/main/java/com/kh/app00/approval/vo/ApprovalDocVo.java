package com.kh.app00.approval.vo;

import lombok.Data;

@Data
public class ApprovalDocVo {
	private String docCode;
	private String periodCode;
	private String doc_formCode;
	private String empCode;
	private String docTitle;
	private String docEnrollDate;
	private String docUpdated;
	private String docStatus;
	
	private String formName;
	private String empName;
}
