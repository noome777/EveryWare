<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 정보</title>

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
    
    <link rel="stylesheet" href="${root}/resources/css/organization/info.css">
    
	<div class="wrapper">
	    <main role="main" class="main-content">
		    <div class="container-fluid">
		        <div class="row justify-content-center">
		        <div class="col-12">
		            <div class="row align-items-center my-3">
                		<div class="col">
                			<h2 class="h3 mb-0 page-title">임직원 정보</h2>
                		</div>
                		<div class="col-auto">
			                <button type="button" class="btn shadow" onclick="location.href='${root}/emp/myPage';">
								<span class="fe fe-user fe-12 mr-2"></span>
								내 정보보기
							</button>
			            </div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div id="search-wrap">
								<div class="shadow" id="search-container">
									<form action="${root}/organization/info" method="post" id="search-form" >
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
									
									<ul class="nav nav-pills">
										<li class="nav-item emp-info-bar non-click">
											<a class="nav-link" data-toggle="pill" href="#all">전체보기 (${empCnt})</a>
										</li>
										
										<c:forEach items="${deptMap['1']}" var="dl" >
												<li class="nav-item emp-info-bar non-click">
													<a class="nav-link" data-toggle="pill" href="#${dl.deptName}">${dl.deptName} (${dl.empCount})</a>
													
													<c:forEach items="${deptMap['2']}" var="dl2" >
														<c:if test="${dl2.highDeptCode eq dl.deptCode}">
																<li class="nav-item emp-info-bar non-click padding-left-10px">
																	<a class="nav-link" data-toggle="pill" href="#${dl2.deptName}">${dl2.deptName} (${dl2.empCount})</a>
																		<c:forEach items="${deptMap['3']}" var="dl3" >
																			<c:if test="${dl3.highDeptCode eq dl2.deptCode}">
																				<li class="nav-item emp-info-bar non-click padding-left-20px">
																					<a class="nav-link" data-toggle="pill" href="#${dl3.deptName}">${dl3.deptName} (${dl3.empCount})</a>
																						<c:forEach items="${deptMap['4']}" var="dl4" >
																							<c:if test="${dl4.highDeptCode eq dl3.deptCode}">
																								<li class="nav-item emp-info-bar non-click padding-left-30px">
																									<a class="nav-link" data-toggle="pill" href="#${dl4.deptName}">${dl4.deptName} (${dl4.empCount})</a>
																										<c:forEach items="${deptMap['5']}" var="dl5" >
																											<c:if test="${dl5.highDeptCode eq dl4.deptCode}">
																												<li class="nav-item emp-info-bar non-click padding-left-40px">
																													<a class="nav-link" data-toggle="pill" href="#${dl5.deptName}">${dl5.deptName} (${dl5.empCount})</a>
																																
																														<c:forEach items="${deptMap['6']}" var="dl6" >
																															<c:if test="${dl6.highDeptCode eq dl5.deptCode}">
																																<li class="nav-item emp-info-bar non-click padding-left-50px">
																																	<a class="nav-link" data-toggle="pill" href="#${dl6.deptName}">${dl6.deptName} (${dl6.empCount})</a>
																																		<c:forEach items="${deptMap['7']}" var="dl7" >
																																			<c:if test="${dl7.highDeptCode eq dl6.deptCode}">
																																				<li class="nav-item emp-info-bar non-click padding-left-60px">
																																					<a class="nav-link" data-toggle="pill" href="#${dl7.deptName}">${dl7.deptName} (${dl7.empCount})</a>
																																						<c:forEach items="${deptMap['8']}" var="dl8" >
																																							<c:if test="${dl8.highDeptCode eq dl7.deptCode}">
																																								<li class="nav-item emp-info-bar non-click padding-left-70px">
																																									<a class="nav-link" data-toggle="pill" href="#${dl8.deptName}">${dl8.deptName} (${dl8.empCount})</a>
																																									<c:forEach items="${deptMap['9']}" var="dl9" >
																																										<c:if test="${dl9.highDeptCode eq dl8.deptCode}">
																																											<li class="nav-item emp-info-bar non-click padding-left-80px">
																																												<a class="nav-link" data-toggle="pill" href="#${dl9.deptName}">${dl9.deptName} (${dl9.empCount})</a>
																																												<c:forEach items="${deptMap['10']}" var="dl10" >
																																													<c:if test="${dl10.highDeptCode eq dl9.deptCode}">
																																														<li class="nav-item emp-info-bar non-click padding-left-90px">
																																															<a class="nav-link" data-toggle="pill" href="#${dl10.deptName}">${dl10.deptName} (${dl10.empCount})</a>
																																															<c:forEach items="${deptMap['11']}" var="dl11" >
																																																<c:if test="${dl11.highDeptCode eq dl10.deptCode}">
																																																	<li class="nav-item emp-info-bar non-click padding-left-100px">
																																																		<a class="nav-link" data-toggle="pill" href="#${dl11.deptName}">${dl11.deptName} (${dl11.empCount})</a>
																																																	</li>
																																																</c:if>
																																															</c:forEach>
																																														</li>
																																													</c:if>
																																												</c:forEach>
																																											</li>
																																										</c:if>
																																									</c:forEach>
																																								</li>
																																							</c:if>
																																						</c:forEach>
																																				</li>
																																			</c:if>
																																		</c:forEach>
																																</li>
																															</c:if>
																														</c:forEach>
																												</li>
																											</c:if>
																										</c:forEach>
																								</li>
																							</c:if>
																						</c:forEach>
																				</li>
																		</c:if>
																	</c:forEach>
																</li>
														</c:if>
													</c:forEach>
													
												</li>
										</c:forEach>
										
									</ul>
								</div>
							</div>
						</div>

						<div id="profile-wrap" class="shadow tab-content">

							<!--프로필 11 -->
							<div class="tab-pane container active flex-wrap" id="all" >
								<div id="profile-title">
									<h4>전체보기 <small>(${empCnt})</small></h4>
								</div>
								<div id="profile-area" class="or-scroll-bar">
									<c:forEach items="${empList}" var="el">
										<div class="profile shadow">
											<div class="profile-image avatar avatar-lg">
												<a href="#emp-profile-${el.empCode}" data-toggle="modal">
													<img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
												</a>
											</div>
											<div class="profile-text card-text">
												<strong class=" card-title my-0">${el.empName}</strong>
												<p class=" small my-0">${el.deptName}</p>
												<p class="small my-0">${el.rankName}</p>
												<p class="small my-0">${el.empTel}</p>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						<c:forEach items="${deptList}" var="dl">
							<div class="tab-pane container fade flex-wrap" id="${dl.deptName}" >
								<div id="profile-title">
									<h4>${dl.deptName} <small>(${dl.empCount})</small></h4>
									<c:if test="${dl.deptDepth ne 1}">
										<small class="text-muted">${dl.path}</small>
									</c:if>

								</div>
								<div id="profile-area" class="or-scroll-bar">
									
									<c:forEach items="${empList}" var="el">
										<c:if test="${dl.deptName eq el.deptName }">
											<div class="profile shadow">
												<div class="profile-image avatar avatar-lg">
													<a href="#emp-profile-${el.empCode}" data-toggle="modal">
														<img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
													</a>
												</div>
												<div class="profile-text card-text">
													<strong class=" card-title my-0">${el.empName}</strong>
													<p class=" small my-0">${el.deptName}</p>
													<p class="small my-0">${el.rankName}</p>
													<p class="small my-0">${el.empTel}</p>
												</div>
											</div>
										</c:if>	
									</c:forEach>
								</div>
							</div>
					</c:forEach>
							
								
								
							

							
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
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>사내전화</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-tel-area">${empList.empTel}</p>
                    </div>
                  </div>
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

		<script>
		
			const searchBar = $("#search-bar");
			
			function checkBlank() {

				const searchNum = searchBar.val().search(/[0-9]/g);
				const searchEng = searchBar.val().search(/[a-z]/ig);
				const searchSpe = searchBar.val().search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

				if(searchBar.val().trim() === "") {
					alert("검색창에 글자를 입력하여 주시길 바랍니다.");
					return false;
				} else if(searchNum != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				} else if(searchEng != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				} else if(searchSpe != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				} else {
					return true;
				}
			}

		</script>



		<div></div>
		
	  

</body>
</html>