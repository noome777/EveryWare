<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>조직도</title>

    <style>
        #tree-bar {
		height : 75vh;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-content: center;
	}
	
	#tree-name-bar {
		width: 97%;
		height: 10%;
		border-radius: 5px;
		display: grid;
		padding: 20px;
		grid-template-columns: 1fr 4fr;
	}
	
	#dept-list {
		width: 100%;
		height: 100%;
		border-radius: 5px;
		display: flex;
		justify-content: center;
		align-items: center;
		padding-top: 25px;
		background-color: white;
	}

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}

    #tree-body {
        margin-top: 30px;
    }





	/*----------------genealogy-scroll----------*/
 
.genealogy-scroll::-webkit-scrollbar {
    width: 5px;
    height: 8px;
}
.genealogy-scroll::-webkit-scrollbar-track {
    border-radius: 10px;
    background-color: #e4e4e4;
}
.genealogy-scroll::-webkit-scrollbar-thumb {
    background: #212121;
    border-radius: 10px;
    transition: 0.5s;
}
.genealogy-scroll::-webkit-scrollbar-thumb:hover {
    background: #d5b14c;
    transition: 0.5s;
}
 
 
/*----------------genealogy-tree----------*/
.genealogy-body{
    white-space: nowrap;
    overflow-y: hidden;
    padding: 50px;
    min-height: 500px;
    padding-top: 10px;
}
.genealogy-tree ul {
    padding-top: 20px; 
    position: relative;
    padding-left: 0px;
    display: flex;
}
.genealogy-tree li {
    float: left; text-align: center;
    list-style-type: none;
    position: relative;
    padding: 20px 5px 0 5px;
}
.genealogy-tree li::before, .genealogy-tree li::after{
    content: '';
    position: absolute; 
  top: 0; 
  right: 50%;
    border-top: 2px solid #ccc;
    width: 50%; 
  height: 18px;
}
.genealogy-tree li::after{
    right: auto; left: 50%;
    border-left: 2px solid #ccc;
}
.genealogy-tree li:only-child::after, .genealogy-tree li:only-child::before {
    display: none;
}
.genealogy-tree li:only-child{ 
    padding-top: 0;
}
.genealogy-tree li:first-child::before, .genealogy-tree li:last-child::after{
    border: 0 none;
}
.genealogy-tree li:last-child::before{
    border-right: 2px solid #ccc;
    border-radius: 0 5px 0 0;
    -webkit-border-radius: 0 5px 0 0;
    -moz-border-radius: 0 5px 0 0;
}
.genealogy-tree li:first-child::after{
    border-radius: 5px 0 0 0;
    -webkit-border-radius: 5px 0 0 0;
    -moz-border-radius: 5px 0 0 0;
}
.genealogy-tree ul ul::before{
    content: '';
    position: absolute; top: 0; left: 50%;
    border-left: 2px solid #ccc;
    width: 0; height: 20px;
}
.genealogy-tree li a{
    text-decoration: none;
    color: #666;
    font-family: arial, verdana, tahoma;
    font-size: 11px;
    display: inline-block;
    border-radius: 5px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
}
 
.genealogy-tree li a:hover+ul li::after, 
.genealogy-tree li a:hover+ul li::before, 
.genealogy-tree li a:hover+ul::before, 
.genealogy-tree li a:hover+ul ul::before{
    border-color:  #fbba00;
}
 
/*--------------memeber-card-design----------*/
.member-view-box{
    padding:0px 20px;
    text-align: center;
    border-radius: 4px;
    position: relative;
}
.member-image{
    width: 60px;
    position: relative;
}
.member-image img{
    width: 60px;
    height: 60px;
    border-radius: 6px;
  background-color :#000;
  z-index: 1;
}

.logo-img {
	width: 50px;
	height: 50px;
	margin-left: 23px;
	margin-bottom: 20px;
	margin-top: 10px;
}

#dept-list {
	overflow: auto;
}




	
</style>

