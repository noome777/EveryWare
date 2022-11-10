package com.kh.app00.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeFileVo {
	
	private String noticeFilecode;
	private String noticeCode;
	private String noticeChangename;
	private String noticeOriginname;
	private String noticeFileroot;
	
	private MultipartFile[] f;
}
