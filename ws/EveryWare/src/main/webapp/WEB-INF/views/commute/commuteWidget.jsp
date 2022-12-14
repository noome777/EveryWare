<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<style>
 #commute{
 	margin-left: 58%;
 	margin-top: 1%;
 }
 #employee-image{
 	width: 180px;
 	height: 180px;
 	margin-left: 2%;
 }
 #commute-content{
 	float: right;
 	margin-right: 20%;
 }
</style>
</head>
  <body class="vertical  light  ">
    <div class="wrapper">
    
      <%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
      <%-- <%@ include file="/WEB-INF/views/common/sidemenu-content.jsp" %> --%>
     
     <div class="card shadow mb-5" id="commute" style="width: 40%; height: 240px;">
        <div class="card-body">
          <div class="d-flex mb-2">
            <div class="flex-fill pt-2">
              <h4 class="mb-0">근태</h4>
              <img id="employee-image" alt="" src="${root}/resources/img/employee.jpg">
              <div id="commute-content">
              	<h3 id="todayDate"></h3>
              	<h2 id="clock"></h2><br>
                <c:if test="${not empty startTimeFormat && not empty endTimeFormat}">
                  <h4>출근시간 : ${startTimeFormat}</h4>
                  <h4>퇴근시간 : ${endTimeFormat}</h4>
                </c:if>
                <c:if test="${empty startTimeFormat && empty endTimeFormat}">
                  <h4>출근시간 : 미등록</h4>
                  <h4>퇴근시간 : 미등록</h4>
                </c:if>
                <!-- <input type="text" value="${cookie.startTimeFormat.value}"> -->
              </div>
            </div>
          </div> <!-- .row -->
        </div> <!-- .card-body -->
      </div>
     </div>
  </body>

<script>
  /*시간 출력하는 함수 호출*/

  function clock(){
  //h1 태그 가져오기
  const clock = document.getElementById('clock');


  //날짜와 시간
  const date = new Date();

  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();
  const milliseconds = date.getMilliseconds();

  //html에 출력
  clock.innerHTML = date.toLocaleTimeString('en-kr');
  }

  /* 1초마다 clock함수 실행 */
  clock();
  setInterval(clock,1000);


  /*날짜 출력하는 함수 호출*/
  function todayDate(){
  
  const todayDate = document.getElementById('todayDate');

  const today = new Date();

  const year = today.getFullYear();
  const month = ('0' + (today.getMonth() + 1)).slice(-2);
  const day = ('0' + today.getDate()).slice(-2);

  todayDate.innerHTML = year + '-' + month  + '-' + day;
  }

  todayDate();

</script>
</html>