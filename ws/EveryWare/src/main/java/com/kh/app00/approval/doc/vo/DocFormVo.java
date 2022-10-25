package com.kh.app00.approval.doc.vo;

import java.util.List;

import lombok.Data;

@Data
public class DocFormVo {
	private String formCode;
	private String formName;
	private String formIntro;
	private String formUseYn;
	
	private List<DocFormMapperVo> formDetailList;
}
