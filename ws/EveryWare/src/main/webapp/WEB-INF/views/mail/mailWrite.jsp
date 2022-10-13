<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일홈 </title>

  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
	  
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
  	
  	.fileplus{
  		padding-top: 20px;
  		margin-left: 50px;
  	}
</style>
</head>
<body>
	<div class="wrapper"  style="background-color: white">
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp" %>
		 <div class="main-content">
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
		 				<div class="fileplus" >
		 					<button type="button" id="sendBtn" class="btn btn-primary">내 pc</button>
		 				</div>
		 			</td>
		 		</tr>
		 			
		 	</table>
				<div class="container">
  <textarea class="summernote" name="editordata"></textarea>    
			</div>
			<script>
			$('.summernote').summernote({
				  height: 150,
				  lang: "ko-KR"
				});
			</script>
				
		 	
	</div>
	</div>
	
</body>
		
</html>