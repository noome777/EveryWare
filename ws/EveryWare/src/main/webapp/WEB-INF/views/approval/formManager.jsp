<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
    
    
    <main role="main" class="main-content">
		<a href="${root}/approval/formInsert" class="m-5">양식 생성</a>
	    <!-- simple table -->
        <div class="card shadow mt-2">
          <div class="card-body">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>양식번호</th>
                  <th>양식명</th>
                  <th>사용여부</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach items="${docFormList}" var="d">
	                <tr onclick="location.href='${root}/approval/formManagerDetail/${d.formCode}'">
	                  <td>${d.formCode}</td>
	                  <td>${d.formName}</td>
	                  <td>${d.formUseYn}</td>
	                </tr>
              	</c:forEach>
              </tbody>
            </table>
            
          </div>
        </div>
	</main>
    
</body>
</html>