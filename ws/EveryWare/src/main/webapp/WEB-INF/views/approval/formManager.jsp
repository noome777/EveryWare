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
		<a href="${root}/approval/formInsert">양식 생성</a>
	    <!-- simple table -->
        <div class="card shadow">
          <div class="card-body">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>양식번호</th>
                  <th>양식명</th>
                  <th>사용</th>
                </tr>
              </thead>
              <tbody>
                <tr onclick="location.href='${root}/approval/formManagerDetail'">
                  <td>1</td>
                  <td>품의서</td>
                  <td>사용</td>
                </tr>
                <tr>
                  <td>2</td>
                  <td>지출결의서</td>
                  <td>사용</td>
                </tr>
                <tr>
                  <td>3</td>
                  <td>업무연락</td>
                  <td>사용</td>
                </tr>
                <tr>
                  <td>4</td>
                  <td>기업용 공문</td>
                  <td>사용</td>
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