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

#search-icon {
  width: 34px;
  height: 34px;
  margin: none;
  padding: none;
}

#search-wrap {
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
  width: 100%;
  height: 5vh;
  margin: 0px 10px 10px 0px;
}

#search-container {
  width: 16%;
}

#search-bar {
  border-radius: 5px;
  border : 1px solid lightgray;
}

#search-wrap {
  margin : 0px 10px 5px 10px;
}

.profile-wrap {
  margin: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.profile-texts-wrap {
  margin-top: 20px;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  width: 85%;
}

.flex-items {
  height: 38px;
  display: grid;
  grid-template-columns: 1fr 2fr;
  align-items: center;
  justify-items: center;
}

.flex-items:hover {
  background-color: rgb(248, 249, 250);
}

.preview-img:hover {
  cursor: pointer;
}

#option-area {
  width: 80%;
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

#checkNum-area {
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  padding-top: 11px;
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
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                  <div id="search-wrap">
                    <div id="search-container">
                      <form action="${root}/organization/management/emp/1" method="post">
                        <div id="search-bar-wrap">
                          <input type="text" id="search-bar" class="style-none shadow" placeholder="임직원 검색" name="empData"> 
                        </div>
                        <div id="search-icon-wrap">
                          <input type="image" name="submit" id="search-icon" src="${root}/resources/img/search.png" onclick="return checkBlank();">
                        </div>
                      </form>
                    </div>
                    <div id="option-area">
                      <div id="checkNum-area" class="fade">
                      
                      </div>
                      <div id="option-button-area" class="fade">
                        <button type="button" class="btn shadow">직위 변경</button>
                        <button type="button" class="btn shadow">직무 변경</button>
                        <button type="button" class="btn shadow">부서 변경</button>
                        <button type="button" class="btn shadow">상태 변경</button>
                        <button type="button" class="btn shadow">프로필 변경</button>
                      </div>
                    </div>
                  </div>
                  <table class="table table-borderless table-hover">
                    <thead>
                      <tr>
                        <th>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="all" onchange="readCheckNum();">
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
                            <input type="checkbox" class="custom-control-input" id="${empList.empCode}" name="check" onchange="readCheckNum();">
                            <label class="custom-control-label" for="${empList.empCode}"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <a data-toggle="modal" href="#emp-profile-${empList.empCode}"><img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle" ></a>
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
                <c:if test = "${pv.currentPage ne 1}">
                	<li class="page-item">
                    <a class="page-link" href="${root}/organization/management/emp/${pv.currentPage-1}" class="btn btn-primary btn-sm">이전</a>
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
				<c:if test = "${pv.currentPage ne pv.maxPage}">
                	<li class="page-item">
						<a class="page-link" href="${root}/organization/management/emp/${pv.currentPage+1}" class="btn btn-primary btn-sm">다음</a>
					</li>
				</c:if>
                 </ul>
              </nav>
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
        
        
        
        
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

                <input type="submit"class="btn mb-2 btn-primary" value="저장" onclick="checkData();">
                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
              </div>

            </div>
          </div>
        </div>
      </form>  
    </div>

    <c:forEach items="${empList}" var="empList">
	
      <div class="modal fade" id="emp-profile-${empList.empCode}" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="verticalModalTitle">임직원 상세정보</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body profile-wrap"> 
                <div class="profile-img-wrap">
                  <div class="avatar avatar-xl">
                    <label for="file-input">
                      <img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle preview-img" id="preview-img">
                    </label>
                    <input id="file-input" class="input-img" type="file" style="display:none;" onchange="readURL(this);">
                    </div>
                </div>
                <div class="profile-texts-wrap">
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>이름</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.empName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>사번</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.empCode}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>아이디</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.empId}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>비밀번호</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-pwd-area">******</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>직위</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-rank-area">${empList.rankName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>직무</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-job-area">${empList.jobName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>소속</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-dept-area">${empList.deptName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>생년월일</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-birthday-area">${empList.empBirthday}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>사내전화</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-tel-area">${empList.empTel}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>휴대전화</strong></p>
                    </div>
                    <div>
                      <p class="mb-0"  class="modal-phone-area">${empList.empPhone}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>e-mail</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-email-area">${empList.empEMail}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>자택주소1</strong></p>
                    </div>
                    <div>
                      <p class="mb-0"  class="modal-addr1-area">${empList.empAddress1}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>자택주소2</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-addr2-area">${empList.empAddress2}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>입사일</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-joinDate-area">${empList.empJoinDate}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>진급일</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.empPromotionDate}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>기타정보</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-etc-area">${empList.empEtc}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted"><strong>권한</strong></p>
                    </div>
                    <div>
                      <p class="mb-0">${empList.rightName}</p>
                    </div>
                  </div>
                  <div class="flex-items">
                    <div>
                      <p class="mb-0 text-muted" ><strong>재직상태</strong></p>
                    </div>
                    <div>
                      <p class="mb-0" class="modal-right-area">${empList.empStatus}</p>
                    </div>
                  </div>
      
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn mb-2 btn-primary">저장</button>
                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
              </div>
            </div>
          </div>
        </div>
      
    </c:forEach>

    
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

  <script>
      
    const searchBar = $("#search-bar");
    
    function checkBlank() {

      if(searchBar.val() === "") {
        alert("검색창에 글자를 입력하여 주시길 바랍니다.");
        return false;
      } else {
        return true;
      }
    }

  </script>
  
  <script>
    
    function readCheckNum() {
        const checkNum = $("input:checkbox[name='check']:checked").length;
        const checkNumArea = $("#checkNum-area");
        const buttons = $("#option-button-area");

        checkNumArea.removeClass("fade");
        checkNumArea.html("<p>"+"check : "+checkNum+"</p>");
        buttons.removeClass("fade");


        var total = $("input[name=check]").length;
        var checked = $("input[name=check]:checked").length;
        if(checked==0) {
          buttons.addClass("fade");
          checkNumArea.addClass("fade");
        }
    }
      
  </script>

		

</body>
</html>