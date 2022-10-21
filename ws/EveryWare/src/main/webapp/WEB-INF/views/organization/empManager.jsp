<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 정보</title>

<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">


<style>


.card-wrap {
    
  margin-top: 45px;
  margin-left: 10px;
}

#add-modal-wrap {
  display: grid;
  margin: 15px;
  grid-template-columns: 30% 70%;
  grid-template-rows: repeat(7, 40px);
  gap: 10px;
  
}

#add-modal-wrap > div {
  display: flex;
  justify-content: center;
  align-items: center;
}

#add-modal-wrap input {
  border: 1px solid lightgray;
  border-radius: 5px;
  width: 80%;
}
#add-modal-wrap select {
  border: 1px solid lightgray;
  border-radius: 5px;
  width: 80%;
}

.grid-col {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.grid-col > * {
  margin-right: 15px;
}

#search-wrap {

display: flex;
justify-content: center;
align-items: center;
width: 100%;
height: 100%;

}

#search-container {
width: 85%;
height: 55%;
border-radius: 5px;
/* border : 1px solid lightgray;*/
display: flex;
}

#search-container > form {
width: 100%;
height: 100%;
display: grid;
grid-template-columns: 4fr 1fr;
}

#search-icon-wrap {
width: 100%;
height: 100%;
display: flex;
flex-direction: column;
justify-content: center;
align-items: center;
}

#search-bar-wrap {
width: 100%;
height: 100%;
}

#search-bar {
width: 100%;
height: 100%;
padding: 10px;
}

.has-success {
  color: darkblue;
}

