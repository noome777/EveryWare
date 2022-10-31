<%@page import="com.kh.app00.dayoff.vo.DayoffVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>

<style>
	#calendar{
		float: right;
		width: 80%;
		margin-right: 25px;
		margin-top: 20px
	}
</style>

</head>
<body>

   <div class="wrapper">
   	   <%@ include file="/WEB-INF/views/common/header.jsp" %>
       <%@ include file="/WEB-INF/views/commute/admin-side.jsp" %>
	   <!--  https://deseul.tistory.com/entry/full-calendar%EB%9D%BC%EC%9D%B4%EB%B8%8C%EB%9F%AC%EB%A6%AC%EC%97%90-DB%EC%97%B0%EB%8F%99 -->
	   <div id='calendar'></div>
   </div>
</body>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
			locale: 'ko', // 한국어 설정
			height: 640,//캘린더 크기 설정
			headerToolbar : { // 헤더에 표시할 툴 바
				start : 'prev next today',
				center : 'title',
				end : 'dayGridMonth,dayGridWeek,dayGridDay'
			},
			titleFormat : function(date) {
				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
			},
			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
			selectable : true, // 달력 일자 드래그 설정가능
			droppable : true,
			editable : true,
			nowIndicator: true, // 현재 시간 마크
			events : [ 

    	    <%List<DayoffVo> calendarList = (List<DayoffVo>) request.getAttribute("calendarList");%>
				
            <%if (calendarList != null) {%>
            <%for (DayoffVo vo : calendarList) {%>
            {
            	title : '<%=vo.getECode() + " / " +vo.getDeptCode() %>',
                start : '<%=vo.getOffStartDate()%>',
                end : '<%=vo.getOffEndDate()%>',
                color : '#' + Math.round(Math.random() * 0xffffff).toString(16),
				allDay : true
             },
	<%}
}%>			]
			
			
		});
		calendar.render();
	});
</script>
</html>