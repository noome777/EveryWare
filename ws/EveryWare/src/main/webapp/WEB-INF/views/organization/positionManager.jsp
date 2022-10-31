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
	
	.hide-input{
		border:none;
		border-right:0px;
		border-top:0px;
		boder-left:0px; 
		boder-bottom:0px;
	 	 color : gray;
	 	border-radius : 8px;
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

						<div id="profile-wrap" class="shadow tab-content">

						
							
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
					<button type="button" class="btn mb-2 btn-danger" data-dismiss="modal" >삭제</button>
					</div>
				</div>
				</div>
			</div>

	  	</form>
	</c:forEach>

	
		

	<!--1. 직위명 중복체크-->
	<!--2. 직위명 문자열 검사-->

	<script>
		function editRank() {

			const checkBoxArr = [];
			const editRankArr = [];

			const check = true;

			$('input:checkbox[name=rankCode]:checked').each(function(){
				
				var inputVal = $(this).parents().next().children().val();

				var rankNum = inputVal.search(/[0-9]/g);
				var rankEng = inputVal.search(/[a-z]/ig);
				var rankSpe = inputVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi); 

				const nameHan = /^[ㄱ-ㅎ|가-힣]+$/;

			 	//비밀번호
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
				return false;
			}

			console.log(checkBoxArr);
			console.log(editRankArr);

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
					
					console.log(jsonStr);
					alert(jsonStr);
					//ㅋ

				},
				error : function() {
				alert("직위 수정에 실패하였습니다. 다시 시도해보시길 바랍니다.");
			
				}

			});
		}
	</script>

	

	

</body>
</html>
