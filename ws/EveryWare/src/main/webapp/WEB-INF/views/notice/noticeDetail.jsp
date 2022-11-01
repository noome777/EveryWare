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
	  <c:if test="${ loginMember.empId eq 'admin' }">
		<div class="buttonSet">
				<button type="button" id="sendBtn" class="btn btn-primary"  onclick="location.href='${root}/notice/noticeEdit/${nvo.noticeCode}'">수정</button>
				<button type="button" id="sendBtn" class="btn btn-primary"  onclick="location.href='${root}/notice/noticeDelete/${nvo.noticeCode}'">삭제</button>
		</div>
		</c:if>
		<div class="card shadow">
			<div class="card-body">
				<div class="title" name="noticeTitle">
					${nvo.noticeTitle}
				</div>
				<br>
				<div class="date_cover">
					<p class="send_date">
						<span class="blind">관리자</span>
					</p>
				</div>
				<div class="send_cover">
					<p class="send_date">
						<span class="views">조회수</span> ${nvo.noticeViews}
					</p>
					
				</div>
				<div class="date_cover">
						<p>${nvo.noticeDate}</p>
				</div>
				<div class="file_cover">
						<a href="${root}/notice/download">파일 다운로드</a>
				</div>
			</div>
			<hr>
			<div class="content">
				<div
					style="padding: 2em 2em; margin: 2em 0; color: black; background: #FFF; border: solid 0px #black; border-radius: 10px;">
						${nvo.noticeContent}
				</div>
				
			</div>
			</div>
		
				

	</main>
</body>
</html>