<!-- jsTree theme -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
</head>
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    
	<div class="wrapper">
	    <main role="main" class="main-content">
		    <div class="container-fluid">
		        <div class="row justify-content-center">
		        <div class="col-12">
		            <div class="row align-items-center my-3">
                		<div class="col">
                			<h2 class="h3 mb-0 page-title">조직도</h2>
                		</div>
                	</div>
					<div id="tree-body" class="card-body grid-wrap mb-4">
						<div class="shadow" id="tree-bar">

								<div id="dept-list">
									
                                    <div class="body genealogy-body or-scroll-bar">
										<div class="genealogy-tree ">
											<ul>

												<c:forEach items="${deptMap['1']}" var="dl" >
													<li>
														<a href="javascript:void(0);">
															<div class="member-view-box">
																<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																<div class="member-image">
																	<div class="member-details">
																		<h5>${dl.deptName}</h5>
																	</div>
																</div>
															</div>
														</a>
														<ul class="active">

															<c:forEach items="${deptMap['2']}" var="dl2" >
																<c:if test="${dl2.highDeptCode eq dl.deptCode}">
																	<li>
																		<a href="javascript:void(0);">
																			<div class="member-view-box">
																				<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																				<div class="member-image">
																					<div class="member-details">
																						<h5>${dl2.deptName}</h5>
																					</div>
																				</div>
																			</div>
																		</a>
																		<ul>
																		<c:forEach items="${deptMap['3']}" var="dl3" >
																			<c:if test="${dl3.highDeptCode eq dl2.deptCode}">
																					<li>
																						<a href="javascript:void(0);">
																							<div class="member-view-box">
																								<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																								<div class="member-image">
																									<div class="member-details">
																										<h5>${dl3.deptName}</h5>
																									</div>
																								</div>
																							</div>
																						</a>
																						<ul>
																						<c:forEach items="${deptMap['4']}" var="dl4" >
																							<c:if test="${dl4.highDeptCode eq dl3.deptCode}">
																									<li>
																										<a href="javascript:void(0);">
																											<div class="member-view-box">
																												<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																												<div class="member-image">
																													<div class="member-details">
																														<h5>${dl4.deptName}</h5>
																													</div>
																												</div>
																											</div>
																										</a>
																										<ul>
																										<c:forEach items="${deptMap['5']}" var="dl5" >
																											<c:if test="${dl5.highDeptCode eq dl4.deptCode}">
																												<li>
																													<a href="javascript:void(0);">
																														<div class="member-view-box">
																															<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																															<div class="member-image">
																																<div class="member-details">
																																	<h5>${dl5.deptName}</h5>
																																</div>
																															</div>
																														</div>
																													</a>
																													<ul>
																														<c:forEach items="${deptMap['6']}" var="dl6" >
																															<c:if test="${dl6.highDeptCode eq dl5.deptCode}">
																																<li>
																																	<a href="javascript:void(0);">
																																		<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																		<div class="member-view-box">
																																			<div class="member-image">
																																				<div class="member-details">
																																					<h5>${dl6.deptName}</h5>
																																				</div>
																																			</div>
																																		</div>
																																	</a>
																																	<ul>
																																		<c:forEach items="${deptMap['7']}" var="dl7" >
																																			<c:if test="${dl7.highDeptCode eq dl6.deptCode}">
																																				<li>
																																					<a href="javascript:void(0);">
																																						<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																						<div class="member-view-box">
																																							<div class="member-image">
																																								<div class="member-details">
																																									<h5>${dl7.deptName}</h5>
																																								</div>
																																							</div>
																																						</div>
																																					</a>
																																					<ul>
																																						<c:forEach items="${deptMap['8']}" var="dl8" >
																																							<c:if test="${dl8.highDeptCode eq dl7.deptCode}">
																																								<li>
																																									<a href="javascript:void(0);">
																																										<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																										<div class="member-view-box">
																																											<div class="member-image">
																																												<div class="member-details">
																																													<h5>${dl8.deptName}</h5>
																																												</div>
																																											</div>
																																										</div>
																																									</a>
																																									<ul>
																																										<c:forEach items="${deptMap['9']}" var="dl9" >
																																											<c:if test="${dl9.highDeptCode eq dl8.deptCode}">
																																												<li>
																																													<a href="javascript:void(0);">
																																														<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																														<div class="member-view-box">
																																															<div class="member-image">
																																																<div class="member-details">
																																																	<h5>${dl9.deptName}</h5>
																																																</div>
																																															</div>
																																														</div>
																																													</a>
																																													<ul>
																																														<c:forEach items="${deptMap['10']}" var="dl10" >
																																															<c:if test="${dl10.highDeptCode eq dl9.deptCode}">
																																																<li>
																																																	<a href="javascript:void(0);">
																																																		<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																																		<div class="member-view-box">
																																																			<div class="member-image">
																																																				<div class="member-details">
																																																					<h5>${dl10.deptName}</h5>
																																																				</div>
																																																			</div>
																																																		</div>
																																																	</a>
																																																	<ul>
																																																		<c:forEach items="${deptMap['11']}" var="dl11" >
																																																			<c:if test="${dl11.highDeptCode eq dl10.deptCode}">
																																																				<li>
																																																					<a href="javascript:void(0);">
																																																						<img class="logo-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="logo">
																																																						<div class="member-view-box">
																																																							<div class="member-image">
																																																								<div class="member-details">
																																																									<h5>${dl11.deptName}</h5>
																																																								</div>
																																																							</div>
																																																						</div>
																																																					</a>
																																																					
																				
																																																				</li>
																																																			</c:if>
																																																		</c:forEach>
																																																	</ul>
																
																																																</li>
																																															</c:if>
																																														</c:forEach>
																																													</ul>
												
																																												</li>
																																											</c:if>
																																										</c:forEach>
																																									</ul>
								
																																								</li>
																																							</c:if>
																																						</c:forEach>
																																					</ul>
				
																																				</li>
																																			</c:if>
																																		</c:forEach>
																																	</ul>

																																</li>
																															</c:if>
																														</c:forEach>
																													</ul>
																												</li>
																											</c:if>
																										</c:forEach>
																										</ul>
																									</li>
																								</c:if>
																							</c:forEach>
																						</ul>
																						
																					</li>
																				</c:if>
																			</c:forEach>
																		</ul>
																	</li>
																</c:if>
															</c:forEach>
														</ul>

													</li>
												</c:forEach>
											</ul>
										</div>
									</div>
								</div>							
							</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		<script>
		$(function () {
			$('.genealogy-tree ul').hide();
			$('.genealogy-tree>ul').show();
			$('.genealogy-tree ul.active').show();
			$('.genealogy-tree li').on('click', function (e) {
				var children = $(this).find('> ul');
				if (children.is(":visible")) children.hide('fast').removeClass('active');
				else children.show('fast').addClass('active');
				e.stopPropagation();
			});
		});
		</script>
</body>
</html>
        