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
						<h6 class="mb-3">공유한 파일</h6>
						<div class="row my-4">
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
													class="fe fe-star fe-12 mr-4"></i>즐겨찾기</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-copy fe-12 mr-4"></i>복사</a><a
													class="dropdown-item" href="#"><i
													class="fe fe-edit-3 fe-12 mr-4"></i>수정</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-delete fe-12 mr-4"></i>삭제</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-share fe-12 mr-4"></i>공유</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-download fe-12 mr-4"></i>다운로드</a>
											</div>
										</div>
										<div class="circle circle-lg bg-secondary my-4">
											<span class="fe fe-folder fe-24 text-white"></span>
										</div>
									</div>
									<!-- .card-body -->
									<div class="card-footer bg-transparent border-0 fname">
										<strong><span class="dot dot-md bg-success mr-2"></span>Fusion
											Backpack</strong>
									</div>
									<!-- .card-footer -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col -->
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
													class="fe fe-star fe-12 mr-4"></i>즐겨찾기</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-copy fe-12 mr-4"></i>복사</a><a
													class="dropdown-item" href="#"><i
													class="fe fe-edit-3 fe-12 mr-4"></i>수정</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-delete fe-12 mr-4"></i>삭제</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-share fe-12 mr-4"></i>공유</a> <a
													class="dropdown-item" href="#"><i
													class="fe fe-download fe-12 mr-4"></i>다운로드</a>
											</div>
										</div>
										<div class="circle circle-lg bg-light my-4">
											<span class="fe fe-image fe-24 text-success"></span>
										</div>
										<div class="file-info">
											<span class="badge badge-light text-muted mr-2">288K</span> <span
												class="badge badge-pill badge-light text-muted">PNG</span>
										</div>
									</div>
									<!-- .card-body -->
									<div class="card-footer bg-transparent border-0 fname">
										<strong>공유한파일이름이에요</strong>
									</div>
									<!-- .card-footer -->
								</div>
								<!-- .card -->
							</div>
							<!-- .col -->
						</div>
						<!-- .row -->

						
										<!-- .file-panel -->
					<div class="info-panel">
						<div class="info-content p-3 border-left">
							<div class="d-flex align-items-center mb-3">
								<div class="flex-fill">
									<span class="circle circle-sm bg-white mr-2"> <span
										class="fe fe-file fe-12 text-success"></span>
									</span> <span class="h6 fileTitle"> 
									</span>
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
										<dd class="col-6 filewriter"></dd>
										<dt class="col-6 text-muted">타입</dt>
										<dd class="col-6 fileType" >Image</dd>
										<dt class="col-6 text-muted">파일크기</dt>
										<dd class="col-6">32M</dd>
										<dt class="col-6 text-muted">내용</dt>
										<dd class="col-6 fileContent"></dd>
										<dt class="col-6 text-muted">등록 날짜</dt>
										<dd class="col-6 fileEnroll"></dd>
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

<script type="text/javascript">
	
	$('.card').click(function (e) {
		
		const num = event.currentTarget.children[0].children[0].value;
		
		$.ajax({
			url : "${root}/filemanager/detail" ,
			type : "POST" ,
			data : {
				"num" : num
			},
			success: function (result) {
				$('.fileTitle').html(result.fileTitle);
				$('.filewriter').html(result.empCode);
				$('.fileContent').html(result.fileContent);
				$('.fileEnroll').html(result.fileEnrolldate);
			}
		});
	})
</script>

<script src="${root}/resources/js/apps.js"></script>
