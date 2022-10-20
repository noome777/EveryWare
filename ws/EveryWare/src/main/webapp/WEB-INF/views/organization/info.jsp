<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 정보</title>

<style>

	/*
	.col-auto > button {
		border: 1px solid lightgray;
	} 
	*/

	.grid-wrap {
		height : 85vh;
		display:grid;
		grid-template-columns: 22% 78%;
		grid-template-rows: 100%;
		justify-content: center;
		align-content: center;
		gap : 30px;
	}
	.grid-wrap > div {
		border-radius: 5px;
		/* border : 1px solid lightgrey; */
		background-color: white;
	}

	#info-nav {
		display: grid;
		width: 100%;
		height: 100%;
		grid-auto-rows: 13% 87%;
	}


	#list-wrap, #search-wrap {

		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;

	}

	#search-container {
		width: 85%;
		height: 55%;
		border-radius: 5px;
		/* border : 1px solid lightgray;*/
		display: flex;
	}

	#search-container > form {
		width: 100%;
		height: 100%;
		display: grid;
		grid-template-columns: 4fr 1fr;
	}

	#search-icon-wrap {
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
	}

	#search-bar-wrap {
		width: 100%;
		height: 100%;
	}

	#search-bar {
		width: 100%;
		height: 100%;
		padding: 10px;
	}

	

	#list-bar {
		width: 85%;
		height: 93%;
		border-radius: 5px;
		/*border: 1px solid lightgray;*/
	}

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}

	input:focus{
		outline: none;
	}
	
	.emp-info-bar {
		width : 100%;
		height : 7%;
		/*border-bottom : 1px solid lightgray;*/
		display: flex;
		flex-direction: column;
	}
	

	button:hover {
		border: 1px solid rgb(27, 104, 255);
	}

	.non-click:hover {
		cursor: pointer;
		background-color: rgb(235, 236, 237)
	}

	.non-click {
		background-color: white;
	}

	.click {
		background-color: lightgray;
	}

	#profile-wrap {
		display: flex;
		flex-direction: column;
	}

	#profile-area {
		width: 100%;
		height: 92%;
		display: grid;
		grid-template-columns: repeat(4, 1fr);
		gap: 40px;
		padding: 38px;
	}

	#profile-area>div {
		height: 220px;
	}

	#profile-area > div {
		/*border: 1px solid lightgray;*/
	}

	#profile-title {
		width: 100%;
		height: 8%;
		padding: 30px;
	}

	.or-scroll-bar {
		overflow: auto;
	}

	.grid-h4 {
		grid-column: 3;
	}

	.profile {
		display: flex;
		flex-direction: column;
		border-radius: 5px;
	}

	.profile>div {
		width: 100%;
		height: 50%;
	}

	.profile-image {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.profile-text {
		text-align: center;
		padding: 5px;
	}

	.flex-wrap {
		display: flex;
		flex-direction: column;
		width: 100%;
		height: 100%;
	}

	.nav-link {
		width: 100%;
		height: 100%;
	}

	.nav-pills> li > a .nav-pills .nav-pills>li{
		-webkit-border-radius: 0;
		-moz-border-radius: 0;
		border-radius: 0;
	}

	.padding-left-10px {
		padding-left: 10px;
	}	
	
	.padding-left-20px {
		padding-left: 20px;
	}

	#search-icon {
		width: 34px;
		height: 34px;
	}

	#search-icon:hover {
		cursor: pointer;
	}
	

</style>
</head>
<body class="vertical  light">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
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
			                <button type="button" class="btn shadow"><span class="fe fe-user fe-12 mr-2"></span>내 정보보기</button>
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
											<input type="image" name="submit" id="search-icon" src="${root}/resources/img/search.png">
										</div>
									</form>
								</div>
							</div>
							<div id="list-wrap">

								<div id="list-bar" class="shadow or-scroll-bar">
									
									<ul class="nav nav-pills">
										<li class="nav-item emp-info-bar non-click">
											<a class="nav-link" data-toggle="pill" href="#all">전체보기</a>
										</li>
										
										<c:forEach items="${deptMap['1']}" var="dl" >
												<li class="nav-item emp-info-bar non-click">
													<a class="nav-link" data-toggle="pill" href="#${dl.deptName}">${dl.deptName}</a>
													
													<c:forEach items="${deptMap['2']}" var="dl2" >
														<c:if test="${dl2.highDeptCode eq dl.deptCode}">
																<li class="nav-item emp-info-bar non-click">
																	<a class="nav-link" data-toggle="pill" href="#${dl2.deptName}">+ ${dl2.deptName}</a>
																		<c:forEach items="${deptMap['3']}" var="dl3" >
																			<c:if test="${dl3.highDeptCode eq dl2.deptCode}">
																				<li class="nav-item emp-info-bar non-click">
																					<a class="nav-link" data-toggle="pill" href="#${dl3.deptName}">+ + ${dl3.deptName}</a>
																						<c:forEach items="${deptMap['4']}" var="dl4" >
																							<c:if test="${dl4.highDeptCode eq dl3.deptCode}">
																								<li class="nav-item emp-info-bar non-click">
																									<a class="nav-link" data-toggle="pill" href="#${dl4.deptName}">+ + +${dl4.deptName}</a>
																										<c:forEach items="${deptMap['5']}" var="dl5" >
																											<c:if test="${dl5.highDeptCode eq dl4.deptCode}">
																												<li class="nav-item emp-info-bar non-click">
																													<a class="nav-link" data-toggle="pill" href="#${dl5.deptName}">+ + + +${dl5.deptName}</a>
																																
																														<c:forEach items="${deptMap['6']}" var="dl3" >
																															<c:if test="${dl6.highDeptCode eq dl5.deptCode}">
																																<li class="nav-item emp-info-bar non-click">
																																	<a class="nav-link" data-toggle="pill" href="#${dl6.deptName}">+ + + + + ${dl6.deptName}</a>
																																		<c:forEach items="${deptMap['3']}" var="dl3" >
																																			<c:if test="${dl3.highDeptCode eq dl2.deptCode}">
																																				<li class="nav-item emp-info-bar non-click">
																																					<a class="nav-link" data-toggle="pill" href="#${dl3.deptName}">+ + ${dl3.deptName}</a>
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
								<div id="profile-title"><h4>전체보기</h4></div>
								<div id="profile-area" class="or-scroll-bar">
								<c:forEach items="${empList}" var="el">
									<div class="profile shadow">
										<div class="profile-image avatar avatar-lg">
											<a href="">
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
								<div id="profile-title"><h4>${dl.deptName}</h4></div>
								<div id="profile-area" class="or-scroll-bar">
									
									<c:forEach items="${empList}" var="el">
										<c:if test="${dl.deptName eq el.deptName }">
											<div class="profile shadow">
												<div class="profile-image avatar avatar-lg">
													<a href="">
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
							
								
								
							<!-- Nav tabs -->

							
						</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>

		

		<!-- <script>

			const nonClick = document.querySelectorAll(".non-click");

			console.log(nonClick);

			function handleClick(event) {
				
				//div에서 모든 "click 클래스 제거"
				nonClick.forEach((e)=> {
					e.classList.remove("click")
				});

				//클릭한 div만 "click" 클래스 추가
				event.target.classList.add("click");

			}

			nonClick.forEach((e) => { 
				e.addEventListener("click", handleClick);
			});

		</script> -->
		
	  

</body>
</html>