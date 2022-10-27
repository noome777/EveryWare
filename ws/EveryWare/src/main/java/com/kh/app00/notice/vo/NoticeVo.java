package com.kh.app00.notice.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVo {
	
	private String noticeCode;
	private String noticeTitle;
	private String noticeContent;
	private String noticeViews;
	private String noticeDate;
	private String noticeUpdate;
	private String noticeDelete;
	private MultipartFile[] f; 
	
}
