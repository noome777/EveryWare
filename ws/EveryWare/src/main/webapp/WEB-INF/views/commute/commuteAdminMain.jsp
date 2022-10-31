<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
<c:if test="${not empty alertMsg}">
    <script>
      alert('${alertMsg}');
    </script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 출퇴근 기록 조회</title>
<style>
.mb-0{
    margin-top: 20px;
}
#submit-btn{
    float: right;
}
#search-btn{
    float: right;
    margin-bottom: 80px;
    margin-top: -70px;
    margin-right: 30px;
}
.mb-5{
    float: right;
    margin: 30px;
    width: 80%;
}
#search-btn{
    float: right;
    margin-bottom: 80px;
    margin-top: -70px;
    margin-right: 20px;
}
#page-area{
  margin-left: 35%;
  margin-top: 5%;
}
#page-area>a{
  margin: 5px;
}
#no{
  border: none;
  border-right: 0px;
  border-top: 0px;
  border-left: 0px;
  border-bottom: 0px;
  width: 40px;
  height: 30px;
}
#name, #job{
  height: 25px;
}

   
</style>
</head>

    <div class="wrapper">
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/commute/admin-side.jsp" %>
     
    <!-- 출퇴근 기록 조회 -->

    <div class="card shadow mb-5" style="margin-top: 25px;">

      <div style="margin-left: 20px; margin-top: 20px;">
        <h4 class="card-title">출퇴근 기록 조회</h4><br><br>

        <form action="" method="post">
          <h5 class="card-title">사원명 검색</h5>
            <select id="jobCode" name="jobCode" id="">
              <option value="1">관리</option>
              <option value="2">기획</option>
              <option value="3">영업</option>
              <option value="4">생산</option>
              <option value="5">개발</option>
            </select>
          <input name="name" id="name" type="text" placeholder="사원명">
          <input  id="search" type="submit" value="검색">
          <br><br>
        </form>
    
        <%-- <c:if test="${empty adDateCount}">
	        <h6 class="card-title">조회 결과 ${adListCount} 건</h6>
        </c:if>  
        <c:if test="${empty adListCount}">
	        <h6 class="card-title">조회 결과  ${adDateCount} 건</h6>
        </c:if> --%>

      <!-- <form action="${root}/dayoff/sendApproval" method="post"> -->
        <table class="table table-hover">
          <thead>
            <tr>
              <th>일자</th>
              <th>부서 / 사원명</th>
              <th>출근시간</th>
              <th>퇴근시간</th>
              <th>근무시간</th>
              <th>근무상태</th>
            </tr>
          </thead>
          <tbody>
            <!-- <c:if test="${empty comDateList}"> -->
              <c:forEach items="${voList}" var="x" varStatus="vs">
                <tr>
                  <td>${x.enrollDate}</td>
                  <td>${x.ECode}</td>
                  <td>${x.startTimeFormat}</td>
                  <td>${x.endTimeFormat}</td>
                  <td>${x.workingTime}</td>
                  <c:if test="${x.comStatus == '조기퇴근'}">
                    <td><span class="badge badge-pill badge-warning">조기퇴근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '정상출근'}">
                    <td><span class="badge badge-pill badge-success">정상출근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '결근'}">
                    <td><span class="badge badge-pill badge-danger">결근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '지각'}">
                    <td><span class="badge badge-pill badge-warning">지각</span></td>
                  </c:if>
                </tr>
              </c:forEach> 
            <!-- </c:if>
            <c:if test="${empty comList}">
          		<c:forEach items="${comDateList}" var="y">
                <tr>
                  <td>${y.enrollDate}</td>
                  <td>${y.startTimeFormat}</td>
                  <td>${y.endTimeFormat}</td>
                  <td>${y.workingTime}</td>
                  <c:if test="${y.comStatus == '조기퇴근'}">
                    <td><span class="badge badge-pill badge-warning">조기퇴근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '정상출근'}">
                    <td><span class="badge badge-pill badge-success">정상출근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '결근'}">
                    <td><span class="badge badge-pill badge-danger">결근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '지각'}">
                    <td><span class="badge badge-pill badge-warning">지각</span></td>
                  </c:if>
                </tr>
              </c:forEach>
          	</c:if> -->
          </tbody>
        </table>
      <!-- </form> -->
      
        <!-- <c:if test="${y.offApproval == 'W'}">
            <td><span class="badge badge-pill badge-warning">결재대기중</span></td>
        </c:if>
        <c:if test="${y.offApproval == 'A'}">
            <td><span class="badge badge-pill badge-success">승인완료</span></td>
        </c:if>
        <c:if test="${y.offApproval == 'C'}">
            <td><span class="badge badge-pill badge-danger">반려</span></td>
        </c:if>

       
         <c:if test="${empty AdDateList && empty vo}">
          <div id="page-area">
            <c:if test="${pv.startPage ne 1}">
              <a href="${root}/dayoff/admin/${pv.startPage - 1}" class="btn mb-2 btn-primary"><</a>
            </c:if>
            <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
                <a href="${root}/dayoff/admin/${i}" class="btn mb-2 btn-primary">${i}</a>
            </c:forEach>
            <c:if test="${pv.endPage ne pv.maxPage }">
              <a href="${root}/dayoff/admin/${pv.endPage + 1}" class="btn mb-2 btn-primary">></a>
            </c:if>	
          </div>
        </c:if>
        <c:if test="${empty voList && not empty vo}">
        	<div id="page-area">
	          <c:if test="${pv.startPage ne 1}">
	            <a href="${root}/dayoff/admin/${pv.startPage - 1}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary"><</a>
	          </c:if>
	          <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	              <a href="${root}/dayoff/admin/${i}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary">${i}</a>
	          </c:forEach>
	          <c:if test="${pv.endPage ne pv.maxPage }">
	            <a href="${root}/dayoff/admin/${pv.endPage + 1}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary">></a>
	          </c:if>	
	        </div>
        </c:if> -->
      </div>
    </div> 

</body>
</html>

