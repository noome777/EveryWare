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
	
	#rank-setting-bar {
		width: 96%;
		height: 9%;
		border-radius: 5px;
		display: grid;
		padding: 20px;
		grid-template-columns: 1fr 3fr;
	}

	#rank-setting-bar > div {
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	
	#rank-list {
		width: 96%;
		height: 86%;
		border-radius: 5px;
		display: flex;
		border-radius: 5px;
		justify-content: center;
		align-items: flex-start;
		padding-top: 25px;
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

	#grid-area {
		width: 95%;
		display: grid;
		grid-template-columns: 80px 2fr;
	}

	#grid-area > div {
		height: 42px;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
		padding-left: 20px;
		border-bottom: 1px solid lightgray;
	}

	#add-rank-btn:hover {
		cursor: pointer;
		color: rgb(27, 104, 255); 
	}

	.or-scroll-bar {
		overflow: auto;
	}
	
	#rank-add-modal input, #rank-add-modal select {
		border : 1px solid lightgray;
		border-radius : 5px;
		color : gray;
	}

	.add-modal-body {
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.add-modal-body > div {
		width: 140px;
		height: 140px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#rankLevelSelect {
		width: 70px;
	}

	#rankNameInput {
		margin-right: 15px;
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
							
								<div id="rank-setting-bar" class="shadow">
									<div><strong>직위설정</strong></div>
									<div>
										<a id="add-rank-btn" data-toggle="modal" href="#rank-add-modal"><small>+ 직위추가</small></a>
									</div>
								</div>
								

								<div id="rank-list" class="shadow or-scroll-bar">
									
									<div id="grid-area">
									
										<c:forEach items="${rankList}" var="rankList" >

										<div>${rankList.rankLevel}등급</div>
										<div>
											<a class="rank-name" onclick="alert('ㅋㅋ');">
												${rankList.rankName}
											</a>
										</div>
										
										</c:forEach>
										
										

									</div>


									<!-- modal에 select + 이름 등록-->
									
									
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

		 <!-- 직위 추가 모달 -->
		 

		   <!--직위 수정/삭제 모달-->


		  


		  <!-- 직위 변경 모달 -->
	<form action="${root}/organization/management/rank/add" method="post">
	    <div class="modal fade" id="rank-add-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
	      <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" >직위추가</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>
	          <div class="modal-body add-modal-body"> 
	            <div>
	              <select name="rankLevel" id="rankLevelSelect">
	                <c:forEach items="${rankList}" var="rankList">
	                  <option value="${rankList.rankLevel}">${rankList.rankLevel}등급</option>
	                </c:forEach>
					<option value="${rankList.size()+1}">${rankList.size()+1}등급</option>
	              </select> 
	            </div>
				<div>
					<input type="text" name="rankName" id="rankNameInput">
				</div>
	          </div>  
	          <div class="modal-footer">
	            <input type="submit" class="btn mb-2 btn-primary"  value="추가">
	            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
	          </div>
	        </div>
	      </div>
	    </div>
	 </form>
		<!--직위 수정/삭제 모달-->

		

	

</body>
</html>