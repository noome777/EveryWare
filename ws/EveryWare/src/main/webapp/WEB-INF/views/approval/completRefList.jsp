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
	           <option value="0" selected>전체</option>
	           <c:forEach items="${formList}" var="f">
                  <option value="${f.formCode}">${f.formName}</option>
                </c:forEach>
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
              	<c:forEach items="${docList}" var="d">
	                <tr onclick="location.href='${root}/approval/approvalDocDetail/${d.docCode}'">
	                  <td>${d.docCode}</td>
	                  <td>${d.formName}</td>
	                  <td>${d.docTitle}</td>
	                  <td>${d.empName}</td>
	                  <td>${d.docEnrollDate}</td>
	                  <%-- <c:choose>
	                  	<c:when test="">
		                  <td>진행중</td>
	                  	</c:when>
	                  	<c:when test="">
		                  <td>완료</td>
	                  	</c:when>
	                  </c:choose> --%>
	                </tr>
              	</c:forEach>
              </tbody>
            </table>
            
            <nav aria-label="Table Paging" class="my-3">
              <ul class="pagination justify-content-center mb-0">
              	<c:if test="${pv.startPage ne 1}">
            	    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                </c:if>
                
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                	<li class="page-item"><a class="page-link" href="${root}/approval/progressList/${i}">${i}</a></li>
                </c:forEach>
<!--                 <li class="page-item active"><a class="page-link" href="#">1</a></li> -->
                
                <c:if test="${pv.endPage ne pv.maxPage}">
           	     <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </c:if>
              </ul>
            </nav>

          </div>
        </div>
	</main>
   
  <script>
    $('#custom-select').on('change', function () {
      let docFormCode = $('#custom-select option:selected').val();
      location.href='${root}/approval/progressWaitList/1/' + docFormCode;
    })
  </script>
</body>
</html>