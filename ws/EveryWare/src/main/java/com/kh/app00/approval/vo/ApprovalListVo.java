package com.kh.app00.approval.vo;

import lombok.Data;

@Data
public class ApprovalListVo {
	private String docCode;
	private String apprTypeCode;
	private String apprEmpCode;
	private String apprSeq;
	private String apprDate;
	private String apprStatus;
	
	private String empName;
	private String deptName;
	private String rankName;
	private String apprTypeName;
	private String comContent;
	private String maxSeq;
}
