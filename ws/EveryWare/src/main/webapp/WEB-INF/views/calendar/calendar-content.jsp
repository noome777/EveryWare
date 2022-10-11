<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- fullcalendar css -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales-all.js"></script>

     
   	<div id='calendar'></div>  
     
     <script>

	     document.addEventListener('DOMContentLoaded', function() {
	    		var calendarEl = document.getElementById('calendar');
	    		var calendar = new FullCalendar.Calendar(calendarEl, {
	    			height: '850px', // calendar 높이 설정
	    		    googleCalendarApiKey : "AIzaSyBzIIqGuQHooyp3ivTkSS7P1GS6Nx7yZfg",
	    		    eventSources :[ 
	    		        {
	    		            googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com'
	    		            , color: 'white'   // an option!
	    		            , textColor: 'red' // an option!
	    		        } 
	    		    ],
	    		    eventClick : function(info) {	//휴일 클릭시 구글 캘린더 이동을 안하도록 설정
						info.jsEvent.stopPropagation();
						info.jsEvent.preventDefault();
					},
	    			initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
	    			expandRows: true, // 화면에 맞게 높이 재설정
	    			headerToolbar : { // 헤더에 표시할 툴 바
	    				start : 'prev today next',
	    				center : 'title',
	    				end : 'dayGridMonth,dayGridWeek,dayGridDay,listWeek'
	    			},
	    			titleFormat : function(date) {
	    				return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
	    			},
	    			//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
	    			selectable : true, // 달력 일자 드래그 설정가능
	    			droppable : true,
	    			editable : true,	//수정 가능 여부
	    			nowIndicator: true, // 현재 시간 마크
	    			locale: 'ko' // 한국어 설정
	    		});
	    		calendar.render();
	    	});
	</script>
