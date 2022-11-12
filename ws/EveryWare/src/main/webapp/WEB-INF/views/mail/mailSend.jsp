<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 메일함</title>
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
	
	
}

#title {
	text-align: center;
}

#senddate {
	text-align: center;
}

#msender {
	margin-right:10px;
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
	<h2 id="mailSen">보낸 메일함</h2>
	<br>
	<form action="${root}/mail/mailSearchsend/${pno}" method="get" name="mailSend" onsubmit="return Checkform">
			<div class="form-group row " style="margin-left: 3px;">
				<div class="w100" style="padding-right: 10px">
					<select class="form-control form-control-sm" name="searchType" id="searchType"
						>
						<option value="title">제목</option>
						<option value="rec_id">받는 사람</option>
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
					<input type="button" value="삭제" id="deleteBtn"
						onclick="deleteValue();" class="btn btn-danger"/>
				</div>
				<div class="card shadow">
					<div class="card-body" id="mailListForm">
						<table class="table table-striped" id="maillist">

							<tr>
								<th><input type="checkbox" name="allCheckbox"
									id="allCheckbox"></th>
								<th id="sender" >받는사람</th>
								<th id="title">제목</th>
								<th id="senddate">작성일</th>
							</tr>
							<tbody>
								<c:forEach items="${sendList}" var="s">
										
										<c:set var = "mailSend" value="${s.mailSender}"/>
										<c:set var = "mailReci" value="${s.mailReceiver}"/>
										<tr onclick="location.href='${root}/mail/mailDetail/${s.mailCode}'">
											<td><input type="checkbox" name="RowCheck"
												class="RowCheck" value="${s.mailCode}" onclick="event.stopPropagation()"></td>
											<td id="msender"onclick="event.stopPropagation()">${fn:split(mailReci,'@')[0]}</td>
											<td id="mtitle">${s.mailTitle}</td>
											<td id="mSenddate" onclick="event.stopPropagation()">${s.mailSenddate}</td>
											
										</tr>
								</c:forEach>
							</tbody>
						</table>



						<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<c:if test="${pv.startPage ne 1}">
								<li class="page-item"><a class="page-link" href="/app00/mail/send/${pv.startPage - 1}">Previous</a></li>
							</c:if>

							<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
								<li class="page-item"><a class="page-link"
									href="/app00/mail/send/${i}">${i}</a></li>
							</c:forEach>

							<c:if test="${pv.endPage ne pv.maxPage}">
								<li class="page-item"><a class="page-link" href="/app00/mail/send/${pv.endPage + 1}">Next</a></li>
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
		    if( mailSend.keyword.value == "" ) {
		    	mailSend.keyword.focus();
		      alert("내용을 입력해주세요.");
		      
		      return false;
		    }
		}
		
		
		function deleteValue() {
			
			
			// 체크된 애들 번호를 전달하기
			
			//1. 체크박스 전부 가져오기
			//2. 1에서 가져온 요소의 숫자 가져오기
			//3. 2 에서 가져온 숫자들을 배열 형태로 만들기
			let checkArr = [];
			
			$('input:checkbox[name=RowCheck]').each(function (index) {
				if($(this).is(":checked")){
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
 					data : {checkArr : checkArr},
 					success : function(cdata) {
 						if (cdata == 'ok') {
 							alert("삭제 성공");
 							location.replace("${root}/mail/send/${pno}");
 						} else {
 							alert("삭제 실패");
 						}
					},
					error : function(){
						alert("삭제 실패(ERROR)");
					}
				})
		   
		}
 	</script>
		
			
 					
			
			

 					
</body>
</html>