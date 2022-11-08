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

	#option-area {
		height: 100%;
		width: 70%;
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
		padding-left: 10px;
	}

	#check-num-area {
		width: 15%;
		height: 100%;
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
	}

	#option-btn-area {
		width: 85%;
		height: 100%;
		display: flex;
		flex-direction: row;
		justify-content: flex-start;
		align-items: center;
	}

	#option-btn-area > button {
		margin-left: 20px;
		border: none;
		color: gray;
		border-radius: 5px;
		width: 90px;
		height: 30px;
		background-color: white;
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
		width: 100%;
		height: 34px;
		margin-right: 10px;
		text-align: center;
		border-radius: 8px;
	}

	th, td {
		text-align: center !important;
	}

	.tdInput {
		border: none;
		border-radius: 5px;
		text-align: center;
		color: gray;
	}

	input[type="text"] {
		color: gray;
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
												<input type="image" id="search-icon" src="${root}/resources/img/search.png" onclick=" return searchDept();">
											</div>
										</div>
										<div id="option-area">
											<div id="checkNum-area">
											</div>
											<div id="option-btn-area">

												<button id="addDeptBtn" class="shadow fade" onclick="openAddModal();">
													<strong>
														<small>부서추가</small>
													</strong>
												</button>
												<button id="editDeptBtn" class="shadow fade">
													<strong>
														<small>부서수정</small>
													</strong>
												</button>
												<button id="deleteDeptBtn" class="shadow fade">
													<strong>
														<small>부서삭제</small>
													</strong>
												</button>
											</div>
										</div>

									</div>

									<div id="dept-result-area">

										<div id="table-padding">

											<table class="table table-borderless table-hover">
												<thead>
												  <tr>
													<th></th>
													<th>부서코드</th>
													<th>부서이름</th>
													<th>상위부서</th>
													<th>임직원수</th>
												  </tr>
												</thead>
												<tbody id="target">
													
												  <tr>
													<td colspan="5"></td>
												  </tr>
												</tbody>
											  </table>

										</div>


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


		 <!-- 관리자 추가 모달 -->
		 <div class="modal fade" id="add-dept-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" >부서 추가</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div id="add-dept-area" class="modal-body">
					<table class="table table-borderless table-hover">
					<thead>
					  <tr>
						<th></th>
						<th>상위부서</th>
						<th>추가부서명</th>
					  </tr>
					</thead>
					<tbody id="add-target">
					  <tr>
						<td colspan="3"></td>
					  </tr>
					</tbody>
				  </table>
				</div>
				
				<div class="modal-footer">
				  <button type="button" class="btn mb-2 btn-primary" onclick="addDept();">추가</button>
				  <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal" onclick="cleanAddModal();">취소</button>
				</div>
			  </div>
			</div>
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

	<!-- 체크박스 체크 시 버튼 활성화 -->
	<script>
    
		function readCheckNum() {
			const checkNum = $("input:checkbox[name='check']:checked").length;
			const checkNumArea = $("#checkNum-area");
			const editDeptBtn = $("#editDeptBtn");
			const deleteDeptBtn = $("#deleteDeptBtn");
			const addDeptBtn = $("#addDeptBtn");
			
			checkNumArea.removeClass("fade");
			editDeptBtn.removeClass("fade");
			deleteDeptBtn.removeClass("fade");
			addDeptBtn.removeClass("fade");
			checkNumArea.html("<small>"+"체크 : "+checkNum+"</small>");
		   
	
			var total = $("input[name=check]").length;
			var checked = $("input[name=check]:checked").length;
			if(checked==0) {
			  checkNumArea.html("");
			  editDeptBtn.addClass("fade");
			  deleteDeptBtn.addClass("fade");
			  addDeptBtn.addClass("fade");
			}
		}
	  </script>


	<!--부서 검색-->

	<script>

		function searchDept() {

			cleanArea();
			
			let word = $('#search-bar').val();

			if(word.trim() === "") {
				alert("검색창에 글자를 입력하여 주시길 바랍니다.");
				return false;
			}

			word = word.trim();

			console.log(word);

		$.ajax({
		
		url : "${root}/organization/management/dept/search",
		type : "POST",
		traditional : true,
		dataType : "JSON",
		data : {
			word : word
		},
		success : function(jsonStr) {
			console.log(jsonStr);

			const resultLength = jsonStr.length;

			for (let i=0; i<resultLength; ++i) {
			var result = jsonStr.pop();

			$('#target').prepend(
				'<tr>' + '<td><input type="checkbox" name="check" value="' + result['deptName']  +'" onchange="readCheckNum();" ></td>' + 
				'<td>' + result['deptCode'] + '</td>' +
				'<td>' + result['deptName'] + '</td>' +
				'<td>' + result['highDeptName'] + '</td>' +
				'<td>' + result['empCount'] + "명" + '</td>' +
				'</tr>'
			);
			}
		},
		error : function(fail) {
			alert(fail);
		}
		});
			
		}
	</script>


	<script>

		function cleanArea() {

			var tbodyLength = $('#target tr').length;

			for(let i=0; i<tbodyLength; ++i) {
			$('#target > tr').eq(i).empty();
			}

		}

	</script>


	<script>

		function openAddModal() {

			const checkBoxArr = [];
			const highDeptArr = [];
			$('input:checkbox:checked').each(function(){
				checkBoxArr.push($(this).val());
				highDeptArr.push($('input[type="checkbox"]:checked').parent().next().text());
			});

			console.log(highDeptArr);

			for(var i = 0; i < checkBoxArr.length; ++i) {
				
				$('#add-target').prepend(

					'<tr>' +
						'<td>' +
							'<input type="hidden" class="add-high-dept" depth-data="" value="">'	+					
						'</td>'+
						'<td>' + 
							checkBoxArr[i] + 
						'</td>' +
						'<td>' + 
							'<input type="text" name="deptName" class="tdInput add-dept-input" placeholder="부서명">' +
						'</td>' + 
					'</tr>'
				)
			}

			$('#add-dept-modal').modal();
			
		}
	
	</script>

	<script>

		function cleanAddModal() {

			var tbodyLength = $('#add-target tr').length;

			for(let i=0; i<tbodyLength; ++i) {
				$('#add-target > tr').eq(i).empty();
			}
		}

	</script>


	<script>

		function addDept() {

			const highDeptArr = [];
			const addDeptArr = [];
			

			for(let i=0; i<$('.add-high-dept').length; ++i) {
				highDeptArr.push($(".add-high-dept").eq(i).text());
				addDeptArr.push($(".add-dept-input").eq(i).val());
			}
			
			$.ajax({
					url:"${root}/organization/management/dept/add",
					type:"POST",
					traditional : true,
					dataType : "json",
					async : false,
					cache: false,
					data : {
						highDeptArr : highDeptArr,
						addDeptArr : addDeptArr
					},
					success: function(data) {
						
						console.log("성공!");

					},
					error:function (data) {
						alert("에러 + " + data);
					}
			});
			}
			

	
	</script>



	<script>
	function openEditModal() {
		$('#edit-dept-modal').modal();
	}
	
	function openDeleteModal() {
		$('#delete-dept-modal').modal();
	}
	
	</script>


		
</body>
</html>
        