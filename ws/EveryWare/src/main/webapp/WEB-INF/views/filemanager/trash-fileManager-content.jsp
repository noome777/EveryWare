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

				<div class="file-container border-top">
					<div class="file-panel mt-4">
						<h6 class="mb-3">최근 삭제된 파일</h6>
						<div class="row my-4">
						
						<c:forEach items="${flist}" var="f">

								<div class="col-md-3">
									<div class="card shadow text-center mb-4">
										<div class="card-body file">
											<div class="file-action">
												<button type="button"
													class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto"
													data-toggle="dropdown" aria-haspopup="true"
													aria-expanded="false">
													<span class="text-muted sr-only">Action</span>
												</button>
												<div class="dropdown-menu m-2">
													<a class="dropdown-item" href="#"><i
														class="fe fe-refresh-cw fe-12 mr-4"></i>복원</a> 
												</div>
											</div>
											<div class="circle circle-lg bg-light my-4">
												<span class="fe fe-file fe-24 text-secondary"></span>
											</div>
											<div class="file-info">
												<span class="badge badge-light text-muted mr-2">14.8M</span>
												<span class="badge badge-pill badge-light text-muted"></span>
											</div>
										</div>
										<!-- .card-body -->
										<div class="card-footer bg-transparent border-0 fname">
											<strong>${f.fileTitle}</strong>
										</div>
										<!-- .card-footer -->
									</div>
									<!-- .card -->
								</div>
							</c:forEach>
						
						</div>
						<!-- .row -->

						
					</div>
					<!-- .file-panel -->
					<div class="info-panel">
						<div class="info-content p-3 border-left">
							<div class="d-flex align-items-center mb-3">
								<div class="flex-fill">
									<span class="circle circle-sm bg-white mr-2"> <span
										class="fe fe-image fe-12 text-success"></span>
									</span> <span class="h6">파일이름.확장자명</span>
								</div>
								<span class="btn close-info"> <i class="fe fe-x"></i>
								</span>
							</div>
							<ul class="nav nav-tabs nav-fill mb-3" id="file-detail"
								role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="tab-detail" data-toggle="tab" href="#detail" role="tab"
									aria-controls="detail" aria-selected="true">파일 정보</a></li>
							</ul>
							<div class="tab-content" id="file-tabs">
								<div class="tab-pane fade show active" id="detail"
									role="tabpanel" aria-labelledby="tab-detail">
									<img src="${root}/resources/assets/products/p4.jpg" alt="..."
										class="img-fluid rounded">
									<dl class="row my-4 small">
										<dt class="col-6 text-muted">작성자</dt>
										<dd class="col-6">Whilemina Pate</dd>
										<dt class="col-6 text-muted">타입</dt>
										<dd class="col-6">Image</dd>
										<dt class="col-6 text-muted">파일크기</dt>
										<dd class="col-6">32M</dd>
										<dt class="col-6 text-muted">내용</dt>
										<dd class="col-6">파일 설명ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</dd>
										<dt class="col-6 text-muted">등록 날짜</dt>
										<dd class="col-6">Aug 20, 2020</dd>
									</dl>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<!-- main -->


<script src="${root}/resources/js/apps.js"></script>
