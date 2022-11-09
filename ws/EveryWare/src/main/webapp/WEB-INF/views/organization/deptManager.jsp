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
		width: 140px;
	}

	input[type="text"], select {
		color: gray;
	}

	.highDept-selector {
		width: 140px;
		border : 1px solid gray;
		border-radius: 5px;
		margin-left: 5px;
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

							<div id="dept-setting" class="shadow">

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

												<button id="addDeptBtn" class="shadow fade" onclick="return openAddModal();">
													<strong>
														<small>부서추가</small>
													</strong>
												</button>
												<button id="editDeptBtn" class="shadow fade" onclick="return openEditModal();">
													<strong>
														<small>부서수정</small>
													</strong>
												</button>
												<button id="deleteDeptBtn" class="shadow fade" onclick="return deleteDept();">
													<strong>
														<small>부서삭제</small>
													</strong>
												</button>
											</div>
										</div>

									</div>

									<div id="dept-result-area" class="or-scroll-bar">

										<div id="table-padding">

											<table class="table table-borderless table-hover">
												<thead>
												  <tr>
													<th></th>
													<th>부서코드</th>
													<th>부서이름</th>
													<th>상위부서</th>
													<th>부서레벨</th>
													<th>임직원수</th>
												  </tr>
												</thead>
												<tbody id="target">
													
												  <tr>
													<td colspan="6"></td>
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


		 <!-- 부서 추가 모달 -->
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
				  <button type="button" class="btn mb-2 btn-primary" onclick="return addDept();">추가</button>
				  <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal" onclick="return cleanAddModal();">취소</button>
				</div>
			  </div>
			</div>
		  </div>

		  <!-- 부서 수정 모달 -->
		 <div class="modal fade" id="edit-dept-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" >부서 수정</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div id="edit-dept-area" class="modal-body">
					<table class="table table-borderless table-hover">
					<thead>
					  <tr>
						<th></th>
						<th>선택부서</th>
						<th>상위부서</th>
						<th>부서명</th>
					  </tr>
					</thead>
					<tbody id="edit-target">
					  <tr>
						<td colspan="4"></td>
					  </tr>
					</tbody>
				  </table>
				</div>
				
				<div class="modal-footer">
				  <button type="button" class="btn mb-2 btn-primary" onclick="return editDept();">수정</button>
				  <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal" onclick="return cleanEditModal();">취소</button>
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
				'<tr>' + '<td><input type="checkbox" name="check" value="' + result['deptName']  +'" onchange="readCheckNum();" level="' + result['deptDepth'] +'"></td>' + 
				'<td>' + result['deptCode'] + '</td>' +
				'<td>' + result['deptName'] + '</td>' +
				'<td>' + result['highDeptName'] + '</td>' +
				'<td>' + result['deptDepth'] + '</td>' +
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

	<!--검색 시 초기화-->

	<script>

		function cleanArea() {

			var tbodyLength = $('#target tr').length;

			for(let i=0; i<tbodyLength; ++i) {
			$('#target > tr').eq(i).empty();
			}

		}

	</script>

	<!--부서추가 모달-->

	<script>

		function openAddModal() {

			const checkBoxArr = [];
			const highDeptArr = [];

			const highDeptCode= $('input[type="checkbox"]:checked').parent().next();

			let boolean = true;
			
			$('input:checkbox:checked').each(function(){
				checkBoxArr.push($(this).val());
				
				var level = $(this).attr("level");

				if(level==11) {
					alert("부서는 총 11단계까지 개설할 수 있습니다.");
					boolean = false;
				} 
			});

			if(boolean==false) return false;


			
			for(var i = 0; i < checkBoxArr.length; ++i) {

				highDeptArr.push(highDeptCode.eq(i).text());

				
				$('#add-target').prepend(

					'<tr>' +
						'<td class="fade add-high-dept">' + highDeptArr[i] + '</td>' +
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

	<!--부서추가모달 클리어-->

	<script>

		function cleanAddModal() {

			var tbodyLength = $('#add-target tr').length;

			for(let i=0; i<tbodyLength; ++i) {
				$('#add-target > tr').eq(i).empty();
			}
		}

	</script>

	<!--부서추가-->

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
						
						if(data=="성공!") {
							alert("부서추가에 성공하였습니다.");
							window.location.href = "${root}/organization/management/dept";
						} else {
							alert("부서를 추가하는 과정에서 에러가 발생하였습니다.");
						}

					},
					error:function (data) {
						alert("에러 + " + data);
					}
			});
		}
			

	
	</script>

	<!--수정 모달-->

	<script>
	function openEditModal() {

		const checkBoxArr = [];
		const highDeptArr = [];

		const highDeptCode= $('input[type="checkbox"]:checked').parent().next();

		$('input:checkbox:checked').each(function(){
			checkBoxArr.push($(this).val());
		});

		
		$.ajax({
			url:"${root}/organization/management/dept/selectList",
			type:"POST",
			traditional : true,
			dataType : "json",
			async : false,
			cache: false,
			success: function(data) {

				console.log(data[10]);
				
				var option = "";
				var blank="";

				for(var i=0; i<data.length; ++i) { 

					
					var result = data[i]; 

					for(var j=0; j<result['deptDepth']; ++j) {
						blank = blank + "&nbsp;";
					}

					option = option + "<option value=" + result['deptCode'] + ">" + blank + result['deptName'] + "</option>";
					blank="";
				}

						
				
				for(var i = 0; i < checkBoxArr.length; ++i) {

					highDeptArr.push(highDeptCode.eq(i).text());

					$('#edit-target').prepend(

						'<tr>' + 
							'<td class="edit-high-dept">' + highDeptArr[i] + '</td>' +
							'<td>' + checkBoxArr[i] + '</td>' + 
							'<td>' + 
								'<select name="highDeptCode" class="highDept-selector">' +
									option +
								'</select>' +
							'</td>' +
							'<td>' + 
								'<input type="text" name="deptName" class="tdInput edit-dept-input" placeholder="부서명">' +
							'</td>' + 
						'</tr>'
					);

				}
			},
			error:function (data) {
				alert("에러 + " + data);
			}
		});

		$('#edit-dept-modal').modal();
	}
	
	
	</script>

	<script>

		function cleanEditModal() {

			var tbodyLength = $('#edit-target tr').length;

			for(let i=0; i<tbodyLength; ++i) {
				$('#edit-target > tr').eq(i).empty();
			}
		}

	</script>

	<script>

		function editDept() {

			console.log("???");

			const highDeptArr = [];
			const deptArr = [];
			const editDeptArr = [];
			

			for(let i=0; i<$('.edit-high-dept').length; ++i) {
				highDeptArr.push($(".edit-high-dept").eq(i).text());
				deptArr.push($(".highDept-selector").eq(i).val());
				editDeptArr.push($(".edit-dept-input").eq(i).val());
			}

			
			$.ajax({
					url:"${root}/organization/management/dept/edit",
					type:"POST",
					traditional : true,
					dataType : "json",
					async : false,
					cache: false,
					data : {
						highDeptArr : highDeptArr,
						deptArr : deptArr,
						editDeptArr : editDeptArr
					},
					success: function(data) {
						
						if(data=="성공!") {
							alert("부서수정에 성공하였습니다.");
							window.location.href = "${root}/organization/management/dept";
						} else {
							alert("부서를 수정하는 과정에서 에러가 발생하였습니다.");
						}

					},
					error:function (data) {
						alert("에러 + " + data);
					}
			});

		}
	</script>


	<!--부서 삭제-->
	<script>
		function deleteDept() {

		}
	</script>


		
</body>
</html>
        