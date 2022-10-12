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
	         <select class="custom-select" id="custom-select">
	           <option selected>전체</option>
	           <option value="1">품의서</option>
	           <option value="2">지출결의서</option>
	           <option value="3">업무연락</option>
	           <option value="4">기업용 공문</option>
	         </select>
	       </div>
        <div class="card shadow">
          <div class="card-body">
            <!-- <h5 class="card-title">Simple Table</h5> -->
            <!-- <p class="card-text">With supporting text below as a natural lead-in to additional content.</p> -->
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>문서번호</th>
                  <th>문서종류</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>작성일</th>
                  <th>구분</th>
                </tr>
              </thead>
              <tbody>
                <tr onclick="location.href='${root}/approval/approvalDocDetail'">
                  <td>1</td>
                  <td>품의서</td>
                  <td>220928_결재_품의</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                  <td><span class="badge badge-pill badge-warning">진행중</span></td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>지출결의서</td>
                  <td>220928_결재_지출결의서</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                  <td><span class="badge badge-pill badge-success">완료</span></td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>지출결의서</td>
                  <td>220928_결재_지출결의서</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                  <td><span class="badge badge-pill badge-warning">진행중</span></td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>업무연락</td>
                  <td>220928_결재_업무연락</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                  <td><span class="badge badge-pill badge-danger">삭제</span></td>
                </tr>
                <tr>
                  <td>5</td>
                  <td>기업용 공문</td>
                  <td>220928_결재_기업용 공문</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                  <td><span class="badge badge-pill badge-success">완료</span></td>
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