<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper"  style="background-color: white">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
    	 <%@ include file="/WEB-INF/views/notice/sidemenu-content.jsp" %>
    	 <div class="main-content">
		 	<h2 id="mailall">공지사항 작성</h2>
		 		<br>
		 	<div class="buttonSet">
		 		<button type="button" id="sendBtn" class="btn btn-primary">확인</button>
		 	</div>
	</div>
	</div>
</body>
</html>