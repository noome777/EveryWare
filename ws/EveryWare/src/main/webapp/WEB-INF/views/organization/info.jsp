<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Organization Info</title>

<style>
	
	.grid-body > div {
		border : 1px solid black;
	}
	
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    <body class="vertical  light">
	    <div class="wrapper">
	    	<main role="main" class="main-content">
		        <div class="container-fluid">
		          <div class="row justify-content-center">
		            <div class="col-12">
		            	<div class="row align-items-center my-4">
                			<div class="col">
                				<h4 class="h4 mb-0 page-title">임직원 정보</h2>
                			</div>
                			<div class="col-auto">
			                  <button type="button" class="btn"><span class="fe fe-user fe-12 mr-2"></span>내 정보보기</button>
			                </div>
                		</div>
							<div class="card shadow mb-4">
								<div class="card-body grid-body">
									<div></div>
									<div></div>
								</div>
							</div>
				   </div>
				</div>
				</div>
			</main>
		</div>
      </body>

</body>
</html>