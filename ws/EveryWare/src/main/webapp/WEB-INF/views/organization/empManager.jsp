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
                        <th>이름</th>
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
      <form action="">
        <div class="modal-dialog modal-sm" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="defaultModalLabel">사용자 추가</h5>
            </div>
            <div class="modal-body"> 
              
              <div id="add-modal-wrap">
                <div>이름</div>
                <div><input type="text" placeholder="사용자 이름"></div>
                <div>아이디</div>
                <div><input type="text" placeholder="아이디"></div>
                <div>비밀번호</div>
                <div>
                  <input type="password" placeholder="비밀번호">
                  <i class="fa-solid fa-eye"></i>
                </div>
                <div>직위</div>
                <div> 
                  <select name="" id="">
                    <option value=""></option>
                  </select> 
                </div>
                <div>직무</div>
                <div>
                  <select name="" id="">
                    <option value=""></option>
                  </select> 
                </div>
                <div>부서</div>
                <div>
                  <select name="" id="">
                    <option value=""></option>
                  </select> 
                </div>
                </div>
              </div>
              <div class="grid-col">

                <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
                <input type="submit"class="btn mb-2 btn-primary" value="저장">
              </div>

            </div>
          </div>
        </div>
      </form>  
    </div>

    <script>
      $(document).ready(function(){
        $('.main i').on('click',function(){
            $('input').toggleClass('active');
            if($('input').hasClass('active')){
                $(this).attr('class',"fa fa-eye-slash fa-lg")
                .prev('input').attr('type',"text");
            }else{
                $(this).attr('class',"fa fa-eye fa-lg")
                .prev('input').attr('type','password');
            }
          });
      });
    </script>

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
  

		

</body>
</html>