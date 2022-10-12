<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:set var="root" value="${pageContext.request.contextPath }" />
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
<c:remove var="alertMsg" scope="session"/>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>EVERYWARE</title>
    <!-- 제이쿼리 -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="${root}/resources/css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="${root}/resources/css/feather.css">
    <link rel="stylesheet" href="${root}/resources/css/select2.css">
    <link rel="stylesheet" href="${root}/resources/css/dropzone.css">
    <link rel="stylesheet" href="${root}/resources/css/uppy.min.css">
    <link rel="stylesheet" href="${root}/resources/css/jquery.steps.css">
    <link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${root}/resources/css/quill.snow.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="${root}/resources/css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="${root}/resources/css/app-light.css" id="lightTheme">
    <!-- <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled> -->
  </head>
  <body class="vertical  light  ">
  
	<nav class="topnav navbar navbar-light border-right bg-white shadow">
	  <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
	    <i class="fe fe-menu navbar-toggler-icon"></i>
	  </button>
	  <ul class="nav">
	    <li class="nav-item nav-notif">
	      <a class="nav-link text-muted my-2" href="./#" data-toggle="modal" data-target=".modal-notif">
	        <span class="fe fe-bell fe-16"></span>
	        <span class="dot dot-md bg-success"></span>
	      </a>
	    </li>
	    <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle text-muted pr-0" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	        <span class="avatar avatar-sm mt-2">
	          <img src="${root}/resources/assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
	        </span>
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	        <a class="dropdown-item" href="#">Profile</a>
	        <a class="dropdown-item" href="#">Settings</a>
	        <a class="dropdown-item" href="#">Activities</a>
	      </div>
	    </li>
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
	
  </body>  
</html>


