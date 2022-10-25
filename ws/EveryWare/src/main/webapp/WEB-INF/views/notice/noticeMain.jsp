<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#noticeall {
	font-size: 30px;
}

#noticelist {
	width: 100%;
	align-content: center;
}

.search-txt {
	border-radius: 3px;
}

.search-btn {
	border-radius: 3px;
	background-color: white;
}

#title{
	text-align: center;
}
#date {
	text-align: center;
}
#ntitle{
	text-align: center;
}
#ndate{
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/notice/sidemenu-content.jsp"%>
		<main role="main" class="main-content">

			<h1 id="noticeall">사내 공지</h1>
			<br>

			<!-- <div class="input-group w-50" >
		<span class="input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
		</svg>
		</span>
		<input type="text" class="form-control" aria-label="mailSearch" id="mailSearch" placeholder="메일검색"  aria-describedby="basic-addon1">
		</div> -->
			<div class="card shadow">
				<div class="card-body">
					<table class="table table-striped" id="noticelist">

						<tr>
							<th>번호</th>
							<th id="title">제목</th>
							<th id="date">등록일</th>
						</tr>
							<tbody>
							<c:forEach items="${nList}" var="x">
								<tr onclick="location.href='${root}/notice/detail'">
								<td>${x.noticeCode}</td>
								<td id="ntitle">${x.noticeTitle}</td>
								<td id="ndate">${x.noticeDate}</td>
								</tr>
								</c:forEach>
							</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<li class="page-item"><a class="page-link" href="#">Previous</a></li>
							<li class="page-item"><a class="page-link" href="#">1</a></li>
							<li class="page-item"><a class="page-link" href="#">2</a></li>
							<li class="page-item"><a class="page-link" href="#">3</a></li>
							<li class="page-item"><a class="page-link" href="#">Next</a></li>
						</ul>
					</nav>

				</div>
			</div>
		</main>
	</div>
</body>
</html>