<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리</title>

<style>


.card-wrap {
    
    margin-top: 45px;
    margin-left: 10px;
}

.grid-col {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.grid-col > * {
  margin-right: 15px;
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


#option-area {
  width: 80%;
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

#checkNum-area {
  width: 5%;
  height: 100%;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  padding-bottom: 5px;
}

#option-button-area {
  width: 95%;
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding-bottom: 8px;
  margin: 10px;
}

#option-button-area > button {
  margin-left: 10px;
  border-radius: 5px;
}

.hide-input{
	border:none;
	border-right:0px;
	border-top:0px;
	boder-left:0px; 
	boder-bottom:0px;
	text-align: center;
  color : gray;
  height: 34px;
}

.hide-select {
	border-style: none;
}

#search-body {
  width: 200px;
  height: 200px;
  display: flex;
  flex-direction: row;
  align-items: center;
  margin: auto;
}

#search-icon {
  width: 34px;
  height: 34px;
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
              <div class="row align-items-center my-3 margin">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">권한 관리</h2>
                </div>
              </div>
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                  <div id="search-wrap">
                    <div id="search-container">
                        <div id="search-bar-wrap">
                          <button type="button" class="btn shadow " data-toggle="modal" data-target="#addAdmin">
                            <small>관리자 추가</small>
                          </button>
                          </div>
                        </div>
                    </div>
                  </div>
                  <table class="table table-borderless table-hover">
                    <thead>
                      <tr>
                      	<th></th>
                      	<th></th>
                        <th>프로필</th>
                        <th>이름(사번)</th>
                        <th>ID</th>
                        <th>직위</th>
                        <th>소속</th>
                        <th>권한</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adminList}" var="adminList">
                      <tr>
                      	<td></td>
                        <td></td>
                        <td>
                          <div class="avatar avatar-sm">
                            <c:choose>
                              <c:when test="${empty adminList.empProfileName}">
                           	 		<img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle ${adminList.empCode}-profile" >
                           	  </c:when>
                           	  <c:otherwise>
                           	   	<img src="${root}/resources/upload/profile/${adminList.empProfileName}" alt="..." class="avatar-img rounded-circle ${adminList.empCode}-profile" >
                           	  </c:otherwise>
                           	</c:choose>
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">
                          	<strong>${adminList.empName}</strong>
                          </p>
                          <small class="mb-0 text-muted">${adminList.empCode}</small>
                        </td>
                        
                        <td>
                          <p class="mb-0 text-muted">
                         	 <a href="#" class="text-muted">${adminList.empId}</a>
                          </p>
                        </td>
                        <td >
                          <p class="mb-0 text-muted ${adminList.empCode}-rank">${adminList.rankName}</p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted ${adminList.empCode}-dept">${adminList.deptName}</p>
                        </td>
                        <td>
                        	<p class="mb-0 text-muted ${adminList.empCode}-right">${adminList.rightName}</p>
                        </td>
                        <td>
                          <c:if test="${adminList.rightName ne '관리자'}">
                            <button class="btn shadow delete-btn" value="${adminList.empCode}">삭제</button>
                          </c:if>
                        </td>
                       
                      </tr>
                      </c:forEach>
                      
                      
                      
                    </tbody>
                  </table>
                </div>
              </div>
              
              
                  
            </div>
          </div>
        </div>
      </main> <!-- main -->
		</div>

    <!-- 관리자 추가 모달 -->
    <div class="modal fade" id="addAdmin" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" >관리자 추가</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body"> 
            <div id="search-body">
                <input type="text" id="search-bar" class="hide-input shadow" placeholder="임직원 검색" name="empData"> 
                <input type="image" name="submit" id="search-icon" src="${root}/resources/img/search.png" onclick="return checkBlank();">

            </div>
          </div>  
          <div class="modal-footer">
            <button type="button" class="btn mb-2 btn-primary" onclick="changeJob();">변경</button>
            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">취소</button>
          </div>
        </div>
      </div>
    </div>


    <!-- 삭제버튼 클릭 시 해당 관리자 사번 가져옴 -->
    <script>
      $(document).ready(function() {
          $('.delete-btn').click(function() {
            var value= $(this).val();
            console.log(value);
          })
      });
    </script>

		

</body>
</html>