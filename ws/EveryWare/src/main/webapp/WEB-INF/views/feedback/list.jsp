<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<body>

    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/feedback/sidemenu-content.jsp" %>

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
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>발신자</th>
                  <th>작성일</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>칭찬</td>
                  <td>참 잘했어요</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                </tr>
                <tr>
                  <td>칭찬</td>
                  <td>이런 점이 좋은 것 같아요</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                </tr>
                <tr>
                  <td>공유</td>
                  <td>같이 알면 좋을 것 같아요</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
                </tr>
                <tr>
                  <td>피드백</td>
                  <td>이런 점은 고쳐주세요</td>
                  <td>고은비</td>
                  <td>2022.09.08</td>
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