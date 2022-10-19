<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#noticetitle {
	width: 1000px;
	margin-left: 50px;
}


.mb-3{
  		padding-top: 20px;
  		margin-left: 50px;
  	}
</style>
</head>
<body>

	<div class="wrapper" style="background-color: white">
		<%@ include file="/WEB-INF/views/common/header.jsp"%>
		<%@ include file="/WEB-INF/views/notice/sidemenu-content.jsp"%>
		<div class="main-content">
			<h2 id="noticewrite">공지사항 작성</h2>
			<br>
			<div class="buttonSet">
				<button type="button" id="sendBtn" class="btn btn-primary">확인</button>
			</div>

			<hr>
			<table>
				<tr class="recipient">
					<th scope="row"><span class="raw_label"> 제목 </span></th>
					<td colspan="2">
						<div class="inputrecipe">
							<div>
								<input type="text" class="form-control" name="ntitle"
									id="noticetitle">
							</div>
						</div>
					</td>
					<tr class="file" >
		 			<th scope="row">
		 				<br>
		 				<span class="raw_label" id="file">
		 					파일첨부 
		 				</span>
		 			</th>
		 			
		 			<td colspan="2">
		 				<div class="mb-3">
							  <label for="formFileMultiple" class="form-label"></label>
							  <input class="form-control" type="file" id="formFileMultiple" multiple>
							</div>
		 			</td>
		 		</tr>
			</table>
			
			<%@ include file="/WEB-INF/views/notice/summernote.jsp" %>
		</div>
	</div>
</body>
</html>