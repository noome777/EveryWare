<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>without bootstrap</title>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
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
		 					보내는 사람
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
		 					받는 사람
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
    <div id="summernote"></div>
    <script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 250,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
      });
    </script>
    	</main>
  </body>
</html>
