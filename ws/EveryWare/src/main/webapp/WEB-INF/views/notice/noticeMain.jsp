<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
#number{
	text-align: center;
}
#title {
	text-align: center;
}

#views{
	text-align: center;
}
#date {
	text-align: center;
}
#ncode{
	text-align:  center;
}
#ntitle {
	text-align: center;
}

#ndate {
	text-align: center;
}

#nviews{
	text-align:center;
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
							<th id=number>번호</th>
							<th id="title">제목</th>
							<th id="views">조회수</th> 
							<th id="date">등록일</th>
						</tr>
						<tbody>
							  
							<c:forEach items="${nList}" var="x">
								<c:if test="${x.noticeDelete eq null}">
								<c:set var = "noticeDat" value="${x.noticeDate}"/>
								<tr
									onclick="location.href='${root}/notice/noticeDetail/${x.noticeCode}'">
									<td id="ncode">${x.noticeCode}</td>
									<td id="ntitle">${x.noticeTitle}</td>
									<td id="nviews">${x.noticeViews}</td>
									<td id="ndate">${fn:substring(noticeDat,0,10)}</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
					
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<c:if test="${pv.startPage ne 1}">
								<li class="page-item"><a class="page-link" href="/app00/notice/noticeMain/${pv.startPage - 1}">Previous</a></li>
							</c:if>

							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
								<li class="page-item"><a class="page-link"
									href="/app00/notice/noticeMain/${i}">${i}</a></li>
							</c:forEach>

							<c:if test="${pv.endPage ne pv.maxPage}">
								<li class="page-item"><a class="page-link" href="/app00/notice/noticeMain/${pv.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
					</nav>

				</div>
			</div>
		</main>
	</div>
</body>
</html>