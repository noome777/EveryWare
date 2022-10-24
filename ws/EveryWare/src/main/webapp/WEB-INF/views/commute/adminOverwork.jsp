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
            <h6 class="card-title">기간 선택</h6>
            <div class="form-row mb-3">
                <div class="col-md-4 mb-3">
                <div class="input-group">
                    <input class="form-control" id="example-date" type="date" name="overDate" required>
                </div>
                </div>
            </div>
            <button class="btn btn-outline-primary" type="submit" id="search-btn">search</button>
        </form>
    
        <c:if test="${empty adDateCount}">
	        <h6 class="card-title">조회 결과 ${adListCount} 건</h6>
        </c:if>  
        <c:if test="${empty adListCount}">
	        <h6 class="card-title">조회 결과  ${adDateCount} 건</h6>
        </c:if>

        <table class="table table-hover">
          <thead>
            <tr>
              <th>신청번호</th>
              <th>부서명</th>
              <th>이름</th>
              <th>일자</th>
              <th>시간</th>
              <th>업무명</th>
              <th>사유</th>
              <th>상태</th>
              <th>등록일자</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${empty AdDateList}">
                <c:forEach items="${voList}" var="x">
                    <tr>
                        <td>${x.overCode}</td>
                        <td>${x.deptCode}</td>
                        <td>${x.ECode}</td>
                        <td>${x.overDate}</td>
                        <td>${x.overTime}</td>
                        <td>${x.overName}</td>
                        <td>${x.overReason}</td>
                        <td>
                            <select name="" id="">
                                <option value="">결재대기중</option>
                                <option value="">승인완료</option>
                                <option value="">반려</option>
                            </select>
                        </td>
                        <td>${x.overEnrolldate}</td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty voList}">
                <c:forEach items="${AdDateList}" var="y">
                    <tr>
                        <td>${y.overCode}</td>
                        <td>${y.deptCode}</td>
                        <td>${y.ECode}</td>
                        <td>${y.overDate}</td>
                        <td>${y.overTime}</td>
                        <td>${y.overName}</td>
                        <td>${y.overReason}</td>
                        <td>
                            <select name="" id="">
                                <option value="">결재대기중</option>
                                <option value="">승인완료</option>
                                <option value="">반려</option>
                            </select>
                        </td>
                        <td>${y.overEnrolldate}</td>
                    </tr>
                </c:forEach>
            </c:if>
          </tbody>
        </table>
        <!-- <c:if test="${y.offApproval == 'W'}">
            <td><span class="badge badge-pill badge-warning">결재대기중</span></td>
        </c:if>
        <c:if test="${y.offApproval == 'A'}">
            <td><span class="badge badge-pill badge-success">승인완료</span></td>
        </c:if>
        <c:if test="${y.offApproval == 'C'}">
            <td><span class="badge badge-pill badge-danger">반려</span></td>
        </c:if> -->

       
        <c:if test="${empty AdDateList && empty vo}">
          <div id="page-area">
            <c:if test="${pv.startPage ne 1}">
              <a href="${root}/commute/admin/${pv.startPage - 1}" class="btn mb-2 btn-primary"><</a>
            </c:if>
            <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
                <a href="${root}/commute/admin/${i}" class="btn mb-2 btn-primary">${i}</a>
            </c:forEach>
            <c:if test="${pv.endPage ne pv.maxPage }">
              <a href="${root}/commute/admin/${pv.endPage + 1}" class="btn mb-2 btn-primary">></a>
            </c:if>	
          </div>
        </c:if>
        <c:if test="${empty voList && not empty vo}">
        	<div id="page-area">
	          <c:if test="${pv.startPage ne 1}">
	            <a href="${root}/commute/admin/${pv.startPage - 1}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary"><</a>
	          </c:if>
	          <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	              <a href="${root}/commute/admin/${i}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary">${i}</a>
	          </c:forEach>
	          <c:if test="${pv.endPage ne pv.maxPage }">
	            <a href="${root}/commute/admin/${pv.endPage + 1}?offStartDate=${vo.offStartDate}&offEndDate=${vo.offEndDate}" class="btn mb-2 btn-primary">></a>
	          </c:if>	
	        </div>
        </c:if>

      </div>
    </div>
</body>
</html>

