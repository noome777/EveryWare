package com.kh.app00.smtp;

import lombok.Data;

@Data
public class SmtpVo {
    
    private String from; 
    private String to; 
    private String subject; 
    private String content; 

}


