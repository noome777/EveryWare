<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
    .center{
        align-items: center;
        justify-content: center;
        text-align: center;
    }
    .appr-table-color{
        background-color: rgb(244, 249, 255);
    }
    #form-manager-table{
        margin: 0 auto;
        margin-top: 30px;
        width: 80%;
        
    }
    #detail-title{
        margin: 100px 0 50px 0;
    }
    .appr-font-color{
        color: rgb(119, 118, 118);
    }
    #detail-box{
        margin: 0 auto;
        margin-top: 80px;
        width: 80%;
    }
    .text-center{
        margin-top: 20px;
    }
    #form-detail > label{
        font-size: 0.9rem;
        margin-bottom: 15px;
    }
    #form-detail > div{
        margin: 15px;
    }
    #form-intro{
        margin: 50px 0;
    }
		#form-select-box{
			height: 500px;
		}
		.w-80{
			width: 80%
		}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>

	<main role="main" class="main-content">
			
			<div class="card shadow w-75 m-auto">
					<div class="card-body">
							<h4 class="center appr-font-color">양식 생성</h4>
							<table class="table table-bordered mb-0 shadow" id="form-manager-table">
									<tr>
										<td class="appr-table-color">양식명</td>
										<td>
											<div class="form-group mb-3">
												<input type="text" id="simpleinput" class="form-control">
											</div>
										</td>
									</tr>
									<tr>
											<td class="appr-table-color">상태</td>
											<td>
													<select class="custom-select form-control" id="formSelect">
															<option selected>선택</option>
															<option>사용</option>
															<option>미사용</option>
													</select>
											</td>
									</tr>
							</table>

							<div id="detail-box">
								<div id="form-intro">
										<label for="example-textarea"><h5 class="appr-font-color">양식 설명</h5></label>
										<div class="form-group mb-3">
												<textarea class="form-control" id="example-textarea" rows="4"></textarea>
										</div>
								</div>
								
								<div id="form-select-box" class="d-flex w-100 m-auto">
		
									<div id="name-list" class="w-50 h-100">
										<select multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll">
											<option value="">내용</option>
											<option value="">적요</option>
										</select>
									</div>
		
									<div class="w-25 h-150 d-flex flex-column justify-content-center align-items-center">
										<a id="" class="fe fe-32 fe-arrow-right-circle w-25 mb-1"></a>
										<a class="fe fe-32 fe-arrow-left-circle w-25"></a>
									</div>
									
		
									<div id="name-list" class="w-50 h-100">
										<select multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll">
											<option value="">ㅇㅇ</option>
											<option value="">ㅇㅇ</option>
										</select>
									</div>
		
								</div>
							</div>
					</div>
				</div>
				<div class="text-center">
					<button type="button" class="btn mb-2 btn-secondary ">미리보기</button>
					<button type="button" class="btn mb-2 btn-secondary ">생성하기</button>
				</div>
			
	</main>

</body>
</html>