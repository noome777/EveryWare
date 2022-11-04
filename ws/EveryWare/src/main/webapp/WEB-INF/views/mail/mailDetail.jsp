<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
				<button type="button" id="sendBtn" class="btn btn-primary" onclick="location.href='${root}/mail/reply'">답장</button>
				<button type="button" id="cancelBtn" class="btn btn-primary">삭제</button>
			</div>

			<div class="card shadow">
				<div class="card-body">
					<div class="title">
						<h2>title 입니다</h2>

					</div>
					<div class="date_cover">
						<p class="send_date">
							<span class="blind">받은 날짜:</span> 2022-10-18 (화) 21:07
						</p>
					</div>
					<div class="send_cover">
						<p class="send_date">
							<span class="blind">보낸 사람</span> hello@naver.com
						</p>
					</div>
					<div class="date_cover">
						<p class="send_date">
							<span class="blind">받는 사람</span> bye@naver.com
						</p>
					</div>
				</div>
				<hr>
				<div class="content">
					<div
						style="padding: 2em 2em; margin: 2em 0; color: black; background: #FFF; border: solid 0px #black; border-radius: 10px;">
						<p>내용.</p>
						<p>블라블라</p>
					</div>
				</div>

			</div>

		</main>
	</div>
</body>
</html>