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
						<h4 class="mb-0">파일 등록</h4>
						<br>
					</div>
					<div class="card-body">
						<form class="needs-validation" novalidate="">
							<div class="form-row">
								<div class="col-md-4 mb-3">
									<label for="validationCustom3">제목</label> <input type="text"
										class="form-control" id="validationCustom3" value="" required>
								</div>
								<div class="col-md-4 mb-3">
									<label for="validationCustom4">내용</label> <input type="text"
										class="form-control" id="validationCustom4" value="" required>
								</div>
							</div>
				<div class="form-group mb-3">
                          <label for="customFile">Custom file input</label>
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="customFile">
                            <label class="custom-file-label" for="customFile">Choose file</label>
                          </div>
                        </div>
							<button class="btn btn-outline-primary" type="submit"
								id="submit-btn">파일 등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- main -->


<script src="${root}/resources/js/apps.js"></script>
