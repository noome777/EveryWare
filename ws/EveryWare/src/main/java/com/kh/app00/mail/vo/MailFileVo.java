package com.kh.app00.mail.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MailFileVo {
	
	private String mailFilecode;
	private String mailCode;
	private String mailChangename;
	private String mailOriginname;
	private String mailFileroot;
	
	private MultipartFile[] f;
}
