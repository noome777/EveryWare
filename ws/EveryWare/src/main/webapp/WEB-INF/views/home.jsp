<%@page import="com.kh.app00.calendar.vo.CalendarVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
<style>
 #commute{
 	margin-left: 58%;
 	
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
 
 #cal{
 	margin-right: 2%;
 	margin-top: 0%;
 	float: right;
 	/* margin: 1% auto; */
 }
</style>
</head>
  <body class="vertical  light  ">
    <div class="wrapper">
    
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/common/sidemenu-content.jsp" %>
      <%-- <%@ include file="/WEB-INF/views/commute/commuteWidget.jsp" %> --%>
      
      <!-- 근태위젯 -->
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
              </div>
            </div>
          </div> <!-- .row -->
        </div> <!-- .card-body -->
      </div>
        
       <!-- 일정 위젯 -->
	   
	  
       <div class="card shadow mb-5" id="cal" style="width: 82%; height: 400px;">
        <div class="card-body">
          <div class="d-flex mb-2">
            <div class="flex-fill pt-2">
              	<div id="calendar"></div>
              	
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



<script src='${root}/resources/js/fullcalendar.js'></script>
	<script src='${root}/resources/js/fullcalendar.custom.js'></script>
	<script
		src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.js"></script>
	<script>
	/** full calendar */
    var calendarEl = document.getElementById('calendar');
    if (calendarEl)
    {
      document.addEventListener('DOMContentLoaded', function()
      {
        var calendar = new FullCalendar.Calendar(calendarEl,
        {
          plugins: ['dayGrid', 'timeGrid', 'list', 'bootstrap'],
          themeSystem: 'bootstrap',
          aspectRatio: 1.35,
          contentHeight: 200,
          header:
          {
            left: 'prev,today, next',
            center: 'title',
            right: 'listMonth'
          },
          navLinks: true,
          eventLimit: true, // allow "more" link when too many events
          selectable: true,
          buttonIcons:
          {
            prev: 'fe-arrow-left',
            next: 'fe-arrow-right',
            prevYear: 'left-double-arrow',
            nextYear: 'right-double-arrow'
          },
			events: [
				<%List<CalendarVo> calendarList = (List<CalendarVo>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarVo vo : calendarList) {%>
	            {
	            	id : '<%=vo.getCalCode() %>',
	            	title : '<%=vo.getCalTitle()%>',
	                start : '<%=vo.getCalStart()%>',
	                end : '<%=vo.getCalEnd()%>',
	                <%if (vo.getCalAllday().equals("TRUE ")) {%>
	                	allDay : 'TRUE',
	                <% } %>
	                color : '#ffff00'
	             },
		<%}
}%>],
          locale: 'ko'
        });
        calendar.render();
      });
    }
      
    </script>
    <script>
	/** full calendar */
	$(document).ready(function() {
		const fcbtn = document.querySelector('.fc-listMonth-button');
		fcbtn.click();
	});
      
    </script>
</html>