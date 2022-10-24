<%@page import="com.kh.app00.calendar.vo.CalendarVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>Tiny Dashboard - A Bootstrap Dashboard Template</title>
<!-- Simple bar CSS -->
<link rel="stylesheet" href="${root}/resources/css/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet" href="${root}/resources/css/feather.css">
<!-- FullCalendar CSS -->
<link rel="stylesheet" href="${root}/resources/css/fullcalendar.css">
<link rel="stylesheet" href="${root}/resources/css/select2.css">
<link rel="stylesheet" href="${root}/resources/css/dropzone.css">
<link rel="stylesheet" href="${root}/resources/css/uppy.min.css">
<link rel="stylesheet" href="${root}/resources/css/jquery.steps.css">
<link rel="stylesheet"
	href="${root}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${root}/resources/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet" href="${root}/resources/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet" href="${root}/resources/css/app-light.css"
	id="lightTheme">
<link rel="stylesheet" href="${root}/resources/css/app-dark.css"
	id="darkTheme" disabled>
</head>
<body class="vertical  light  ">
	<div class="wrapper">
		<main role="main" class="main-content">
			<div class="container-fluid">
				<div class="row justify-content-center">
					<div class="col-12">
						<div class="row align-items-center my-3">
							<div class="col">
								<h2 class="page-title">부서 일정</h2>
							</div>
							<div class="col-auto">
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#eventModal">
									<span class="fe fe-plus fe-16 mr-3"></span>일정 추가
								</button>
							</div>
						</div>
						<div id='calendar'></div>
						<!-- new event modal -->
						<div class="modal fade" id="eventModal" tabindex="-1"
							role="dialog" aria-labelledby="eventModalLabel"
							aria-hidden="true">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="varyModalLabel">일정 추가</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body p-4">
										<form action="${root}/calendar/department/insert" method="POST">
											<div class="form-group">
												<label for="eventTitle" class="col-form-label">제목</label> <input
													type="text" class="form-control" id="eventTitle"
													name="calTitle" placeholder="Add event title">
											</div>
											<div class="form-row">
												<div class="form-group col-md-8">
													<label for="eventType">타입</label> <select id="eventType"
														name="calType" class="form-control select">
														<option value="WORK">부서</option>
														<option value="HOME">개인</option>
													</select>
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="date-input1">시작 날짜</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text" id="button-addon-date">
																<span class="fe fe-calendar fe-16"></span>
															</div>
														</div>
														<input type="text" class="form-control drgpicker"
															name="calStart" id="drgpicker-start" value="10/15/2022">
													</div>
												</div>
												<div class="form-group col-md-6">
													<label for="startDate">시작 시간</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text" id="button-addon-time">
																<span class="fe fe-clock fe-16"></span>
															</div>
														</div>
														<input type="text" class="form-control time-input"
															name="startTime" id="start-time" placeholder="00:00 AM">
													</div>
												</div>
											</div>
											<div class="form-row">
												<div class="form-group col-md-6">
													<label for="date-input1">종료 날짜</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text" id="button-addon-date">
																<span class="fe fe-calendar fe-16"></span>
															</div>
														</div>
														<input type="text" class="form-control drgpicker"
															name="calEnd" id="drgpicker-end" value="10/17/2022">
													</div>
												</div>
												<div class="form-group col-md-6">
													<label for="startDate">종료 시간</label>
													<div class="input-group">
														<div class="input-group-prepend">
															<div class="input-group-text" id="button-addon-time">
																<span class="fe fe-clock fe-16"></span>
															</div>
														</div>
														<input type="text" class="form-control time-input"
															name="EndTime" id="end-time" placeholder="00:00 AM">
													</div>
												</div>
											</div>
									</div>
									<div class="modal-footer d-flex justify-content-between">
										<div class="custom-control custom-switch">
											<input type="checkbox" class="custom-control-input"
												name="calAllday" id="RepeatSwitch" checked> <label
												class="custom-control-label" for="RepeatSwitch">종일</label>
										</div>
										<input type="submit" class="btn mb-2 btn-primary" value="저장">

										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- new event modal -->
					</div>
					<!-- .col-12 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container-fluid -->
			<div class="modal fade modal-notif modal-slide" tabindex="-1"
				role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="list-group list-group-flush my-n3">
								<div class="list-group-item bg-transparent">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="fe fe-box fe-24"></span>
										</div>
										<div class="col">
											<small><strong>Package has uploaded
													successfull</strong></small>
											<div class="my-0 text-muted small">Package is zipped
												and uploaded</div>
											<small class="badge badge-pill badge-light text-muted">1m
												ago</small>
										</div>
									</div>
								</div>
								<div class="list-group-item bg-transparent">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="fe fe-download fe-24"></span>
										</div>
										<div class="col">
											<small><strong>Widgets are updated
													successfull</strong></small>
											<div class="my-0 text-muted small">Just create new
												layout Index, form, table</div>
											<small class="badge badge-pill badge-light text-muted">2m
												ago</small>
										</div>
									</div>
								</div>
								<div class="list-group-item bg-transparent">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="fe fe-inbox fe-24"></span>
										</div>
										<div class="col">
											<small><strong>Notifications have been sent</strong></small>
											<div class="my-0 text-muted small">Fusce dapibus,
												tellus ac cursus commodo</div>
											<small class="badge badge-pill badge-light text-muted">30m
												ago</small>
										</div>
									</div>
									<!-- / .row -->
								</div>
								<div class="list-group-item bg-transparent">
									<div class="row align-items-center">
										<div class="col-auto">
											<span class="fe fe-link fe-24"></span>
										</div>
										<div class="col">
											<small><strong>Link was attached to menu</strong></small>
											<div class="my-0 text-muted small">New layout has been
												attached to the menu</div>
											<small class="badge badge-pill badge-light text-muted">1h
												ago</small>
										</div>
									</div>
								</div>
								<!-- / .row -->
							</div>
							<!-- / .list-group -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary btn-block"
								data-dismiss="modal">Clear All</button>
						</div>
					</div>
				</div>
			</div>
			<div class="modal fade modal-shortcut modal-slide" tabindex="-1"
				role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body px-5">
							<div class="row align-items-center">
								<div class="col-6 text-center">
									<div class="squircle bg-success justify-content-center">
										<i class="fe fe-cpu fe-32 align-self-center text-white"></i>
									</div>
									<p>Control area</p>
								</div>
								<div class="col-6 text-center">
									<div class="squircle bg-primary justify-content-center">
										<i class="fe fe-activity fe-32 align-self-center text-white"></i>
									</div>
									<p>Activity</p>
								</div>
							</div>
							<div class="row align-items-center">
								<div class="col-6 text-center">
									<div class="squircle bg-primary justify-content-center">
										<i class="fe fe-droplet fe-32 align-self-center text-white"></i>
									</div>
									<p>Droplet</p>
								</div>
								<div class="col-6 text-center">
									<div class="squircle bg-primary justify-content-center">
										<i
											class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
									</div>
									<p>Upload</p>
								</div>
							</div>
							<div class="row align-items-center">
								<div class="col-6 text-center">
									<div class="squircle bg-primary justify-content-center">
										<i class="fe fe-users fe-32 align-self-center text-white"></i>
									</div>
									<p>Users</p>
								</div>
								<div class="col-6 text-center">
									<div class="squircle bg-primary justify-content-center">
										<i class="fe fe-settings fe-32 align-self-center text-white"></i>
									</div>
									<p>Settings</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
		<!-- main -->
	</div>
	<!-- .wrapper -->
	<script src="${root}/resources/js/jquery.min.js"></script>
	<script src="${root}/resources/js/popper.min.js"></script>
	<script src="${root}/resources/js/moment.min.js"></script>
	<script src="${root}/resources/js/bootstrap.min.js"></script>
	<script src="${root}/resources/js/simplebar.min.js"></script>
	<script src='${root}/resources/js/daterangepicker.js'></script>
	<script src='${root}/resources/js/jquery.stickOnScroll.js'></script>
	<script src="${root}/resources/js/tinycolor-min.js"></script>
	<script src="${root}/resources/js/config.js"></script>
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
            header:
            {
              left: 'prev,today, next',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            navLinks: true,
            eventLimit: true, // allow "more" link when too many events
            editable: true,
            selectable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            buttonIcons:
            {
              prev: 'fe-arrow-left',
              next: 'fe-arrow-right',
              prevYear: 'left-double-arrow',
              nextYear: 'right-double-arrow'
            },
            /**
             * 이벤트 선택해서 삭제하기
             */
            eventClick: function (info){
                if(confirm("일정 이름 : '"+ info.event.title +"'  일정을 삭제하시겠습니까 ?")){
                    // 확인 클릭 시
                    info.event.remove();
                }

                console.log(info.event);
                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                var obj = new Object();
                    obj.title = info.event._def.title;
                    obj.start = info.event._instance.range.start;
                    events.push(obj);

                console.log(events);
                $(function deleteData(){
                    $.ajax({
                        url: "/calendar/delete",
                        method: "GET",
                        dataType: "json",
                        data: JSON.stringify(events),
                        contentType: 'application/json',
                    })
                })
            },
            // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
            //
            // },
			events: [
				<%List<CalendarVo> calendarList = (List<CalendarVo>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarVo vo : calendarList) {%>
	            {
	            	title : '<%=vo.getCalTitle()%>',
	                start : '<%=vo.getCalStart()%>',
	                end : '<%=vo.getCalEnd()%>',
	                <%if (vo.getCalAllday().equals("TRUE ")) {%>
	                	allDay : 'TRUE',
	                <% } %>
	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	             },
		<%}
}%>],
            locale: 'ko'
          });
          calendar.render();
        });
      }
      
    </script>
    
    
	<script src='${root}/resources/js/jquery.mask.min.js'></script>
	<script src='${root}/resources/js/select2.min.js'></script>
	<script src='${root}/resources/js/jquery.steps.min.js'></script>
	<script src='${root}/resources/js/jquery.validate.min.js'></script>
	<script src='${root}/resources/js/jquery.timepicker.js'></script>
	<script src='${root}/resources/js/dropzone.min.js'></script>
	<script src='${root}/resources/js/uppy.min.js'></script>
	<script src='${root}/resources/js/quill.min.js'></script>
	

</body>
</html>
