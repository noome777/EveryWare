<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> 

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    
   
<style>

	#noticetitle{
  		width: 1000px; 
  		margin-left: 50px;
  	}
  	 .filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px;
    margin-left: 10px;
}

.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
</style>
</head>
<body>

	<div class="wrapper"  style="background-color: white">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
    	 <%@ include file="/WEB-INF/views/notice/sidemenu-content.jsp" %>
    	 <div class="main-content">
		 	<h2 id="noticewrite">공지사항 작성</h2>
		 		<br>
		 	<div class="buttonSet">
		 		<button type="button" id="sendBtn" class="btn btn-primary">확인</button>
		 	</div>
		 	
		 	<hr>
		 	<table>
		 		<tr class="recipient" >
		 			<th scope="row">
		 				<span class="raw_label">
		 					제목
		 				</span>
		 			</th>
		 			<td colspan="2">
		 				<div class="inputrecipe">
		 					 <div><input type="text" class="form-control" name="ntitle" id="noticetitle"></div>
		 				</div>
		 			</td>
		 			<td colspan="2">
		 				<div class="filebox">
							    <input class="upload-name" value="첨부파일" placeholder="첨부파일">
							    <label for="file">파일찾기</label> 
							    <input type="file" id="file">
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