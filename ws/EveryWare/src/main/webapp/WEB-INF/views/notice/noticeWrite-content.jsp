<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>without bootstrap</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
#noticetitle {
	width: 1000px;
	margin-left: 50px;
}

.mb-3 {
	padding-top: 20px;
	margin-left: 50px;
}
</style>
</head>
<body>

	<main role="main" class="main-content">
		<h2 id="noticewrite">공지사항 작성</h2>
		<br>
		<form action="" method="post">
			<div class="buttonSet">
				<button type="submit" id="sendBtn" class="btn btn-primary"
					onclick="summit()">완료</button>
			</div>

			<hr>
			<table>
				<tr class="recipient">
					<th scope="row"><span class="raw_label"> 제목 </span></th>
					<td colspan="2">
						<div class="inputrecipe">
							<div>
								<input type="text" class="form-control" name="noticeTitle"
									id="noticetitle">
							</div>
						</div>
					</td>
				<tr class="file">
					<th scope="row"><br> <span class="raw_label" id="file">
							파일첨부 </span></th>

					<td colspan="2">
						<div class="mb-3">
							<label for="formFileMultiple" class="form-label"></label> <input
								class="form-control" type="file" id="formFileMultiple" multiple>
						</div>
					</td>
					<tr class="content">

					<td colspan="2">
						<textarea id="summernote" name="noticeContent"></textarea>
					</td>
				</tr>
			</table>
			
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
      
      //function summit() {

//          const button = event.srcElement;
  //        button.disabled = true;

//          const title = document.getElementById('noticeTitle').value;
  //        const content = $('#summernote').summernote('code');

//          const formData = new FormData;
 //         formData.append("noticeTitle", noticeTitle);
  //        formData.append("content", content);
   //       console.log(content);

//          const httpRequest = new XMLHttpRequest();
 //         httpRequest.onreadystatechange = () => {
//              if (httpRequest.readyState === XMLHttpRequest.DONE) {
 //                 if (httpRequest.status === 200) {
  //                    console.log(httpRequest.response);
  //                    location.href = "/noticeMain.jsp";
  //                } else {
 //                     alert("게시물 등록중 오류가 발생했습니다.");
 //                     button.disabled = false;
  //                }
   //           }
    //      }
    //      httpRequest.open('post', '/', true);
   //       httpRequest.send(formData);

//      }
    </script>
			
		</form>
	</main>

</body>
</html>