.has-error {
  color: red;
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
                  <h2 class="h3 mb-0 page-title">임직원 관리</h2>
                </div>
                <div class="col-auto">
                  <button type="button" class="btn shadow mb-2" data-toggle="modal" data-target=".modal-right"><span class="fe fe-user-plus fe-12 mr-2" ></span>사용자 추가</button>
                </div>
                
              </div>

              <!--검색바-->
              <!--<div id="search-wrap">
								<div class="shadow" id="search-container">
									<form action="${root}/organization/info" method="post">
										<div id="search-bar-wrap">
											<input type="text" id="search-bar" class="style-none" placeholder="임직원 검색" name="word"> 
										</div>
										<div id="search-icon-wrap">
											<input type="image" name="submit" id="search-icon" src="${root}/resources/img/search.png">
										</div>
									</form>
								</div>
							</div> -->
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                  <table class="table table-borderless table-hover">
                    <thead>
                      <tr>
                        <th>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="all">
                            <label class="custom-control-label" for="all"></label>
                          </div>
                        </th>
                        <th>프로필</th>
                        <th>이름(사번)</th>
                        <th>ID</th>
                        <th>직위</th>
                        <th>소속</th>
                        <th>직무</th>
                        <th>사내전화</th>
                        <th>휴대전화</th>
                        <th>이메일</th>
                        <th>입사일</th>
                        <th>상태</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${empList}" var="empList">
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="${empList.empCode}" name="check">
                            <label class="custom-control-label" for="${empList.empCode}"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>${empList.empName}</strong></p>
                          <small class="mb-0 text-muted">${empList.empCode}</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">${empList.empId}</a></p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">${empList.rankName}</p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">${empList.deptName}</p>
                        </td>
                    
                        <td>
                        	<p class="mb-0 text-muted">${empList.jobName}</p>
                        </td>
                        <td class="text-muted"><p class="mb-0 text-muted"><a href="#" class="text-muted">${empList.empTel}</a></p></td>
                        <td><p class="mb-0 text-muted"><a href="#" class="text-muted">${empList.empPhone}</a></p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">${empList.empEMail}</a></p>
                        </td> 
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">${empList.empJoinDate}</a></p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">
                          <c:if test="${empList.empStatus eq 'N'}">
                          <a href="#" class="text-muted">일반</a>
                          </c:if>
                          <c:if test="${empList.empStatus eq 'R'}">
                          <a href="#" class="text-muted">휴직</a>
                          </c:if>
                          </p>
                        </td>
                      </tr>
                      </c:forEach>
                      
                      
                      
                    </tbody>
                  </table>
                </div>
              </div>
              <nav aria-label="Table Paging" class="my-3">
                <ul class="pagination justify-content-end mb-0">
                <c:if test = "${pv.startPage ne 1}">
                	<li class="page-item">
                    <a class="page-link" href="${root}/organization/management/emp/${pv.startPage-1}" class="btn btn-primary btn-sm">이전</a>
                  </li>
                </c:if>
              <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                <c:choose>
                  <c:when test="${i eq pv.currentPage}">
                    <li class="page-item active">
                      <a class="page-link" href="${root}/organization/management/emp/${i}">${i}</a>
                    </li>
                  </c:when>
                  <c:otherwise>
                    <li class="page-item">
                      <a class="page-link" href="${root}/organization/management/emp/${i}">${i}</a>
                    </li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
				<c:if test = "${pv.startPage ne pv.maxPage}">
                	<li class="page-item">
						<a class="page-link" href="${root}/organization/management/emp/${pv.startPage+1}" class="btn btn-primary btn-sm">다음</a>
					</li>
				</c:if>
                 </ul>
              </nav>
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
        
        
        
        <div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body px-5">
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-success justify-content-center">
                      <i class="fe fe-cpu fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Control area</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-activity fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Activity</p>
                  </div>
                </div>
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-droplet fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Droplet</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Upload</p>
                  </div>
                </div>
                <div class="row align-items-center">
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-users fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Users</p>
                  </div>
                  <div class="col-6 text-center">
                    <div class="squircle bg-primary justify-content-center">
                      <i class="fe fe-settings fe-32 align-self-center text-white"></i>
                    </div>
                    <p>Settings</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main> <!-- main -->
		</div>


    <div class="modal fade modal-right modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
      <form action="${root}/organization/management/emp/add" method="post">
        <div class="modal-dialog modal-sm" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="defaultModalLabel">사용자 추가</h5>
            </div>
            <div class="modal-body"> 
              
              <div id="add-modal-wrap">
                <div>이름</div>
                <div><input type="text" id="emp-name" placeholder="사용자 이름" name="empName"></div>
                <div>아이디</div>
                <div><input type="text" id="emp-id" placeholder="아이디" name="empId"></div>
                <div>비밀번호</div>
                <div>
                  <input id="emp-pwd" type="password" placeholder="비밀번호" name="empPwd" >
                  <i class="fa-solid fa-eye"></i>
                </div>
                <div>부서</div>
                <div>
                  <select name="deptCode" id="dept-select">
                    <c:forEach items="${deptList}" var="deptList">
                    	<option value="${deptList.deptCode}">${deptList.deptName}</option>
                    </c:forEach>
                  </select> 
                </div>
                <div>직위</div>
                <div> 
                  <select name="rankCode" id="rank-select">
                    <c:forEach items="${rankList}" var="rankList">
                    	<option value="${rankList.rankCode}">${rankList.rankName}</option>
                    </c:forEach>
                  </select> 
                </div>
                <div>직무</div>
                <div>
                  <select name="empJobCode" id="job-select">
                    <c:forEach items="${jobList}" var="jobList">
                    	<option value="${jobList.jobCode}">${jobList.jobName}</option>
                    </c:forEach>
                  </select> 
                </div>
                </div>
              </div>
              <div class="grid-col">

                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
                <input type="submit"class="btn mb-2 btn-primary" value="저장" onclick="checkData();">
              </div>

            </div>
          </div>
        </div>
      </form>  
    </div>

    
    <!--체크박스 전부체크-->
  <script>
    $(document).ready(function() {
      $("#all").click(function() {
        if($("#all").is(":checked")) $("input[name=check]").prop("checked", true);
        else $("input[name=check]").prop("checked", false);
      });

      $("input[name=check]").click(function() {
        var total = $("input[name=check]").length;
        var checked = $("input[name=check]:checked").length;

        if(total != checked) $("#all").prop("checked", false);
        else $("#all").prop("checked", true); 
      });
    });
  </script>

  <!--아이디, 비밀번호, 이름 체크-->

  <!--아이디 중복체크-->
    <script>

      function checkData(){

        const id = $("#emp-id").val();
        const idNum = id.search(/[0-9]/g);
        const idEng = id.search(/[a-z]/ig);;
        const idSpe = id.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        const pwd = $("#emp-pwd").val();
        const pwdNum = pwd.search(/[0-9]/g);
        const pwdEng = pwd.search(/[a-z]/ig);
        const pwdSpe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

        const name = $("#emp-name").val();
        const nameHan = /^[ㄱ-ㅎ|가-힣]+$/;

      //비밀번호
        if(pwd.length < 8 || pwd.lengthd > 20){
          alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
          return false;
        }else if(pwd.search(/\s/) != -1){
          alert("비밀번호는 공백 없이 입력해주세요.");
          return false;
        }else if( (pwdNum < 0 && pwdEng < 0) || (pwdEng < 0 && pwdSpe < 0) || (pwdSpe < 0 && pwdNum < 0) ){
          alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
          return false;
        }else if (id.length < 5 || id.length >20) {
          alert("아이디는 5자리 ~ 20자리 이내로 입력해주세요.");
          return false;
        }else if (id.search(/\s/) != -1) {
          alert("아이디는 공백 없이 입력해주세요.");
          return false;
        }else if ((idNum < 0 && idEng < 0)) {
          alert("아이디는 영문,숫자를 조합하여 입력해주세요.");
          return false;
        }else if(name.length<2 || name.length>5) {
          alert("이름은 2글자 이상, 5글자 이하로 입력해주세요.");
          return false;
        } else if (name.search(/\s/) != -1) {
          alert("이름은 공백 없이 입력해주세요.");
          return false;
        } else if(!(nameHan.test(name))) {
          alert("이름에 한글을 사용해 주시길 바랍니다.")
          return false;
        }else {
        	return true;
        }

      }

    </script>

		

</body>
</html>