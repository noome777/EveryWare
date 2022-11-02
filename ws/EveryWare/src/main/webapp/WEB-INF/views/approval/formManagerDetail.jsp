<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
    .center{
        text-align: center;
        align-items: center;
        justify-content: center;
    }
    .appr-table-color{
        background-color: rgb(244, 249, 255);
    }
    .appr-tab{
        margin: 0 auto;
        margin-top: 30px;
        width: 80%;
        
    }
    #detail-title{
        margin: 100px 0 20px 0;
    }
    .appr-font-color{
        color: rgb(119, 118, 118);
    }
    #detail-box{
        margin-left: 20px;
    }
    #detail-box > div{
        margin-bottom: 5px;
    }
    .card{
        margin: 0 auto;
        width: 60vw;
    }
		#content-box{
			width: 70%;
			margin: 0 auto;
		}
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>

	<main role="main" class="main-content">
		
		<div class="card shadow mb-4">
			<div class="card-body">
				<div>
					<h3 class="center">양식 상세</h3>
					<table class="table table-bordered mb-0 shadow appr-tab w-75" id="form-manager-table">
						<tr>
							<td class="appr-table-color">양식 번호</td>
							<td class="appr-table-color">양식명</td>
							<td class="appr-table-color">사용여부</td>
						</tr>
						<tr>
							<td>${docForm.formCode}</td>
							<td>${docForm.formName}</td>
							<td>${docForm.formUseYn}</td>
						</tr>
					</table>
					
					<div id="content-box">
						<h5 id="detail-title" class="appr-font-color">양식 설명</h5> 
						<hr>
						<div id="detail-box">
							${docForm.formIntro}
						</div>

						<h5 id="detail-title" class="appr-font-color">양식 항목</h5>
						<hr>
						<table class="table table-bordered shadow appr-tab">
							<tr>
								<td class="appr-table-color w-50">표시 순서</td>
								<td class="appr-table-color w-50">항목명</td>
							</tr>
							<c:forEach items="${formMappingList}" var="f">
								<tr>
									<td>${f.formDetailSeq}</td>
									<td>${f.formDetailName}</td>
								</tr>
							</c:forEach>
						</table>   
					</div>
				</div>
			</div>
		</div>
		<div class="text-center">
			<a href="${root}/approval/formEdit/${docForm.formCode}"><button class="btn mb-2 btn-secondary text-center">수정하기</button></a>
		</div>
	</main>

</body>
</html>