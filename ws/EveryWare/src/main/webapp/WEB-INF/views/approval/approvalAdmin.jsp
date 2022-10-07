<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
  .card{
    margin: 10px 30px;
  }
  .form-group{
    width: 150px;
    margin-left: 30px;
  }
  .pagination{
  	margin-top: 60px;
  }
</style>
</head>
<body class="vertical  light  ">
  
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
   	<main role="main" class="main-content">

	    <!-- simple table -->
	       <div class="form-group mb-3">
	         <span> 관리자 편집</span>
	       </div>
        <div class="card shadow">
          <div class="card-body">
            <!-- <h5 class="card-title">Simple Table</h5> -->
            <!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>이름</th>
                  <th>아이디</th>
                  <th>소속부서</th>
                  <th>관리자 등록일</th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>고은비</td>
                  <td>eunbi1</td>
                  <td>인사팀</td>
                  <td>2022.10.03</td>
                  <td>삭제</td>
                </tr>
                <tr>
                  <td>고금비</td>
                  <td>eunbi2</td>
                  <td>재무팀</td>
                  <td>2022.10.03</td>
                  <td>삭제</td>
                </tr>
              </tbody>
            </table>
            
            <nav aria-label="Table Paging" class="my-3">
              <ul class="pagination justify-content-center mb-0">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
              </ul>
            </nav>

          </div>
        </div>
	</main>
   
</body>
</html>