package com.kh.app00.smtp;

import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// 네이버 SMTP 서버를 통해 이메일을 전송하는 클래스
public class NaverSMTP {
    private final Properties serverInfo; // 서버 정보
    private final Authenticator auth;    // 인증 정보

    public NaverSMTP() {
        // 네이버 SMTP 서버 접속 정보
        serverInfo = new Properties();
        serverInfo.put("mail.smtp.host", "smtp.naver.com");
        serverInfo.put("mail.smtp.port", "465");
        serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
        serverInfo.put("mail.smtp.starttls.enable", "true");
        serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 이걸 생략하면 메세지 전송 실패함
        serverInfo.put("mail.smtp.auth", "true");
        serverInfo.put("mail.smtp.debug", "true");
        serverInfo.put("mail.smtp.socketFactory.port", "465");
        serverInfo.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        serverInfo.put("mail.smtp.socketFactory.fallback", "false");

        // 사용자 인증 정보
        auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("everyware1234", "Everyware1234!");
            }
        };
    }

    // 주어진 메일 내용을 네이버 SMTP 서버를 통해 전송합니다.
    public void emailSending(Map<String, String> emailInfo) throws MessagingException {
        // 1. 세션 생성
        Session session = Session.getInstance(serverInfo, auth);
        session.setDebug(true);

        // 2. 메시지 작성
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(emailInfo.get("from")));     // 보내는 사람
        msg.addRecipient(Message.RecipientType.TO,
                         new InternetAddress(emailInfo.get("empEMail")));  // 받는 사람
        msg.setSubject(emailInfo.get("subject"));                    // 제목
        msg.setContent(emailInfo.get("content"), emailInfo.get("format"));  // 내용

        // 3. 전송
        Transport.send(msg);
    }
}