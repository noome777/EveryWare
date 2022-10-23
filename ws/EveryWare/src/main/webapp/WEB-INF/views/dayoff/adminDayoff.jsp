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
<title>EveryWare - 시간 외 근무</title>
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
   
</style>
</head>

    <div class="wrapper">
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/commute/commute-side.jsp" %>
     
    <!-- 시간외 근무 조회 -->

    <div class="card shadow mb-5" style="margin-top: 25px;">

      <div style="margin-left: 20px; margin-top: 20px;">
        <h4 class="card-title">시간 외 근무 결재</h4><br><br>

        <form action="" method="get">
          <h4 class="card-title">기간 선택</h4>
          <div class="form-row mb-3">
            <div class="col-md-4 mb-3">
              <div class="input-group">
                <input class="form-control" id="example-date" type="date" name="overDate" required>
              </div>
            </div>
          </div>
          <button class="btn btn-outline-primary" type="submit" id="search-btn">search</button>
        </form>
    
        <!-- <c:if test="${empty dateCount}"> -->
	        <!-- <h6 class="card-title">조회 결과 ${listCount} 건</h6> -->
        <!-- </c:if>   -->
        <!-- <c:if test="${empty listCount}"> -->
	        <h6 class="card-title">조회 결과  건</h6>
        <!-- </c:if> -->

        <table class="table table-hover">
          <thead>
            <tr>
              <th>신청번호</th>
              <th>부서명</th>
              <th>이름</th>
              <th>시작일자</th>
              <th>종료일자</th>
              <th>일수</th>
              <th>사유</th>
              <th>상태</th>
              <th>등록일자</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach items="${voList}" var="x">
                <tr>
                    <td>${x.offCode}</td>
                    <td>${x.ECode}</td>
                    <td>${x.deptCode}</td>
                    <td>${x.offStartDate}</td>
                    <td>${x.offEndDate}</td>
                    <td>${x.offDays}</td>
                    <td>${x.offReason}</td>
                    <c:if test="${x.offApproval == 'W'}">
                        <td><span class="badge badge-pill badge-warning">결재대기중</span></td>
                      </c:if>
                      <c:if test="${x.offApproval == 'A'}">
                        <td><span class="badge badge-pill badge-success">승인완료</span></td>
                      </c:if>
                      <c:if test="${x.offApproval == 'C'}">
                        <td><span class="badge badge-pill badge-danger">반려</span></td>
                      </c:if>
                    <td>${x.offEnrolldate}</td>
                </tr>
            </c:forEach>
          </tbody>
        </table>

        <!-- <span class="badge badge-pill badge-warning">퇴근미체크</span>
        <span class="badge badge-pill badge-success">정상출근 </span>
        <span class="badge badge-pill badge-warning">조기퇴근</span>
        <span class="badge badge-pill badge-danger">결근</span>
        <span class="badge badge-pill badge-danger">지각</span> -->

        <!-- <span class="badge badge-pill badge-warning">결재대기중</span>
        <span class="badge badge-pill badge-success">승인완료 </span>
        <span class="badge badge-pill badge-danger">반려</span> -->
        <!-- <c:if test="${empty dateList && empty vo}"> -->
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
        <!-- </c:if> -->
        <!-- <c:if test="${empty voList && not empty vo}">
          <div id="page-area">
	          <c:if test="${pv.startPage ne 1}">
	            <a href="${root}/commute/overwork/${pv.startPage - 1}?overDate=${vo.overDate}" class="btn mb-2 btn-primary"><</a>
	          </c:if>
	          <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	              <a href="${root}/commute/overwork/${i}?overDate=${vo.overDate}" class="btn mb-2 btn-primary">${i}</a>
	          </c:forEach>
	          <c:if test="${pv.endPage ne pv.maxPage }">
	            <a href="${root}/commute/overwork/${pv.endPage + 1}?overDate=${vo.overDate}" class="btn mb-2 btn-primary">></a>
	          </c:if>	
	        </div>
        </c:if> -->

      </div>
    </div>
</body>
</html>

