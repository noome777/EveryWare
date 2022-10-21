package com.kh.app00.contacts.vo;

import com.kh.app00.commute.vo.CommuteVo;

import lombok.Data;

@Data
public class ContactsVo {

	private String contactNo;
    private String empCode;
    private String contactName;
    private String contactEmail;
    private String contactTel;
    private String contactCompany;
    private String contactMemo;
	
}
