<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="alertMsg" value="${sessionScope.alertMsg}" />
<c:remove var="alertMsg" scope="session" />
<!doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="favicon.ico">
<title>EVERYWARE</title>
<!-- 제이쿼리 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Simple bar CSS -->
<link rel="stylesheet" href="${root}/resources/css/simplebar.css">
<!-- Fonts CSS -->
<link
	href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet" href="${root}/resources/css/feather.css">
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
<!-- <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled> -->


  
</head>
<body class="vertical  light  ">

	<nav class="topnav navbar navbar-light border-right bg-white shadow">
		<button type="button"
			class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
			<i class="fe fe-menu navbar-toggler-icon"></i>
		</button>
		<ul class="nav">
			<%-- <li class="nav-item nav-notif"><a
				class="nav-link text-muted my-2" href="${root}/alarm/select" data-toggle="modal"
				data-target=".modal-notif"> <span class="fe fe-bell fe-16"></span>
					<span class="dot dot-md bg-success"></span>
			</a></li> --%>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle text-muted pr-0" href="#"
				id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false"> <span
					class="avatar avatar-sm mt-2"> 

          <c:choose>
          	<c:when test="${not empty loginMember.empProfileName}">
          		 	<img src="${root}/resources/upload/profile/${loginMember.empProfileName}" alt="프로필 이미지" class="avatar-img rounded-circle"> 
		        </c:when>
          	<c:otherwise> 
				  	<img src="${root}/resources/img/guest.png" alt="프로필 이미지 미등록" class="avatar-img rounded-circle">
		       	</c:otherwise>
		      </c:choose> 

				</span>
			</a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="navbarDropdownMenuLink">
					<a class="dropdown-item" href="${root}/emp/myPage">프로필</a> 
                    <a class="dropdown-item" href="${root}/emp/logout">로그아웃</a>
				</div></li>
		</ul>
	</nav>

	<script src="${root}/resources/js/jquery.min.js"></script>
	<script src="${root}/resources/js/popper.min.js"></script>
	<script src="${root}/resources/js/moment.min.js"></script>
	<script src="${root}/resources/js/bootstrap.min.js"></script>
	<script src="${root}/resources/js/simplebar.min.js"></script>
	<script src='${root}/resources/js/daterangepicker.js'></script>
	<script src='${root}/resources/js/jquery.stickOnScroll.js'></script>
	<script src="${root}/resources/js/tinycolor-min.js"></script>
	<script src="${root}/resources/js/config.js"></script>
	<script src="${root}/resources/js/d3.min.js"></script>
	<script src="${root}/resources/js/topojson.min.js"></script>
	<script src="${root}/resources/js/datamaps.all.min.js"></script>
	<script src="${root}/resources/js/datamaps-zoomto.js"></script>
	<script src="${root}/resources/js/datamaps.custom.js"></script>
	<script src="${root}/resources/js/Chart.min.js"></script>
	<script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
	<script src="${root}/resources/js/gauge.min.js"></script>
	<script src="${root}/resources/js/jquery.sparkline.min.js"></script>
	<script src="${root}/resources/js/apexcharts.min.js"></script>
	<script src="${root}/resources/js/apexcharts.custom.js"></script>
	<script src='${root}/resources/js/jquery.mask.min.js'></script>
	<script src='${root}/resources/js/select2.min.js'></script>
	<script src='${root}/resources/js/jquery.steps.min.js'></script>
	<script src='${root}/resources/js/jquery.validate.min.js'></script>
	<script src='${root}/resources/js/jquery.timepicker.js'></script>
	<script src='${root}/resources/js/dropzone.min.js'></script>
	<script src='${root}/resources/js/uppy.min.js'></script>
	<script src='${root}/resources/js/quill.min.js'></script>
	<script>
      $('.select2').select2(
      {
        theme: 'bootstrap4',
      });
      $('.select2-multi').select2(
      {
        multiple: true,
        theme: 'bootstrap4',
      });
      $('.drgpicker').daterangepicker(
      {
        singleDatePicker: true,
        timePicker: false,
        showDropdowns: true,
        locale:
        {
          format: 'MM/DD/YYYY'
        }
      });
      $('.time-input').timepicker(
      {
        'scrollDefault': 'now',
        'zindex': '9999' /* fix modal open */
      });
      /** date range picker */
      if ($('.datetimes').length)
      {
        $('.datetimes').daterangepicker(
        {
          timePicker: true,
          startDate: moment().startOf('hour'),
          endDate: moment().startOf('hour').add(32, 'hour'),
          locale:
          {
            format: 'M/DD hh:mm A'
          }
        });
      }
      var start = moment().subtract(29, 'days');
      var end = moment();

      function cb(start, end)
      {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
      }
      $('#reportrange').daterangepicker(
      {
        startDate: start,
        endDate: end,
        ranges:
        {
          'Today': [moment(), moment()],
          'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days': [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month': [moment().startOf('month'), moment().endOf('month')],
          'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
      }, cb);
      cb(start, end);
      $('.input-placeholder').mask("00/00/0000",
      {
        placeholder: "__/__/____"
      });
      $('.input-zip').mask('00000-000',
      {
        placeholder: "____-___"
      });
      $('.input-money').mask("#.##0,00",
      {
        reverse: true
      });
      $('.input-phoneus').mask('(000) 000-0000');
      $('.input-mixed').mask('AAA 000-S0S');
      $('.input-ip').mask('0ZZ.0ZZ.0ZZ.0ZZ',
      {
        translation:
        {
          'Z':
          {
            pattern: /[0-9]/,
            optional: true
          }
        },
        placeholder: "___.___.___.___"
      });
      // editor
      var editor = document.getElementById('editor');
      if (editor)
      {
        var toolbarOptions = [
          [
          {
            'font': []
          }],
          [
          {
            'header': [1, 2, 3, 4, 5, 6, false]
          }],
          ['bold', 'italic', 'underline', 'strike'],
          ['blockquote', 'code-block'],
          [
          {
            'header': 1
          },
          {
            'header': 2
          }],
          [
          {
            'list': 'ordered'
          },
          {
            'list': 'bullet'
          }],
          [
          {
            'script': 'sub'
          },
          {
            'script': 'super'
          }],
          [
          {
            'indent': '-1'
          },
          {
            'indent': '+1'
          }], // outdent/indent
          [
          {
            'direction': 'rtl'
          }], // text direction
          [
          {
            'color': []
          },
          {
            'background': []
          }], // dropdown with defaults from theme
          [
          {
            'align': []
          }],
          ['clean'] // remove formatting button
        ];
        var quill = new Quill(editor,
        {
          modules:
          {
            toolbar: toolbarOptions
          },
          theme: 'snow'
        });
      }
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function()
      {
        'use strict';
        window.addEventListener('load', function()
        {
          // Fetch all the forms we want to apply custom Bootstrap validation styles to
          var forms = document.getElementsByClassName('needs-validation');
          // Loop over them and prevent submission
          var validation = Array.prototype.filter.call(forms, function(form)
          {
            form.addEventListener('submit', function(event)
            {
              if (form.checkValidity() === false)
              {
                event.preventDefault();
                event.stopPropagation();
              }
              form.classList.add('was-validated');
            }, false);
          });
        }, false);
      })();
    </script>
	<script>
      var uptarg = document.getElementById('drag-drop-area');
      if (uptarg)
      {
        var uppy = Uppy.Core().use(Uppy.Dashboard,
        {
          inline: true,
          target: uptarg,
          proudlyDisplayPoweredByUppy: false,
          theme: 'dark',
          width: 770,
          height: 210,
          plugins: ['Webcam']
        }).use(Uppy.Tus,
        {
          endpoint: 'https://master.tus.io/files/'
        });
        uppy.on('complete', (result) =>
        {
          console.log('Upload complete! We’ve uploaded these files:', result.successful)
        });
      }
    </script>
	<script src="${root}/resources/js/apps.js"></script>
	<%-- <div class="modal fade modal-notif modal-slide" tabindex="-1"
		role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="defaultModalLabel">알림</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="list-group list-group-flush my-n3">
						
						
						<c:forEach items="${alarmList}" var="al">
						
						
						<div class="list-group-item bg-transparent">
							<a href="#" style="text-decoration: none; color: black;">
								<div class="row align-items-center">
									<div class="col-auto">
										<span class="fe fe-calendar fe-24"></span>
									</div>
									<div class="col">
										<small><strong>${al.alarmcontent}</strong></small>
										<div class="my-0 text-muted small">10분 후 회의 예정</div>
										<small class="badge badge-pill badge-light text-muted">1분 전
											</small>
									</div>
								</div>
							</a>
						</div>
						</c:forEach>
						<!-- <div class="list-group-item bg-transparent">
							<a href="#" style="text-decoration: none; color: black;">
								<div class="row align-items-center">
									<div class="col-auto">
										<span class="fe fe-calendar fe-24"></span>
									</div>
									<div class="col">
										<small><strong>20분 후 일정이 있습니다.</strong></small>
										<div class="my-0 text-muted small">20분 후 회의 예정</div>
										<small class="badge badge-pill badge-light text-muted">10분 전
											</small>
									</div>
								</div>
							</a>
						</div>
						
						<div class="list-group-item bg-transparent">
							<a href="#" style="text-decoration: none; color: black;">
								<div class="row align-items-center">
									<div class="col-auto">
										<span class="fe fe-calendar fe-24"></span>
									</div>
									<div class="col">
										<small><strong>30분 후 일정이 있습니다.</strong></small>
										<div class="my-0 text-muted small">30분 후 회의 예정</div>
										<small class="badge badge-pill badge-light text-muted">20분 전
											</small>
									</div>
								</div>
							</a>
						</div> -->
						
					</div>
					<!-- / .list-group -->
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary btn-block"
						data-dismiss="modal">Clear All</button>
				</div>
			</div>
		</div>
	</div> --%>
</body>
</html>

