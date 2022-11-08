<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일홈</title>
<style>
#mailall {
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
.noRead {
	border: none;
	color: #0000CC;
	text-align:center;
	
}

.noRead:hover {
	text-decoration: underline;
}

.read {
	border: none;
	color: black;
	text-align:center;
}



.read:hover {
	text-decoration: underline;
}
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp"%>
		<div class="main-content">

			<h2 id="mailall">받은 메일함</h2>
			<br>
			<form action="${root}/mail/mailSearchreceive/${pno}" method="get" name="ms" onsubmit="return Checkform">
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
			<br>
			<div class="buttonSet">
				<input type="button" value="읽음" id="readBtn" onclick="readValue();"
					class="btn btn-primary"> <input type="button" value="안읽음"
					id="noreadBtn" onclick="noreadValue();" class="btn btn-primary">
				<input type="button" value="삭제" id="deleteBtn"
					onclick="deleteValue();" class="btn btn-danger"
					style="float: right;" />
			</div>
			<!-- <div class="input-group w-50" >
		<span class="input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
		</svg>
		</span>
		<input type="text" class="form-control" aria-label="mailSearch" id="mailSearch" placeholder="메일검색"  aria-describedby="basic-addon1">
		</div> -->
			<div class="card shadow">
				<div class="card-body" id="mailListForm">
					<table class="table table-striped" id="maillist">

						<tr>
							<th><input type="checkbox" name="allCheckbox"
								id="allCheckbox"></th>
							<th id="sender">발신자</th>
							<th id="title">제목</th>
							<th id="senddate">작성일</th>
						</tr>
						<tbody>
							<c:forEach items="${receiveList}" var="r">

								<input type="hidden" id="mailReceiver" class="mailReceiver"
									value="${r.mailReceiver}" />
								<c:set var="mailId" value="${r.mailReceiver}" />
								<c:set var="mailSend" value="${r.mailSender}" />
								<c:if
									test="${r.mailDelete eq null && loginMember.empId ne fn:split(mailSend,'@')[0] && loginMember.empId eq fn:split(mailId,'@')[0]}">
									<tr
										onclick="location.href='${root}/mail/mailDetail/${r.mailCode}'">
										<td><input type="checkbox" name="RowCheck"
											class="RowCheck" value="${r.mailCode}"
											onclick="event.stopPropagation()"></td>
										<td id="msender" onclick="event.stopPropagation()">${fn:split(mailSend,'@')[0]}</td>
										<c:if test="${r.mailViews == 0}">
											<td id="mtitle"><input class="noRead"
												value="${r.mailTitle}" /></td>
										</c:if>
										<c:if test="${r.mailViews != 0}">
											<td id="mtitle"><input class="read"
												value="${r.mailTitle}" /></td>
										</c:if>
										<td id="mSenddate" onclick="event.stopPropagation()">${r.mailSenddate}</td>

									</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>



					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<c:if test="${pv.startPage ne 1}">
								<li class="page-item"><a class="page-link"
									href="/app00/mail/receive/${pv.startPage - 1}">Previous</a></li>
							</c:if>

							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
								<li class="page-item"><a class="page-link"
									href="/app00/mail/receive/${i}">${i}</a></li>
							</c:forEach>

							<c:if test="${pv.endPage ne pv.maxPage}">
								<li class="page-item"><a class="page-link"
									href="/app00/mail/receive/${pv.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script>
		//전체선택
		$('#mailListForm #allCheckbox').on('click', function() {
			if ($('#allCheckbox').prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});
		
		function Checkform() {
		    if( ms.keyword.value == "" ) {
		      ms.keyword.focus();
		      alert("내용을 입력해주세요.");
		      
		      return false;
		    }
		}
		
		function readValue() {

			// 체크된 애들 번호를 전달하기

			//1. 체크박스 전부 가져오기
			//2. 1에서 가져온 요소의 숫자 가져오기
			//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
			let readArr = [];

			$('input:checkbox[name=RowCheck]').each(function(index) {
				if ($(this).is(":checked")) {
					console.log(this);
					read = $(this).val();
					readArr.push(read);

				}
			})

			if (readArr.length == 0) {
				alert("선택된 글이 없습니다.");
			}

			$.ajax({
				url : "${root}/mail/mailRead",
				method : "POST",
				traditional : true,
				data : {
					readArr : readArr
				},
				success : function(rdata) {
					if (rdata == 'ok') {
						alert("읽음 처리되었습니다");
						location.replace("${root}/mail/receive/${pno}");
					} else {
						alert("읽기 실패");
					}
				},
				error : function() {
					alert("읽기 실패(ERROR)");
				}
			})

		}
		
		function noreadValue() {

			// 체크된 애들 번호를 전달하기

			//1. 체크박스 전부 가져오기
			//2. 1에서 가져온 요소의 숫자 가져오기
			//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
			let noreadArr = [];

			$('input:checkbox[name=RowCheck]').each(function(index) {
				if ($(this).is(":checked")) {
					console.log(this);
					noread = $(this).val();
					noreadArr.push(noread);

				}
			})

			if (noreadArr.length == 0) {
				alert("선택된 글이 없습니다.");
			}

			$.ajax({
				url : "${root}/mail/mailNoread",
				method : "POST",
				traditional : true,
				data : {
					noreadArr : noreadArr
				},
				success : function(ndata) {
					if (ndata == 'ok') {
						alert("안읽음 처리되었습니다");
						location.replace("${root}/mail/receive/${pno}");
					} else {
						alert("안읽음 실패");
					}
				},
				error : function() {
					alert("안읽음 실패(ERROR)");
				}
			})

		}

		function deleteValue() {

			// 체크된 애들 번호를 전달하기

			//1. 체크박스 전부 가져오기
			//2. 1에서 가져온 요소의 숫자 가져오기
			//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
			let checkArr = [];

			$('input:checkbox[name=RowCheck]').each(function(index) {
				if ($(this).is(":checked")) {
					console.log(this);
					check = $(this).val();
					checkArr.push(check);

				}
			})

			if (checkArr.length == 0) {
				alert("선택된 글이 없습니다.");
			}

			$.ajax({
				url : "${root}/mail/mailDelete",
				//dataType : 'json',
				method : "POST",
				traditional : true,
				data : {
					checkArr : checkArr
				},
				success : function(cdata) {
					if (cdata == 'ok') {
						alert("삭제 성공");
						location.replace("${root}/mail/receive/${pno}");
					} else {
						alert("삭제 실패");
					}
				},
				error : function() {
					alert("삭제 실패(ERROR)");
				}
			})

		}
	</script>







</body>
</html>