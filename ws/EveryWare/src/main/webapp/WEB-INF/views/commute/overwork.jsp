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
    margin-top: 10px;
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
   
</style>
</head>

    <div class="wrapper">
        
        <%@ include file="/WEB-INF/views/common/header.jsp" %>
        <%@ include file="/WEB-INF/views/commute/commute-side.jsp" %>

        <!-- 시간 외 근무 신청 -->
        <div class="card shadow mb-5">
            <div class="card-header">
            <h4 class="mb-0">시간 외 근무 신청</h4><br>
        </div>
        <div class="card-body">
            <form class="needs-validation" method="post">
                <div class="form-row">
                  <!-- <div class="col-md-4 mb-3">
                    <label for="validationCustom4">성명</label>
                    <input type="text" class="form-control" name="empName" id="validationCustom4" value="" required="">
                  </div> -->
                  <div class="col-md-4 mb-3">
                    <label for="date-input1">예정일시</label>
                    <div class="input-group">
                      <input class="form-control" id="example-date" type="date" name="overDate">
                    </div>
                  </div>
                  <div class="col-md-4 mb-3">
                    <label for="validationCustom4">시간</label>
                    <input type="text" class="form-control" id="validationCustom4" required="" name="overTime">
                  </div>
                </div> 
                <div class="form-group mb-3">
                  <label for="validationTextarea1">업무내용</label>
                  <textarea class="form-control" id="validationTextarea1" placeholder="업무 내용을 입력하세요." required="" rows="3" name="overName"></textarea>
                </div>
                <div class="form-group mb-3">
                  <label for="validationTextarea1">사유</label>
                  <textarea class="form-control" id="validationTextarea1" placeholder="사유를 입력하세요. (사유 없을 시 비고 기재)" required="" rows="3" name="overReason"></textarea>
                </div>
                <button class="btn btn-outline-primary" type="submit" id="submit-btn">Submit form</button>
            </form>
        </div>
    </div> 
     
    <!-- 시간외 근무 조회 -->

    <div class="card shadow mb-5" style="margin-top: -10px;">

      <div style="margin-left: 20px; margin-top: 20px;">
        <h4 class="card-title">시간 외 근무 조회</h4><br><br>

        <form action="">
          <h4 class="card-title">기간 선택</h4>
          <div class="form-row mb-3">
            <div class="col-md-4 mb-3">
              <div class="input-group">
                <input class="form-control" id="example-date" type="date" name="startDate" required>
              </div>
            </div>
            ~ 
            <div class="col-md-4 mb-3">
              <div class="input-group">
                <input class="form-control" id="example-date" type="date" name="endDate" required>
              </div>
            </div>
          </div>
          <button class="btn btn-outline-primary" type="submit" id="search-btn">search</button>
        </form>
    
          
        <h6 class="card-title">조회 결과 {}건</h6>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>신청번호</th>
              <th>일자</th>
              <th>시간</th>
              <th>업무내용</th>
              <th>사유</th>
              <th>상태</th>
            </tr>
          </thead>
          <tbody>
             <c:forEach items="${voList}" var="x">
            	<tr>
	              <td>${x.overCode}</td>
	              <td>${x.overDate}</td>
	              <td>${x.overTime}</td>
	              <td>${x.overName}</td>
	              <td>${x.overReason}</td>
	              <td>${x.overApproval}</td>
            	</tr>
             </c:forEach>
           
			    <%-- <div>${x.no}</div>
			    <div><a href="${root}/board/detail/${x.no}">${x.title}</a></div>
			    <div>${x.writer}</div>
			    <div>${x.hit}</div> --%>
		    
            <!-- <tr>
              <td>3218</td>
              <td>Graham Price</td>
              <td>Nunc Lectus Incorporated</td>
              <td>May 23, 2020</td>
              <td>비고</td>
              <td>대기</td>
            </tr>
            <tr>
              <td>2651</td>
              <td>Reuben Orr</td>
              <td>Nisi Aenean Eget Limited</td>
              <td>Nov 4, 2019</td>
              <td>비고</td>
              <td>승인완료</td>
            </tr>
            <tr>
              <td>2636</td>
              <td>Akeem Holder</td>
              <td>Pellentesque Associates</td>
              <td>Mar 27, 2020</td>
              <td>비고</td>
              <td>반려</td>
            </tr>
            <tr>
              <td>2757</td>
              <td>Beau Barrera</td>
              <td>Augue Incorporated</td>
              <td>Jan 13, 2020</td>
              <td>비고</td>
              <td>승인완료</td>
            </tr>
            <tr>
              <td>2757</td>
              <td>Beau Barrera</td>
              <td>Augue Incorporated</td>
              <td>Jan 13, 2020</td>
              <td>비고</td>
              <td>승인완료</td>
            </tr> -->
          </tbody>
        </table>
      </div>
    </div>
</body>
</html>

