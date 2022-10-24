<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직위/직무 관리</title>

 <style>
 
 	.grid-wrap {
		height : 85vh;
		display:grid;
		grid-template-columns: 65% 35%;
		grid-template-rows: 100%;
		justify-content: center;
		align-content: center;
		gap : 30px;
	}
	.grid-wrap > div {
		border-radius: 5px;
		background-color: white;
	}

	#list-wrap{

		display: flex;
		flex-direction : column;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;

	}
	
	#setting-bar {
		width: 96%;
		height: 9%;
		border-radius: 5px;
		display: flex;
		border-radius: 5px;
	}
	
	#list-bar {
		width: 96%;
		height: 86%;
		border-radius: 5px;
		display: flex;
		border-radius: 5px;
	}

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}
	
	#profile-wrap {
		display: flex;
		flex-direction: column;
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
                			<h2 class="h3 mb-0 page-title">직위/직무 관리</h2>
                		</div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div id="list-wrap">
							
								<div id="setting-bar" class="shadow">
									<p>직위관리 + 등급 추가</p>
								</div>
								

								<div id="list-bar" class="shadow or-scroll-bar">
									
									
								</div>
								
								
							</div>
						</div>

						<div id="profile-wrap" class="shadow tab-content">

							
						</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>

	

</body>
</html>