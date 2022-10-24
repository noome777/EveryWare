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

 #reply-top{
    	border-bottom: 1px dashed black;
    }
    
    #reply-top > textarea{
    	width : 80%;
    }
    
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/notice/sidemenu-content.jsp"%>
	</div>

	<main role="main" class="main-content">
		<div class="buttonSet">
				<button type="button" id="sendBtn" class="btn btn-primary">삭제</button>
		</div>
		<div class="card shadow">
			<div class="card-body">
				<div class="title" name="noticeTitle">
					<h2>${nvo.noticeTitle}</h2>
				</div>
				<div class="date_cover">
					<p class="send_date">
						<span class="blind">관리자</span>
					</p>
				</div>
				<div class="send_cover">
					<p class="send_date">
						<span class="blind">조회수</span>
					</p>
				</div>
				<div class="date_cover">
						<h2>${nvo.noticeDate}</h2>
				</div>
			</div>
			<hr>
			<div class="content">
				<div
					style="padding: 2em 2em; margin: 2em 0; color: black; background: #FFF; border: solid 0px #black; border-radius: 10px;">
						<h2>${nvo.noticeContent}</h2>
				</div>
				
				<div id="reply-top">
				<textarea id="reply-content" name="content"></textarea>
				<button id="reply-btn" class="btn btn-primary">댓글작성</button>
			</div>
			</div>
	
				
		</div>

	</main>
</body>
</html>