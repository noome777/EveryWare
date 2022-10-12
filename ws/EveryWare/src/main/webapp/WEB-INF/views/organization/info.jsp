<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Organization Info</title>

<style>

	.scroll {
		overflow-y: scroll;
	}

	.col-auto > button {
		border: 1px solid lightgray;
	}
	
	.grid-wrap {
		height : 85vh;
		display:grid;
		grid-template-columns: 25% 75%;
		grid-template-rows: 100%;
		justify-content: center;
		align-content: center;
		gap : 30px;
	}
	.grid-wrap > div {
		border-radius: 5px;
		border : 1px solid lightgrey;
		background-color: white;
	}

	#info-nav {
		display: grid;
		width: 100%;
		grid-auto-rows: 13% 87%;
	}


	#search-wrap {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#search-container {
		width: 85%;
		height: 55%;
		border-radius: 5px;
		border : 1px solid lightgray;
		display: flex;
	}

	#search-icon-wrap {
		width: 20%;
		height: 100%;
	}

	#search-bar-wrap {
		width: 80%;
		height: 100%;
	}

	#search-bar {
		width: 100%;
		height: 100%;
		padding: 10px;
	}

	#list-wrap {
		display: flex;
		justify-content: center;
		align-items: center;
		
	}

	#list-bar {
		width: 85%;
		height: 93%;
		border-radius: 5px;
		border: 1px solid lightgray;
		overflow-y: scroll;
	}

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}

	input:focus{
		outline: none;
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
                			<h4 class="h4 mb-0 page-title">임직원 정보</h2>
                		</div>
                		<div class="col-auto">
			                <button type="button" class="btn shadow"><span class="fe fe-user fe-12 mr-2"></span>내 정보보기</button>
			            </div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div id="search-wrap">
								<div class="shadow" id="search-container">
									<div id="search-bar-wrap">
										<input type="text" id="search-bar" class="style-none" placeholder="임직원 검색"> 
									</div>
									<div id="search-icon-wrap">

									</div>
								</div>
							</div>
							<div id="list-wrap" id="info-content">
								<div id="list-bar" class="shadow"></div>
							</div>
						</div>
						<div class="shadow"></div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>

	  

</body>
</html>