<html lang="kr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="favicon.ico">
    <title>Tiny Dashboard - A Bootstrap Dashboard Template</title>
    <!-- Simple bar CSS -->
    <link rel="stylesheet" href="css/simplebar.css">
    <!-- Fonts CSS -->
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <!-- Icons CSS -->
    <link rel="stylesheet" href="css/feather.css">
    <!-- Date Range Picker CSS -->
    <link rel="stylesheet" href="css/daterangepicker.css">
    <!-- App CSS -->
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme">
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>
  </head>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="${root}">
              <img src="${root}/resources/img/EveryWareLogo.png" alt="" class="logo">
                <g>
                  <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
            </a>
          </div>
          <div class="btn-box w-100 mt-4 mb-1">
            <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="location='${root}/calendar/insert'">
              <span class="small">파일 추가</span>
            </button>
          </div>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>파일 매니저</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
           	<li class="nav-item dropdown">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-pie-chart fe-16"></i>
                <span class="ml-3 item-text">최근 업데이트</span>
              </a>
            </li>
            
			<li class="nav-item w-100">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-star fe-16"></i>
                <span class="ml-3 item-text">중요 표시 항목</span>
              </a>
            </li>
            
            <li class="nav-item w-100">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-folder fe-16"></i>
                <span class="ml-3 item-text">공유한 파일</span>
              </a>
            </li>
            
            <li class="nav-item w-100">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-folder fe-16"></i>
                <span class="ml-3 item-text">내 항목</span>
              </a>
            </li>
           
           	<br><br><br><br><br>

           <li class="nav-item w-100">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-trash fe-16"></i>
                <span class="ml-3 item-text">휴지통</span>
              </a>
            </li>
          </ul>

        </nav>
      </aside>
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-md-12">
              <div class="row align-items-center my-3">
                <div class="col">
                  <h2 class="page-title">파일매니저</h2>
                </div>
                <div class="col-auto">
                  <button type="button" class="btn btn-lg btn-primary"><span class="fe fe-plus fe-16 mr-3"></span>New</button>
                </div>
              </div>
              
              <div class="file-container border-top">
                <div class="file-panel mt-4">
                  <h6 class="mb-3">최근 사용된 파일</h6>
                  <div class="row my-4">
                    <div class="col-md-3">
                      <div class="card shadow text-center mb-4">
                        <div class="card-body file">
                          <div class="file-action">
                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="text-muted sr-only">Action</span>
                            </button>
                            <div class="dropdown-menu m-2">
                              <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>복사</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>수정</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>삭제</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>공유</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>다운로드</a>
                            </div>
                          </div>
                          <div class="circle circle-lg bg-secondary my-4">
                            <span class="fe fe-folder fe-24 text-white"></span>
                          </div>
                        </div> <!-- .card-body -->
                        <div class="card-footer bg-transparent border-0 fname">
                          <strong><span class="dot dot-md bg-success mr-2"></span>Fusion Backpack</strong>
                        </div> <!-- .card-footer -->
                      </div> <!-- .card -->
                    </div> <!-- .col -->
                    <div class="col-md-3">
                      <div class="card shadow text-center mb-4">
                        <div class="card-body file">
                          <div class="file-action">
                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="text-muted sr-only">Action</span>
                            </button>
                            <div class="dropdown-menu m-2">
                              <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>복사</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>수정</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>삭제</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>공유</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>다운로드</a>
                            </div>
                          </div>
                          <div class="circle circle-lg bg-light my-4">
                            <span class="fe fe-image fe-24 text-success"></span>
                          </div>
                          <div class="file-info">
                            <span class="badge badge-light text-muted mr-2">288K</span>
                            <span class="badge badge-pill badge-light text-muted">PNG</span>
                          </div>
                        </div> <!-- .card-body -->
                        <div class="card-footer bg-transparent border-0 fname">
                          <strong>공유한파일이름이에요</strong>
                        </div> <!-- .card-footer -->
                      </div> <!-- .card -->
                    </div> <!-- .col -->
                  </div> <!-- .row -->
                 
                  <hr class="my-4">
                  <h6 class="mb-3">파일목록</h6>
                  <div class="row my-4 pb-4">
                    <div class="col-md-3">
                      <div class="card shadow text-center mb-4">
                        <div class="card-body file">
                          <div class="file-action">
                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="text-muted sr-only">Action</span>
                            </button>
                            <div class="dropdown-menu m-2">
                              <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>복사</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>수정</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>삭제</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>공유</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>다운로드</a>
                            </div>
                          </div>
                          <div class="circle circle-lg bg-light my-4">
                            <span class="fe fe-archive fe-24 text-secondary"></span>
                          </div>
                          <div class="file-info">
                            <span class="badge badge-light text-muted mr-2">14.8M</span>
                            <span class="badge badge-pill badge-light text-muted">Zip</span>
                          </div>
                        </div> <!-- .card-body -->
                        <div class="card-footer bg-transparent border-0 fname">
                          <strong>Packaged-04.02.zip</strong>
                        </div> <!-- .card-footer -->
                      </div> <!-- .card -->
                    </div> <!-- .col -->
                    <div class="col-md-3">
                      <div class="card shadow text-center mb-4">
                        <div class="card-body file">
                          <div class="file-action">
                            <button type="button" class="btn btn-link dropdown-toggle more-vertical p-0 text-muted mx-auto" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <span class="text-muted sr-only">Action</span>
                            </button>
                            <div class="dropdown-menu m-2">
                              <a class="dropdown-item" href="#"><i class="fe fe-copy fe-12 mr-4"></i>복사</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-edit-3 fe-12 mr-4"></i>수정</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-delete fe-12 mr-4"></i>삭제</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-share fe-12 mr-4"></i>공유</a>
                              <a class="dropdown-item" href="#"><i class="fe fe-download fe-12 mr-4"></i>다운로드</a>
                            </div>
                          </div>
                          <div class="circle circle-lg bg-light my-4">
                            <span class="fe fe-film fe-24 text-info"></span>
                          </div>
                          <div class="file-info">
                            <span class="badge badge-light text-muted mr-2">28M</span>
                            <span class="badge badge-pill badge-light text-muted">MP4</span>
                          </div>
                        </div> <!-- .card-body -->
                        <div class="card-footer bg-transparent border-0 fname">
                          <strong>Introduction.mp4</strong>
                        </div> <!-- .card-footer -->
                      </div> <!-- .card -->
                    </div> <!-- .col -->
                  </div> <!-- .row -->
                </div> <!-- .file-panel -->
                <div class="info-panel">
                  <div class="info-content p-3 border-left">
                    <div class="d-flex align-items-center mb-3">
                      <div class="flex-fill">
                        <span class="circle circle-sm bg-white mr-2">
                          <span class="fe fe-image fe-12 text-success"></span>
                        </span>
                        <span class="h6">파일이름.확장자명</span>
                      </div>
                      <span class="btn close-info">
                        <i class="fe fe-x"></i>
                      </span>
                    </div>
                    <ul class="nav nav-tabs nav-fill mb-3" id="file-detail" role="tablist">
                      <li class="nav-item">
                        <a class="nav-link active" id="tab-detail" data-toggle="tab" href="#detail" role="tab" aria-controls="detail" aria-selected="true">파일 정보</a>
                      </li>
                    </ul>
                    <div class="tab-content" id="file-tabs">
                      <div class="tab-pane fade show active" id="detail" role="tabpanel" aria-labelledby="tab-detail">
                        <img src="./assets/products/p4.jpg" alt="..." class="img-fluid rounded">
                        <ul class="avatars-list my-4 mx-0">
                          <li>
                            <a href="#!" class="avatar avatar-sm">
                              <img alt="..." class="avatar-img rounded-circle" src="./assets/avatars/face-2.jpg">
                            </a>
                          </li>
                          <li>
                            <a href="#!" class="avatar avatar-sm">
                              <img alt="..." class="avatar-img rounded-circle" src="./assets/avatars/face-4.jpg">
                            </a>
                          </li>
                        </ul>
                        <dl class="row my-4 small">
                          <dt class="col-6 text-muted">Owner</dt>
                          <dd class="col-6">Whilemina Pate</dd>
                          <dt class="col-6 text-muted">Type</dt>
                          <dd class="col-6">Image</dd>
                          <dt class="col-6 text-muted">Size</dt>
                          <dd class="col-6">32M</dd>
                          <dt class="col-6 text-muted">Location</dt>
                          <dd class="col-6"><a href="#" class="text-muted">Design File</a></dd>
                          <dt class="col-6 text-muted">Created at</dt>
                          <dd class="col-6">Aug 20, 2020</dd>
                          <dt class="col-6 text-muted">Last update</dt>
                          <dd class="col-6">Aug 21, 2020</dd>
                        </dl>
                      </div> <!-- .tab-pane -->

                    </div> <!-- .tab-content -->
                  </div>
                </div>
              </div> <!-- .file-container -->
            </div> <!-- .col -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        <div class="modal fade modal-notif modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Notifications</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                        <small><strong>Package has uploaded successfull</strong></small>
                        <div class="my-0 text-muted small">Package is zipped and uploaded</div>
                        <small class="badge badge-pill badge-light text-muted">1m ago</small>
                      </div>
                    </div>
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-download fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Widgets are updated successfull</strong></small>
                        <div class="my-0 text-muted small">Just create new layout Index, form, table</div>
                        <small class="badge badge-pill badge-light text-muted">2m ago</small>
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
                        <div class="my-0 text-muted small">Fusce dapibus, tellus ac cursus commodo</div>
                        <small class="badge badge-pill badge-light text-muted">30m ago</small>
                      </div>
                    </div> <!-- / .row -->
                  </div>
                  <div class="list-group-item bg-transparent">
                    <div class="row align-items-center">
                      <div class="col-auto">
                        <span class="fe fe-link fe-24"></span>
                      </div>
                      <div class="col">
                        <small><strong>Link was attached to menu</strong></small>
                        <div class="my-0 text-muted small">New layout has been attached to the menu</div>
                        <small class="badge badge-pill badge-light text-muted">1h ago</small>
                      </div>
                    </div>
                  </div> <!-- / .row -->
                </div> <!-- / .list-group -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary btn-block" data-dismiss="modal">Clear All</button>
              </div>
            </div>
          </div>
        </div>
        <div class="modal fade modal-shortcut modal-slide" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="defaultModalLabel">Shortcuts</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                      <i class="fe fe-upload-cloud fe-32 align-self-center text-white"></i>
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
      </main> <!-- main -->
    </div> <!-- .wrapper -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/moment.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/simplebar.min.js"></script>
    <script src='js/daterangepicker.js'></script>
    <script src='js/jquery.stickOnScroll.js'></script>
    <script src="js/tinycolor-min.js"></script>
    <script src="js/config.js"></script>
    <script src="js/d3.min.js"></script>
    <script src="js/topojson.min.js"></script>
    <script src="js/datamaps.all.min.js"></script>
    <script src="js/datamaps-zoomto.js"></script>
    <script src="js/datamaps.custom.js"></script>
    <script src="js/Chart.min.js"></script>
    <script>
      /* defind global options */
      Chart.defaults.global.defaultFontFamily = base.defaultFontFamily;
      Chart.defaults.global.defaultFontColor = colors.mutedColor;
    </script>
    <script src="js/gauge.min.js"></script>
    <script src="js/jquery.sparkline.min.js"></script>
    <script src="js/apexcharts.min.js"></script>
    <script src="js/apexcharts.custom.js"></script>
    <script src="js/apps.js"></script>
  </body>
</html>