<%@page import="com.kh.app00.smtp.SmtpVo"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.kh.app00.smtp.NaverSMTP"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
	<%
	// 폼값(이메일 내용) 저장
	//sendmain에서 넘어오는 from, to, subject를 empName이랑, empEMail로 수정하면 될듯, 제목과 내용은 고정하기, 난수생성 하기
	String content = (String)request.getAttribute("contentAll") ; // 내용
	
	Map<String, String> emailInfo = new HashMap<String, String>();
	emailInfo.put("from", "everyware1234@naver.com");  // 보내는 사람
	emailInfo.put("empEMail", request.getParameter("empEMail"));      // 받는 사람
	emailInfo.put("subject", "[EveryWare] 비밀번호 설정을 위한 임시 비밀번호 발송 메일입니다.");  // 제목
	emailInfo.put("format", "text/plain;charset=UTF-8");
    emailInfo.put("content", content);

    try {
	    NaverSMTP smtpServer = new NaverSMTP();  // 메일 전송 클래스 생성
	    smtpServer.emailSending(emailInfo);      // 전송
	    out.print("이메일 전송 성공");
	}
	catch (Exception e) {
	    out.print("이메일 전송 실패");
	    e.printStackTrace();
	}
	%>
	
	
	
	