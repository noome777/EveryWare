package com.kh.app00.approval.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ApprovalFileVo {
	private String fileCode;
	private String docCode;
	private String originName;
	private String uploadName;
	private MultipartFile file;
}
