package com.kh.app00.mail.vo;

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
	private String mailDelete;
}
