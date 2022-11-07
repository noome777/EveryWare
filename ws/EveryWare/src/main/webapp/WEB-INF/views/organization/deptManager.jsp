<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<style>

	.grid-wrap {
		height : 85vh;
		display:grid;
		grid-template-columns: 40% 60%;
		grid-template-rows: 100%;
		justify-content: center;
		align-content: center;
		gap : 30px;
	}
	.grid-wrap > div {
		border-radius: 5px;
		background-color: white;
	}

	.list-wrap{

		display: flex;
		flex-direction : column;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 100%;

	}
	
	#orChart-bar, #dept-setting-bar {
		width: 92%;
		height: 9%;
		border-radius: 5px;
		display: grid;
		padding: 20px;
		grid-template-columns: 1fr 4fr;
	}


	#dept-setting-bar > div{
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	
	#orChart{
		width: 92%;
		height: 86%;
		border-radius: 5px;
		display: flex;
		justify-content: center;
		align-items: flex-start;
		padding-top: 25px;
	}

	#dept-setting {
		width: 96%;
		height: 86%;
		border-radius: 5px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#dept-setting-bar{
		width: 96%;
	}

	#orChart {
		padding-top: 50px;
	}

	

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}

	.or-scroll-bar {
		overflow: auto;
	}
	
	
	
	.hide-input{
		border:none;
		border-right:0px;
		border-top:0px;
		boder-left:0px; 
		boder-bottom:0px;
	 	 color : gray;
	 	border-radius : 8px;
	}

	#dept-setting-flex {
		padding-top: 15px;
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		width: 100%;
		height: 100%;
	}

	#dept-setting-btns {
		width: 100%;
		height: 10%;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		padding: 5px;
	}

	#dept-result-area {
		width: 100%;
		height: 90%;
	}

	#search-area {
		height: 100%;
		width: 30%;
	}

	.btn-area {
		height: 100%;
		width: 23.3%;
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: flex-start;
	}

	.center-flex {
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.center-flex-row {
		display: flex;
		flex-direction: row;
		align-items: center;
		justify-content: center;
	}

	#search-icon {
		width: 34px;
		height: 34px;
		
	}

	#search-bar {
		width: 170px;
		height: 34px;
		margin-right: 10px;
		text-align: center;
		border-radius: 8px;
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
                			<h2 class="h3 mb-0 page-title">부서관리</h2>
                		</div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div class="list-wrap">
							
								<div id="orChart-bar" class="shadow">
									
									<strong>조직도</strong>

								</div>
								

								<div id="orChart" class="shadow or-scroll-bar">
									
									
									<div id="tree"></div>
									
								</div>
								
								
							</div>
						</div>

						<div class="shadow tab-content list-wrap">

							<div id="dept-setting-bar" class="shadow">
								<div>
									<strong>설정</strong>
								</div>
								
							</div>

							<div id="dept-setting" class="shadow or-scroll-bar">

								<div id="dept-setting-flex">
									<div id="dept-setting-btns">

										<div id="search-area" class="center-flex-row">
											<div id="search-bar-wrap">
												<input type="text" id="search-bar" class="style-none" placeholder="부서 검색" name="word"> 
											</div>
											<div id="search-icon-wrap">
												<img id="search-icon" src="${root}/resources/img/search.png" onclick=" return checkBlank();">
											</div>
										</div>
										<div class="btn-area">qq</div>
										<div class="btn-area">ww</div>
										<div class="btn-area">ee</div>

									</div>

									<div id="dept-result-area">qwee</div>
								</div>
									

							</div>

						</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>


		
		<!-- jsTree -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>

		<script>


		function getJson() {
			$.ajax({
					url:"${root}/organization/management/getDept",
					type:"POST",
					traditional : true,
					dataType : "json",
					async : false,
					cache: false,
					success: function(data) {
						var company = new Array();
								// 데이터 받아옴
						$.each(data, function(idx, item){
								company[idx] = {id:item.deptCode, parent:item.highDeptCode, text:item.deptName};
						});

								// 트리 생성
						$('#tree').jstree({
							core: {
											data: company    //데이터 연결
								},
								types: {
									'default': {
											'icon': 'jstree-folder'
										}
								},
								plugins: ['wholerow', 'types']
						})
						.bind('loaded.jstree', function(event, data){
								//트리 로딩 완료 이벤트
						})
						.bind('select_node.jstree', function(event, data){
							//노드 선택 이벤트
						})

					},
					error:function (data) {
						alert("에러 + " + data);
					}
			});
			}
			
			$(document).ready(function(){
				getJson();
			});

		

		</script>


		
</body>
</html>
        