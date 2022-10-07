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
	         <span> 전체 삭제</span>
	       </div>
        <div class="card shadow">
          <div class="card-body">
            <!-- <h5 class="card-title">Simple Table</h5> -->
            <!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>문서종류</th>
                  <th>제목</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>품의서</td>
                  <td>품의서_임시저장</td>
                </tr>
                <tr>
                  <td>지출결의서</td>
                  <td>지출결의서_임시저장</td>
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