<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">

		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp"%>
		<div class="main-content">

			<h2 id="mailall">전체 메일함</h2>
			<br>
				<div class="form-group row justify-content-center" style="margin-right:700px;">
			<div class="w100" style="padding-right:10px">
				<select class="form-control form-control-sm" name="searchType" id="searchType">
					<option value="title">제목</option>
					<option value="reg_id">발신자</option>
				</select>
			</div>

			<div class="w300" style="padding-right:10px">
				<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">

			</div>

			<div>
				<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
			</div>

		</div>

				<br>
				<div class="buttonSet">
					<input type="button" value="삭제" id="deleteBtn"
						onclick="deleteValue();" class="btn btn-primary"/>
					<button type="button" id="leadBtn" class="btn btn-primary">읽음</button>
					<button type="button" id="noleadBtn" class="btn btn-primary">안읽음</button>
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
								<c:forEach items="${mList}" var="m">
									<c:if test="${m.mailDelete eq null}">
										<tr>
											<td><input type="checkbox" name="RowCheck"
												class="RowCheck" value="${m.mailCode}"></td>
											<td id="msender">${m.mailSender}</td>
											<td id="mtitle">${m.mailTitle}</td>
											<td id="mSenddate">${m.mailSenddate}</td>
										</tr>
									</c:if>
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

		/* $(function() {
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;

			$("input[name='allCheckbox']").click(function() {
				var chk_listArr = $("input[name='RowCheck']");
				for (var i = 0; i < chk_listArr.length; i++) {
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function() {
				if ($("input[name='RowCheck']:checked").length == rowCnt) {
					$("input[name='allCheckbox']")[0].checked = true;
				} else {
					$("input[name='allCheckbox']")[0].checked = false;
				}
			});
		}); */
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
 			} else {
 				var chk = confirm("정말 삭제하시겠습니까?");
 			}
			
			alert('zzz');
			$.ajax({
 					url : "${root}/mail/mailDelete",
 					//dataType : 'json',
 					method : "POST",
 					traditional : true,
 					data : {checkArr : checkArr},
 					success : function(cdata) {
 						if (cdata == 'ok') {
 							alert("삭제 성공");
 							location.replace("${root}/mail/mailMain");
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
		
			
 					
			
			
<%-- 			//4. 3에서 만든 배열을 서버측으로 보내기
			//5. 서버측에서 데이터 받은거 확인해보기 //컨트롤러에서 출력 
			
// 			var url = "${root}/mail/mailDelete/${mvo.mailCode}";
// 			var valueArr = new Array();
// 			var list = $("input[name='RowCheck']");
// 			for (var i = 0; i < list.length; i++) {
// 				if (list[i].checked) {
// 					valueArr.push(list[i].value);
// 				}
// 			}
// 			if (valueArr.length == 0) {
// 				debugger;
// 				alert("선택된 글이 없습니다.");
// 			} else {
// 				var chk = confirm("정말 삭제하시겠습니까?");
// 				$.ajax({
// 					url : "${root}/mail/mailDelete/${mvo.mailCode}",
// 					method : "POST",
// 					traditional : true,
// 					data : {
// 						valueArr : valueArr
// 					},
// 					success : function(jdata) {
// 						if (jdata = 1) {
// 		 					alert("삭제 성공");
// 							location.replace("${root}/mail/mailMain/1")
// 						} else {
// 							alert("삭제 실패");
// 						}
// 					}

// 				});
// 			}
//		} --%>
 					
</body>
</html>