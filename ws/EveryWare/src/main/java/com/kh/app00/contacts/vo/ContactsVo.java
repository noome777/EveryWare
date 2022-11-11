package com.kh.app00.contacts.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ContactsVo {

	private String conNo;
	private String conWriter;
    private String conName;
    private String conEmail;
    private String conTel;
    private String conCompany;
    private String conMemo;
    private String fileName;
    private MultipartFile profile;
	
}
