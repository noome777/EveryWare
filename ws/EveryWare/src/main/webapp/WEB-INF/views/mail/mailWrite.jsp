<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include summernote css/js -->

  
<title>메일작성 </title>

 
<style>
  	#inputrec{
  		width: 1000px; 
  		margin-left: 50px;
  	}
  	#inputsend{
  		width: 1000px; 
  		margin-left: 50px;
  	}
  	#titleee{ 
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
	<div class="wrapper"  style="background-color: white">
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp" %>
		<main role="main" class="main-content">
		 	<h2 id="mailall">메일 쓰기</h2>
		 	<br>
		 	<div class="buttonSet">
		 		<button type="button" id="sendBtn" class="btn btn-primary">보내기</button>
		 		<button type="button" id="cancelBtn" class="btn btn-primary">취소</button>
		 	</div>
		 	
		 	<hr>
		 	
		 	<table>
		 		<tr class="recipient" >
		 			<th scope="row">
		 				<span class="raw_label">
		 					받는사람
		 				</span>
		 			</th>
		 			<td colspan="2">
		 				<div class="inputrecipe">
		 					 <div><input type="text" class="form-control" name="recip" id="inputrec"></div>
		 				</div>
		 			</td>
		 				<tr class="sender" >
		 			<th scope="row">
		 				<br>
		 				<span class="raw_label" id="sendname">
		 					보내는이름
		 				</span>
		 			</th>
		 			<td colspan="2">
		 				<div class="inputrecipe" style="padding-top:20px;">
		 					 <div><input type="text" class="form-control" name="recip" id="inputsend"></div>
		 				</div>
		 			</td>
		 				<tr class="title" >
		 			<th scope="row">
		 				<br>
		 				<span class="raw_label" id="title2">
		 					제목
		 				</span>
		 			</th>
		 			<td colspan="2">
		 				<div class="titlee" style="padding-top:20px;">
		 					 <div><input type="text" class="form-control" name="titl" id="titleee"></div>
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
		 	
		 	<%@ include file="/WEB-INF/views/mail/summernote.jsp" %>
			
				
		 	
	</main>
	</div>
	</div>
	
</body>
		
</html>