package com.kh.app00.emp.vo;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmpVo {

    private String empCode;
	private String comCode;
	private String deptCode;
	private String rankCode;
	private String empJobCode;
	private String rightCode;
    private String empName;
    private String empId;
    private String empPwd;
    private String empEMail;
    private String empBirthday;
    private String empTel;
    private String empPhone;
    private String empJoinDate;
    private String empPromotionDate;
    private String empAddress1;
    private String empAddress2;
    private String empStatus;
    private String empAccountNo;
    private String empProfileName;
    private String empLastLoginDate;
    private String empFileName;
    
    private MultipartFile profile;
    private MultipartFile signFile;
    
    
    private String deptName;
    private String rankName;
    private String jobName;
    private String rightName;
    
    public void encodePwd(PasswordEncoder pwdEnc) {
		
		this.empPwd = pwdEnc.encode(empPwd);
	}
    
}