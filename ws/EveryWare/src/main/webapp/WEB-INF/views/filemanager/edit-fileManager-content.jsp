<%@page import="com.kh.app00.filemanager.vo.FilemanagerVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% FilemanagerVo vo =  (FilemanagerVo)request.getAttribute("vo");%>


<main role="main" class="main-content">
	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-md-12">
				<div class="row align-items-center my-3">
					<div class="col">
						<h2 class="page-title"></h2>
					</div>
				</div>

				<!-- 연차 신청 -->
				<div class="card shadow mb-5">
					<div class="card-header">
						<br>
						<h4 class="mb-0">파일 수정</h4>
						<br>
					</div>
					<div class="card-body">
						<form class="needs-validation" method="post" action="${root}/filemanager/edit/<%=vo.getFileCode()%>" >
							<div class="mb-3">
								<label for="validationCustom3">제목</label> <input type="text"
									class="form-control" name="fileTitle" value="<%= vo.getFileTitle() %>" required>
							</div>
							
							<div class="mb-3">
								<label for="validationCustom4">내용</label> <input type="text"
									class="form-control" name="fileContent" id="validationCustom4" value="<%= vo.getFileContent() %>"  required>
							</div>
							<input type= "submit" value="파일수정" class="btn btn-outline-primary">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- main -->

<script src="${root}/resources/js/apps.js"></script>
