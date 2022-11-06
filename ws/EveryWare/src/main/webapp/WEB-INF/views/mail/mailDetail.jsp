<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.buttonSet {
	margin-bottom: 20px;
}

.title {
	font-size: 20px;
}
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp"%>
		<main role="main" class="main-content">
			<div class="buttonSet">
			<input type="hidden" id="mailSender" class="mailSender" value="${mvo.mailSender}"/>
			<input type="hidden" id="mailReceiver" class="mailReceiver" value="${mvo.mailReceiver}"/>
			<c:set var = "mailSend" value="${mvo.mailSender}"/>
			<c:set var = "mailReci" value="${mvo.mailReceiver}"/>
			<c:if test="${loginMember.empId ne fn:split(mailSend,'@')[0]  && loginMember.empId eq fn:split(mailReci,'@')[0]}">
				<button type="button" id="sendBtn" class="btn btn-primary" onclick="location.href='${root}/mail/reply/${mvo.mailCode}'">답장</button>
				</c:if>
				<input type="button" value="삭제" id="deleteBtn" class="btn btn-danger"  onclick="location.href='${root}/mail/mailDelete/${mvo.mailCode}'"/>
			</div>
			<div class="card shadow">
				<div class="card-body">
				
					<div class="title">
						<h2>${mvo.mailTitle}</h2>

					</div>
					<div class="date_cover">
						<p class="send_date">
							<span class="blind">받은 날짜:${mvo.mailSenddate}</span> 
						</p>
					</div>
					<div class="send_cover">
						<p class="send_date">
							<span class="blind">보낸 사람:${mvo.mailSender}</span>
						</p>
					</div>
					<div class="date_cover">
						<p class="send_date">
							<span class="blind">받는 사람:${mvo.mailReceiver}</span>
						</p>
					</div>
				</div>
				<hr>
				<div class="content">
					<div
						style="padding: 2em 2em; margin: 2em 0; color: black; background: #FFF; border: solid 0px #black; border-radius: 10px;">
						<p>${mvo.mailContent}</p>
					</div>
				</div>

			</div>

		</main>
	</div>
</body>
</html>