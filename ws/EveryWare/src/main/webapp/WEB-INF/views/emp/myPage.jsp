<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 
 	.content-wrap {
		height : 85vh;
		justify-content: center;
		align-content: center;
		
	}
	.content-wrap > div {
		border-radius: 5px;
		background-color: white;
		width:100%;
		height : 100%;
	}

	.style-none {
		border : none;
		border : 0px 0px 0px 0px;
		border-radius: 5px;
	}
	
	#profile-wrap {
		display: grid;
		grid-template-columns: 40% 60%;
		grid-row: 100%;
		border-radius: 10px;
	}

	#profile-img-wrap {
		display: grid;
		grid-template-rows: 80% 20%; 
	}

	#profile-img-area{
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items :center;
	}

	
	
	.profile-button {
		border : 1px solid gray;
		margin: 10px;
	}

	#profile-buttons-area {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: flex-start;
	}
	
	#profile-info-wrap {
		display : flex;
		justify-content : center;
		align-items : center;
		width : 100%;
		height : 100%;
	}
	
	#profile-info-area {
		width : 90%;
		height : 82%;
		display: grid;
		grid-template-rows: repeat(16,45px);
		grid-template-columns: 15% 85%;
		border-radius: 5px;
	}


	.rowName {
		display: flex;
		justify-content: center;
		align-items: center;
	}

	.rowValue {
		display: flex;
		flex-direction: column;
		justify-content: center;
		padding-left: 20px;
		width: 50%;
	}

	.no-style-input {
		border:none;
		border-right:0px;
		border-top:0px;
		boder-left:0px; 
		boder-bottom:0px;
		width: 70%;
		color : gray;
	}
	


	
	
	
	
 </style>

</head>
<body class="vertical  light">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    <form action="${root}/emp/myPage" method="POST">
	<div class="wrapper">
	    <main role="main" class="main-content">
		    <div class="container-fluid">
		        <div class="row justify-content-center">
		        <div class="col-12">
		            <div class="row align-items-center my-3">
                		<div class="col">
                			<h2 class="h3 mb-0 page-title">마이 페이지</h2>
                		</div>
                	</div>
					<div class="card-body content-wrap mb-4 ">
						<div id="profile-wrap" class="shadow tab-content">
						
							<div id="profile-img-wrap">

								<div id="profile-img-area">
									<img id="profile-img" alt="프로필 사진" src="${root}/resources/img/guest.png" class="class="avatar-img rounded-circle"">
								</div>
								<div id="profile-buttons-area">
									<button type="submit" id="submit-button" class="btn shadow profile-button" onclick="return checkBlank();">
										<span class="fe fe-check fe-12 mr-2"></span>
										저장
									</button>
									<button type="button" id="return-button" class="btn shadow profile-button" onclick="history.back();">
										<span class="fe fe-corner-down-left fe-12 mr-2"></span>
										뒤로가기</button>
								</div>
							</div>
							<div id="profile-info-wrap">

								<div id="profile-info-area">

									<div class="rowName">
										<strong>이름</strong>
									</div>
									<div class="rowValue">
										${loginMember.empName}
									</div>
									<div class="rowName">
										<strong>사번</strong>
									</div>
									<div class="rowValue">
										${loginMember.empCode}
									</div>
									<div class="rowName">
										<strong>아이디</strong>
									</div>
									<div class="rowValue">
										${loginMember.empId}
									</div>
									<div class="rowName">
										<strong>비밀번호</strong>
									</div>
									<div class="rowValue">
										<input type="password" class="no-style-input" name="empPwd" placeholder="${loginMember.empEMail.legth()}" >
									</div>
									<div class="rowName">
										<strong>직위</strong>
									</div>
									<div class="rowValue">
										${loginMember.rankCode}
									</div>
									<div class="rowName">
										<strong>직무</strong>
									</div>
									<div class="rowValue">
										${loginMember.jobName}
									</div>
									<div class="rowName">
										<strong>소속</strong>
									</div>
									<div class="rowValue">
										${loginMember.deptName}
									</div>
									<div class="rowName">
										<strong>생년월일</strong>
									</div>
									<div class="rowValue">
										${loginMember.empBirthday}
									</div>
									<div class="rowName">
										<strong>사내전화</strong>
									</div>
									<div class="rowValue">
										<input type="tel" class="no-style-input" name="empTel" value="${loginMember.empTel}" placeholder="${loginMember.empTel}" >
									</div>
									<div class="rowName">
										<strong>휴대전화</strong>
									</div>
									<div class="rowValue">
										<input type="tel" class="no-style-input" name="empPhone" value="${loginMember.empPhone}" placeholder="${loginMember.empPhone}" >
									</div>
									<div class="rowName">
										<strong>e-mail</strong>
									</div>
									<div class="rowValue">
										<input type="email" class="no-style-input" name="empEMail" value="${loginMember.empEMail}" placeholder="${loginMember.empEMail}" >
									</div>
									<div class="rowName">
										<strong>자택주소1</strong>
									</div>
									<div class="rowValue">
										<input type="text" class="no-style-input" name="empAddress1" value="${loginMember.empAddress1}" placeholder="${loginMember.empAddress1}" >
									</div>
									<div class="rowName">
										<strong>자택주소2</strong>
									</div>
									<div class="rowValue">
										<input type="text" class="no-style-input" name="empAddress2" value="${loginMember.empAddress2}" placeholder="${loginMember.empAddress2}" >

									</div>
									<div class="rowName">
										<strong>입사일</strong>
									</div>
									<div class="rowValue">
										${loginMember.empJoinDate}
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
	</form>
	

</body>
</html>