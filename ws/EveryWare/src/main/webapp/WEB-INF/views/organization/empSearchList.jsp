<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 검색</title>
<style>
	.modal-profile-wrap {
		margin: 25px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}
	  
	.modal-profile-texts-wrap {
	  	margin-top: 20px;
		display: flex;
		flex-wrap: wrap;
		flex-direction: column;
		width: 85%;
	}
	  
	.flex-items {
		height: 38px;
		display: grid;
		grid-template-columns: 1fr 2fr;
		align-items: center;
		justify-items: center;
	}
</style>
</head>
<body class="vertical  light">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    <link rel="stylesheet" href="${root}/resources/css/organization/searchEmp.css">
    

	<div class="wrapper">
	    <main role="main" class="main-content">
		    <div class="container-fluid">
		        <div class="row justify-content-center">
		        <div class="col-12">
		            <div class="row align-items-center my-3">
                		<div class="col">
                			<h3 class="h4 mb-0 page-title padding-left-20px">검색결과</h3>
                		</div>
                		<div class="col-auto">
			                <button type="button" class="btn shadow">
								<span class="fe fe-user fe-12 mr-2" onclick="location.href='${root}/emp/myPage';"></span>
								내 정보보기
						</button>
			            </div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div id="search-wrap">
								<div class="shadow" id="search-container">
									<form action="${root}/organization/info" method="post">
										<div id="search-bar-wrap">
											<input type="text" id="search-bar" class="style-none" placeholder="임직원 검색" name="word"> 
										</div>
										<div id="search-icon-wrap">
											<input type="image" name="submit" id="search-icon" src="${root}/resources/img/search.png" onclick=" return checkBlank();">
										</div>
									</form>
								</div>
							</div>
							<div id="list-wrap">

								
								<div id="list-bar" class="shadow or-scroll-bar">
									
									
								</div>
							</div>
						</div>

						<div id="profile-wrap" class="shadow tab-content">

							<!--프로필 11 -->
							<div class="tab-pane container active flex-wrap" id="result" >
								<div id="profile-title"><h4>검색결과</h4></div>
								<div id="profile-area" class="or-scroll-bar">
								<c:forEach items="${empList}" var="el">
									<div class="profile shadow">
										<div class="profile-image avatar avatar-lg">
											<a href="#emp-profile-${el.empCode}" data-toggle="modal">
												<img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
											</a>
										</div>
										<div class="profile-text card-text">
											<strong class="card-title my-0">${el.empName}</strong>
											<p class="small my-0">${el.deptName}</p>
											<p class="small my-0">${el.rankName}</p>
											<p class="small my-0">${el.empTel}</p>
										</div>
									</div>
									</c:forEach>
								</div>
							</div>
						
							
							
							<!-- Nav tabs -->
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
</div>
	<c:forEach items="${empList}" var="empList">
	
      <div class="modal fade" id="emp-profile-${empList.empCode}" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body modal-profile-wrap"> 
                <div class="profile-img-wrap">
                  <div class="avatar avatar-xl">
                    <img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle preview-img" id="preview-img">
				  </div>
                </div>
                <div class="modal-profile-texts-wrap">
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>이름</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.empName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>직위</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-rank-area">${empList.rankName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>소속</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-dept-area">${empList.deptName}</p>
                    </div>
                  </div>
				  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>직무</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-job-area">${empList.jobName}</p>
                    </div>
                  </div>
                  <!--<div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>생년월일</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-birthday-area">${empList.empBirthday}</p>
                    </div>
                  </div>-->
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>사내전화</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-tel-area">${empList.empTel}</p>
                    </div>
                  </div>
                  <!--<div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>휴대전화</strong></p>
                    </div>
                    <div>
                      <p class="mb-0"  class="modal-phone-area">${empList.empPhone}</p>
                    </div>
                  </div>-->
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>e-mail</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-email-area">${empList.empEMail}</p>
                    </div>
                  </div>
      
                </div>
              </div>
            </div>
          </div>
        </div>
      
    </c:forEach>

	<c:if test="${empty empList}">
		<script>
			$(document).ready(function() {
				alert("검색된 임직원이 없습니다. 검색어를 확인 후 다시 시도해주세요.");
			});
		</script>
	</c:if>

	<script>
		const searchBar = $("#search-bar");

		function checkBlank() {

			if(searchBar.val().trim() === "") {
				window.location.href="${root}/organization/info";
				return false;
			} else {
				return true;
			}
		}

	</script>
		
	  

</body>
</html>