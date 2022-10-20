<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 검색</title>

<style>


	
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
                			<h3 class="h4 mb-0 page-title padding-left-20px">검색결과</h3>
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
											<a href="">
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

		
	  

</body>
</html>