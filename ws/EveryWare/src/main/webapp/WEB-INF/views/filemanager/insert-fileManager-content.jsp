<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



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
						<h4 class="mb-0">파일 등록</h4>
						<br>
					</div>
					<div class="card-body">
						<form class="needs-validation" method="post" action="${root}/filemanager/addfile" enctype="multipart/form-data">
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationCustom3">제목</label> <input type="text"
										class="form-control" name="fileTitle" placeholder="제목을 입력해주세요." required>
								</div>
								<div class="col-md-4 mb-3">
									<label for="validationCustom4">내용</label> <input type="text"
										class="form-control" name="fileContent" id="validationCustom4" placeholder="내용을 입력해주세요."  required>
								</div>
							</div>
							<div class="form-group mb-3">
								<br> 
								<label>파일 찾아보기</label>
								<div class="custom-file">
									<label class="custom-file-label" for="fileName"></label>
									<input type="file" class="custom-file-input" id="fileName" name="fileOriginname"> 
								</div>
							</div>
							<input type= "submit" value="파일등록" class="btn btn-outline-primary">
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- main -->

<script src="${root}/resources/js/apps.js"></script>
