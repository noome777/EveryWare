<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴지통</title>
<style>
#mailReceive {
	font-size: 20px;
}

#maillist {
	margin-top: 30px;
}

.search-txt {
	border-radius: 3px;
}

.search-btn {
	border-radius: 3px;
	background-color: white;
}

.buttonSet {
	margin-bottom: 20px;
}
#sender {
	text-align: center;
}

#title {
	text-align: center;
}

#senddate {
	text-align: center;
}

#msender {
	text-align: center;
}

#mtitle {
	text-align: center;
}

#mSenddate {
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp"%>
		<div class="main-content">

			<h2 id="mailSend">휴지통</h2>
			<br>
			<form action="${root}/mail/mailTrashSearch/${pno}" method="get" name="mailt" onsubmit="return Checkform">
			<div class="form-group row " style="margin-left: 3px;">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType" id="searchType"
						>
						<option value="title">제목</option>
						<option value="send_id">발신자</option>
						<option value="all">전체</option>
					</select>
				</div>
				<div class="w300" style="padding-right: 10px">
					<input type="text" class="form-control form-control-sm"
						name="keyword" id="keyword" >
				</div>
				<div>
					<input  type="submit" class="btn btn-sm btn-primary" name="search" 
						id="search" value="검색">
				</div>
				</div>
			</form>
			<!-- <div class="input-group w-50" >
		<span class="input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
		</svg>
		</span>
		<input type="text" class="form-control" aria-label="mailSearch" id="mailSearch" placeholder="메일검색"  aria-describedby="basic-addon1">
		</div> -->

			<br>
			<div class="buttonSet">
				<input type="button" value="삭제" id="deleteBtn"
						onclick="cleanValue();" class="btn btn-primary"/>
						<input type="button" value="복원" id="deleteBtn"
						onclick="backValue();" class="btn btn-primary"/>
			</div>

			<div class="card shadow">
				<div class="card-body" id = "trashListForm">

					<table class="table table-striped" id="maillist">

						<tr>
							<th><input type="checkbox" name="allCheckbox"
									id="allCheckbox"></th>
							<th id="sender">발신자</th>
							<th id="title">제목</th>
							<th id="senddate">작성일</th>
						</tr>
						<tbody>
							<c:forEach items="${trashList}" var="t">
							<input type="hidden" id="mailReceiver" class="mailReceiver" value="${t.mailReceiver}"/>
										<c:set var = "mailRecev" value="${t.mailReceiver}"/>
										<c:set var = "mailS" value="${t.mailSender}"/>
									<c:if test="${t.mailDelete ne null && loginMember.empId eq fn:split(mailRecev,'@')[0] || loginMember.empId eq fn:split(mailS,'@')[0]}">
										<tr >
											<td><input type="checkbox" name="trashCheck"
												class="trashCheck" value="${t.mailCode}" onclick="event.stopPropagation()"></td>
											<td id="msender">${fn:split(mailS,'@')[0]}</td>
											<td id="mtitle">${t.mailTitle}</td>
											<td id="mSenddate">${t.mailSenddate}</td>
										</tr>
									</c:if>
								</c:forEach>
						</tbody>
					</table>
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<c:if test="${pv.startPage ne 1}">
								<li class="page-item"><a class="page-link" href="/app00/mail/trash/${pv.startPage - 1}">Previous</a></li>
							</c:if>

							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
								<li class="page-item"><a class="page-link"
									href="/app00/mail/trash/${i}">${i}</a></li>
							</c:forEach>

							<c:if test="${pv.endPage ne pv.maxPage}">
								<li class="page-item"><a class="page-link" href="/app00/mail/trash/${pv.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	
	//전체선택
		
		$('#trashListForm #allCheckbox').on('click', function() {
		if ($('#allCheckbox').prop("checked")) {
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
function cleanValue() {
			
			
			// 체크된 애들 번호를 전달하기
			
			//1. 체크박스 전부 가져오기
			//2. 1에서 가져온 요소의 숫자 가져오기
			//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
			let trashArr = [];
			
			$('input:checkbox[name=trashCheck]').each(function (index) {
				if($(this).is(":checked")){
					console.log(this);
					trash = $(this).val();
					trashArr.push(trash);
					
			    }
			})
			
			if (trashArr.length == 0) {
 				alert("선택된 글이 없습니다.");
 			} 
			
			$.ajax({
 					url : "${root}/mail/mailClean",
 					method : "POST",
 					traditional : true,
 					data : {trashArr : trashArr},
 					success : function(tdata) {
 						if (tdata == 'ok') {
 							alert("삭제 성공");
 							location.replace("${root}/mail/trash/${pno}");
 						} else {
 							alert("삭제 실패");
 						}
					},
					error : function(){
						alert("삭제 실패(ERROR)");
					}
				})
		   
		}
		
function backValue() {
	
	
	// 체크된 애들 번호를 전달하기
	
	//1. 체크박스 전부 가져오기
	//2. 1에서 가져온 요소의 숫자 가져오기
	//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
	let backArr = [];
	
	$('input:checkbox[name=trashCheck]').each(function (index) {
		if($(this).is(":checked")){
			console.log(this);
			back = $(this).val();
			backArr.push(back);
			
	    }
	})
	
	if (backArr.length == 0) {
			alert("선택된 글이 없습니다.");
		} 
	
	$.ajax({
				url : "${root}/mail/mailBack",
				method : "POST",
				traditional : true,
				data : {backArr : backArr},
				success : function(bdata) {
					if (bdata == 'ok') {
						alert("복원 성공");
						location.replace("${root}/mail/trash/${pno}");
					} else {
						alert("복원 실패");
					}
			},
			error : function(){
				alert("복원 실패(ERROR)");
			}
		})
   
}
 	</script>
</body>
</html>