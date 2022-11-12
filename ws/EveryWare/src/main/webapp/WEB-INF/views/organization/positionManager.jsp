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
		grid-template-columns: 70% 30%;
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
	
	#rank-setting-bar {
		width: 96%;
		height: 9%;
		border-radius: 5px;
		display: grid;
		padding: 20px;
		grid-template-columns: 1fr 4fr;
	}

	#job-setting-bar {
		width:96%;
		height: 9%;
		border-radius: 5px;
		display: grid;
		padding: 20px;
		grid-template-columns: 1fr 2fr;
	}

	#rank-setting-bar > div, #job-setting-bar > div {
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	
	#rank-list, #job-list {
		width: 96%;
		height: 86%;
		border-radius: 5px;
		display: flex;
		border-radius: 5px;
		justify-content: center;
		align-items: flex-start;
		padding-top: 25px;
	}

	#job-list, #job-setting-bar {
		width: 92%;
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

	#rank-grid-area {
		width: 95%;
		display: grid;
		grid-template-columns: 80px 2fr;
	}
	
	#job-grid-area {
		width: 95%;
		display: grid;
		grid-template-columns: 1fr 1fr 1fr;
		gap: 30px;
		padding: 10px;
	}

	#rank-grid-area > div {
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
	
	#jobNameInput, #rank-add-modal select, #rankNameInput, #editJobName {
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
	
	.hide-input{
		border:none;
		border-right:0px;
		border-top:0px;
		boder-left:0px; 
		boder-bottom:0px;
	 	 color : gray;
	 	border-radius : 8px;
	}

	.job-name:hover {
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
                			<h2 class="h3 mb-0 page-title">직위/직무 관리</h2>
                		</div>
                	</div>
					<div class="card-body grid-wrap mb-4">
						<div class="shadow" id="info-nav">
							<div class="list-wrap">
							
								<div id="rank-setting-bar" class="shadow">
									<div>
										<strong>직위설정</strong>
									</div>
									<div>
										<a id="add-rank-btn" data-toggle="modal" href="#rank-add-modal">
											<small>+ 직위추가</small>
										</a>
									</div>
								</div>
								

								<div id="rank-list" class="shadow or-scroll-bar">
									
									<div id="rank-grid-area">
										<c:forEach items="${rankList}" var="rankList" >

										<div>${rankList.rankLevel}등급</div>
										<div>
											<a class="rank-name"  data-toggle="modal" href="#modal-${rankList.rankLevel}">
												${rankList.rankName}
											</a>
										</div>
										
										</c:forEach>
									</div>


									<!-- modal에 select + 이름 등록-->
									
									
								</div>
								
								
							</div>
						</div>

						<div class="shadow tab-content list-wrap">

							<div id="job-setting-bar" class="shadow">
								<div>
									<strong>직무설정</strong>
								</div>
								<div>
									<a id="add-job-btn" data-toggle="modal" href="#job-add-modal">
										<small>+ 직무추가</small>
									</a>
								</div>
							</div>

							<div id="job-list" class="shadow or-scroll-bar">
								<div id="job-grid-area">
									<c:forEach items="${jobList}" var="jobList" >
										<a class="job-name"  data-toggle="modal" data-value="${jobList.jobName}" onclick="writeThis(this);">
											${jobList.jobName}
										</a>
									</c:forEach>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			</div>
		</main>
		</div>

	<!-- 직위 추가 모달 -->
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
					<input type="text" name="rankName" id="rankNameInput" placeholder="직위명">
				</div>
	          </div>  
	          <div class="modal-footer">
	            <input type="submit" class="btn mb-2 btn-primary" value="추가">
	            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
	          </div>
	        </div>
	      </div>
	    </div>
	 </form>

	<!--직위 수정/삭제 모달-->
	
	<c:forEach items="${rankMap}" var="rankMap">

	  	<form action="${root}/organization/management/rank/edit" method="post">

			<div class="modal fade"  id="modal-${rankMap.key}" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-header">
					<h5 class="modal-title" >${rankMap.key}등급 설정</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					</div>
					<div id="search-result-area" class="modal-body">
						<table class="table table-borderless table-hover">
						<thead>
						<tr>
						<th></th>
							<th>체크박스</th>
							<th>직위명</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${rankMap.value}" var="value">
						<tr>
							<td></td>
							<td> 
								<input type="checkBox" value="${value.rankCode}" name="rankCode">
							</td>
							<td>
								<input type="text" value="${value.rankName}"  name="rankName" class="hide-input">
							</td>
							<td></td>
						</tr>
						</c:forEach>
						
						</tbody>
					</table>
					</div>
					
					<div class="modal-footer">
					<button type="button" class="btn mb-2 btn-primary" onclick=" return editRank();" >수정</button>
					<button type="button" class="btn mb-2 btn-danger" data-dismiss="modal" onclick=" return deleteRank();">삭제</button>
					</div>
				</div>
				</div>
			</div>

	  	</form>
	</c:forEach>

	<!-- 직무 추가 모달 -->
	<form action="${root}/organization/management/job/add" method="post">
	    <div class="modal fade" id="job-add-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
	      <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" >직무추가</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>
	          <div class="modal-body add-modal-body">
				<div>
					<input type="text" name="rankName" id="jobNameInput" placeholder="직무명">
				</div>
	          </div>  
	          <div class="modal-footer">
	            <button type="button" class="btn mb-2 btn-primary" onclick="return addJob();">추가</button>
	            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
	          </div>
	        </div>
	      </div>
	    </div>
	 </form>

	 <!-- 직무 수정/삭제 모달 -->
	<form action="${root}/organization/management/job/add" method="post">
	    <div class="modal fade" id="edit-job-modal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
	      <div class="modal-dialog modal-dialog-centered" role="document">
	        <div class="modal-content">
	          <div class="modal-header">
	            <h5 class="modal-title" >직무수정</h5>
	            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>
	          <div class="modal-body add-modal-body">
				<div>
					<input type="text" name="rankName" id="editJobName" placeholder="직무명 수정">
				</div>
	          </div>  
	          <div class="modal-footer">
	            <button type="button" class="btn mb-2 btn-primary" onclick="return editJob();">수정</button>
	            <button type="button" class="btn mb-2 btn-danger" data-dismiss="modal" onclick="return deleteJob();">삭제</button>
	          </div>
	        </div>
	      </div>
	    </div>
	 </form>



	<script>
		function editRank() {

			const checkBoxArr = [];
			const editRankArr = [];

			const check = true;

			const checkedLength = $('input:checkbox[name=rankCode]:checked').length;

			if(checkedLength==0) {
				alert('수정하시려는 직위에 체크 하시고 직위명을 변경하신 후 버튼을 눌러주시길 바랍니다.');
				return false;
			}

			const result = window.confirm("정말로 수정하시겠습니까?");
			if(result==false) {
			 alert('수정이 취소되었습니다.');
			 return false;
			}

			$('input:checkbox[name=rankCode]:checked').each(function(){
				
				var inputVal = $(this).parents().next().children().val();

				var rankNum = inputVal.search(/[0-9]/g);
				var rankEng = inputVal.search(/[a-z]/ig);
				var rankSpe = inputVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

				const nameHan = /^[ㄱ-ㅎ|가-힣]+$/;

			 	
				if(rankSpe.length > 10){
					alert("직위명은 10글자 이내로 작성해주시길 바랍니다.");
					check = false;
				}else if(inputVal.search(/\s/) != -1){
					alert("직위명은 공백 없이 입력해주시길 바랍니다.");
					check = false;
				}else if(!(nameHan.test(inputVal))) {
					alert("이름에 한글을 사용해 주시길 바랍니다.")
					check = false;
				}

				checkBoxArr.push($(this).val());
				editRankArr.push(inputVal);
			});

			if(check==false) {
				alert('수정이 취소되었습니다.');
				return false;
			}

			$.ajax({
				url : "${root}/organization/management/rank/edit",
				type : "POST",
				traditional : true,
				dataType : "JSON",
				async : false,
				cache: false,
				data : {
					checkBoxArr : checkBoxArr,
					editRankArr : editRankArr
				},
				success : function(jsonStr) {
					
					alert(jsonStr);
					window.location.href = "${root}/organization/management/position";

				},
				error : function() {
				alert("직위 수정에 실패하였습니다. 다시 시도해보시길 바랍니다.");
			
				}

			});
		}
	</script>

	<script>

		function deleteRank() {

			const checkBoxArr = [];
			const check = true;

			$('input:checkbox[name=rankCode]:checked').each(function(){
				checkBoxArr.push($(this).val());
			});

			const result = window.confirm("정말로 삭제하시겠습니까?");
			 if(result==false) {
				alert('삭제가 취소되었습니다.');
				return false;
			}
			$.ajax({
				url : "${root}/organization/management/rank/delete",
				type : "POST",
				traditional : true,
				dataType : "JSON",
				async : false,
				cache: false,
				data : {
					checkBoxArr : checkBoxArr
				},
				success : function(jsonStr) {
					
					alert(jsonStr);
					window.location.href = "${root}/organization/management/position";

				},
				error : function() {
				alert("직위 삭제에 실패하였습니다. 다시 시도해보시길 바랍니다.");
				}

			});


		}

	</script>


	<script>

		function writeThis(e) {

			const value = $(e).attr('data-value');
			$('#editJobName').attr("value", value);
			$('#editJobName').attr('data-value', value);

			$('#edit-job-modal').modal();
		}	
	</script>

	<script>
		function addJob() {

			const jobName = $('#jobNameInput').val();
			const jobSpe = jobName.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

			const nameHan = /^[ㄱ-ㅎ|가-힣]+$/;

			 	
			if(jobSpe.length > 10){
				alert("직무명은 10글자 이내로 작성해주시길 바랍니다.");
				return false;
			}else if(jobName.search(/\s/) != -1){
				alert("직위명은 공백 없이 입력해주시길 바랍니다.");
				return false;
			}else if(!(nameHan.test(jobName))) {
				alert("이름에 한글을 사용해 주시길 바랍니다.")
				return false;
			}

			const result = window.confirm("직무를 추가하시겠습니까?");
			if(result==false) { 
				alert('추가가 취소되었습니다.');
				return false;
			}
			$.ajax({
				url : "${root}/organization/management/job/add",
				type : "POST",
				traditional : true,
				dataType : "JSON",
				async : false,
				cache: false,
				data : {
					jobName : jobName
				},
				success : function(jsonStr) {
					
					alert(jsonStr);
					window.location.href = "${root}/organization/management/position";

				},
				error : function() {
				alert("직무 추가에 실패하였습니다. 다시 시도해보시길 바랍니다.");
				}

			});

		}
	</script>

	<script>
		function editJob() {

			const jobName = $('#editJobName').val();
			const previousName = $('#editJobName').attr('data-value');

			

			if(jobName == previousName) {
				alert('직무명이 이전과 같습니다. 수정하여 주시길 바랍니다.');
				return false;
			}


			const jobSpe = jobName.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 
			const nameHan = /^[ㄱ-ㅎ|가-힣]+$/;

			 	
			if(jobSpe.length > 10){
				alert("직무명은 10글자 이내로 작성해주시길 바랍니다.");
				return false;
			}else if(jobName.search(/\s/) != -1){
				alert("직위명은 공백 없이 입력해주시길 바랍니다.");
				return false;
			}else if(!(nameHan.test(jobName))) {
				alert("이름에 한글을 사용해 주시길 바랍니다.")
				return false;
			}


			const result = window.confirm("직무를 수정하시겠습니까?");
			if(result==false) { 
				alert('수정이 취소되었습니다.');
				return false;
			}

			$.ajax({

				url : "${root}/organization/management/job/edit",
				type : "POST",
				traditional : true,
				dataType : "JSON",
				async : false,
				cache: false,
				data : {
					jobName : jobName,
					previousName : previousName
				},
				success : function(jsonStr) {
					
					alert(jsonStr);
					window.location.href = "${root}/organization/management/position";

				},
				error : function() {
				alert("직무 수정에 실패하였습니다. 다시 시도해보시길 바랍니다.");
				}

			});

		}
	</script>

	<script>
		function deleteJob() {

			const jobName = $('#editJobName').val();

			const result = window.confirm("직무를 삭제하시겠습니까?");
			if(result==false) { 
				alert('삭제가 취소되었습니다.');
				return false;
			}
			$.ajax({
				url : "${root}/organization/management/job/delete",
				type : "POST",
				traditional : true,
				dataType : "JSON",
				async : false,
				cache: false,
				data : {
					jobName : jobName
				},
				success : function(jsonStr) {
					
					alert(jsonStr);
					window.location.href = "${root}/organization/management/position";

				},
				error : function() {
				alert("직무 삭제에 실패하였습니다. 다시 시도해보시길 바랍니다.");
				}

			});

		}
	</script>

	

	

</body>
</html>
