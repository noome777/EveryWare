package com.kh.app00.mail.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MailVo {
	
	private String mailCode;
	private String empCode;
	private String mailSender;
	private String mailTitle;
	private String mailContent;
	private String mailSenddate;
	private String mailReceiver;
	private String mailViews;
	private String mailDelete;
	
	//검색 필터
	private String searchType;
	private String keyword;
	private String search;
	
	private MultipartFile[] f;
}
