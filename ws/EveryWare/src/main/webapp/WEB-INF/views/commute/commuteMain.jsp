<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 근태</title>
<style>
  .card{
    margin: 10px 30px;
  }
  .form-group{
    width: 150px;
    margin-left: 30px;
  }
  .mb-5{
    /* display: flex; */
    float: left;
    margin: 30px;
  }
  .commute{
    margin-left: 10px;
  }
  #enter-time, #exit-time{
    margin-left: 20px;
  }
  .commute-status{
    margin-top: 35px;
  }
  #profile-img{
    margin-left: 1000px;
    width: 100px;
    height: 100px;
    margin-top: -105px;
    float: right;
  }
  #company-img{
    margin-left: 1030px;
    width: 100px;
    height: 100px;
    margin-top: -200px;
    margin-bottom: 120px;
    float: right;
  }
  .form-group{
    margin-left: -5px;
    display: flex;
  }
  .commute-yn>input:not(:first-of-type){
    margin-left: 20px;
  }
  .commute-yn, .form-group{
    margin-top: 10px;
  }
  #search{
    float: right;
    margin-top: -30px;
    margin-right: 650px;
  }

</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
</head>
<body class="vertical  light  ">
  <div class="wrapper">
  
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/commute/commute-side.jsp" %>
   	<main role="main" class="main-content">
    <button onclick="location.href='${root}/emp/login'">로그아웃</button>
      <!-- 근무체크 -->
      <form action="" method="post">
        <div class="card shadow mb-4">
          <div class="card-body">
            <div class="d-flex mb-2">
              <div class="flex-fill pt-2">
                <div class="commute-check">
                  <h4 class="mb-0">근무체크</h4><br>
                  <h1 id="timeNow">document.write(timeNow)</h1>
                </div>
                <img id="profile-img" alt="" src="${root}/resources/img/guest.png">
              </div>
              <div class="flex-fill chart-box mt-n2" style="position: relative;">
                <div class="resize-triggers"><div class="expand-trigger"><div style="width: 193px; height: 181px;"></div></div><div class="contract-trigger"></div></div></div>
              </div> <!-- .d-flex -->
              <div class="row border-top">
              <div class="col-md-6 pt-4">
                <h6 class="mb-0">
                  <input type="button" value="출근하기" id="enter" class="btn mb-2 btn-primary commute" onclick="Alert(); entertime();">
                  <button class="btn mb-2 btn-light commute" >QR생성</button>
                  <input type="text" class="mb-0" name="startTime" id="enter-time" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
                </h6>
              </div>
              <div class="col-md-6 pt-4">
                <h6 class="mb-0">
                  <input type="button" value="퇴근하기" id="exit" class="btn mb-2 btn-primary commute" onclick="Alert(); exittime();">
                  <input type="text" class="mb-0" name="endTime" id="exit-time" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
                  <input type="submit" value="submit" class="btn mb-2 btn-outline-primary"  style="margin-left: 80px;">
                </h6>
              </div>
            </div> <!-- .row -->
          </div> <!-- .card-body -->
        </div>
        <!-- https://jamesdreaming.tistory.com/206 -->
        <!-- https://truecode-95.tistory.com/37 -->
      </form>

      <!-- 근태현황 -->
      <div class="card shadow mb-5" style="width: 45%; height: 300px;">
        <div class="card-body">
          <div class="d-flex mb-2">
            <div class="flex-fill pt-2">
              <h4 class="mb-0">근태현황</h4>
              <div class="row commute-status">
                <div class="col-6 text-center border-right border-bottom mb-3">
                  <h4 class="mb-1">정상출근</h4><br>
                  <p class="text-uppercase text-muted mb-1">정상출근</p>
                </div>
                <div class="col-6 text-center mb-3 border-bottom">
                  <h4 class="mb-1">조기퇴근</h4><br>
                  <p class="text-uppercase text-muted mb-1">조기퇴근</p>
                </div>
                <div class="col-6 text-center border-right border-bottom mb-3">
                  <h4 class="mb-1">결근</h4><br>
                  <p class="text-uppercase text-muted mb-1">결근</p><br>
                </div>
                <div class="col-6 text-center  border-bottom mb-3">
                  <h4 class="mb-1">지각</h4><br>
                  <p class="text-uppercase text-muted mb-1">지각</p><br>
                </div>
              </div>
            </div>
          </div> <!-- .row -->
        </div> <!-- .card-body -->
      </div>

      <!-- 근무시간 -->
      <div class="card shadow mb-5" style="width: 45%; height: 300px;">
        <div class="card-body">
          <div class="d-flex mb-2">
            <div class="flex-fill pt-2">
              <h4 class="mb-0">근무시간</h4>
              <div class="row commute-status">
                <div class="col-6 text-center border-right border-bottom mb-3">
                  <h4 class="mb-1">근무일수</h4><br>
                  <p class="text-uppercase text-muted mb-1">근무일수</p>
                </div>
                <div class="col-6 text-center mb-3 border-bottom">
                  <h4 class="mb-1">총근무시간</h4><br>
                  <p class="text-uppercase text-muted mb-1">총근무시간</p>
                </div>
                <div class="col-6 text-center border-right border-bottom mb-3">
                  <h4 class="mb-1">평균근무시간</h4><br>
                  <p class="text-uppercase text-muted mb-1">평균근무시간</p><br>
                </div>
                <div class="col-6 text-center  border-bottom mb-3">
                  <h4 class="mb-1">금일근무시간</h4><br>
                  <p class="text-uppercase text-muted mb-1">금일근무시간</p><br>
                </div>
              </div>
            </div>
          </div> <!-- .row -->
        </div> <!-- .card-body -->
      </div>

      <!-- 근무결과 조회 -->
      <div class="card shadow mb-5" style="width: 95%; margin-top: 10px;">
        
        <div id="select-condition" style="margin-left: 20px; margin-top: 20px;">
          <h4 class="card-title">근무결과 조회</h4><br><br>
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
            <h6>출퇴근 여부</h6>
            <div class="commute-yn">
              <input type="radio" name="commute-yn" id="normal" value="정상출근">정상출근
              <input type="radio" name="commute-yn" id="absent" value="결근">결근
              <input type="radio" name="commute-yn" id="late" value="지각">지각
              <input type="radio" name="commute-yn" id="early" value="조기퇴근">조기퇴근
              <input type="radio" name="commute-yn" id="uncheck" value="퇴근미체크">퇴근미체크
            </div>
            <input type="submit" class="btn mb-2 btn-outline-primary" value="search" id="search"><br><br>
          </form>
        </div> 

        <img id="company-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="">
        
        <h6 class="card-title" style="margin-left: 20px;">조회 결과 {}건</h6>
        <table class="table table-hover">
          <thead>
            <tr>
              <th>일자</th>
              <th>출근시간</th>
              <th>퇴근시간</th>
              <th>근무시간</th>
              <th>근무상태</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>3224</td>
              <td>Enim Limited</td>
              <td>901-6206 Cras Av.</td>
              <td>Apr 24, 2019</td>
              <td><span class="badge badge-pill badge-warning">퇴근미체크</span></td>
            </tr>
            <tr>
              <td>3218</td>
              <td>Nunc Lectus Incorporated</td>
              <td>Ap #705-5389 Id St.</td>
              <td>May 23, 2020</td>
              <td><span class="badge badge-pill badge-success">정상출근</span></td>
            </tr>
            <tr>
              <td>2651</td>
              <td>Nisi Aenean Eget Limited</td>
              <td>7425 Malesuada Rd.</td>
              <td>Nov 4, 2019</td>
              <td><span class="badge badge-pill badge-warning">조기퇴근</span></td>
            </tr>
            <tr>
              <td>2636</td>
              <td>Pellentesque Associates</td>
              <td>896 Sodales St.</td>
              <td>Mar 27, 2020</td>
              <td><span class="badge badge-pill badge-danger">결근</span></td>
            </tr>
            <tr>
              <td>2757</td>
              <td>Augue Incorporated</td>
              <td>4583 Id St.</td>
              <td>Jan 13, 2020</td>
              <td><span class="badge badge-pill badge-success">정상출근</span></td>
            </tr>
            <tr>
              <td>2757</td>
              <td>Augue Incorporated</td>
              <td>4583 Id St.</td>
              <td>Jan 13, 2020</td>
              <td><span class="badge badge-pill badge-warning">지각</span></td>
            </tr>
          </tbody>
        </table>
      </div>
	</main>
</div>



<script>
  /*시간 출력하는 함수 호출*/

  function clock(){
  //h1 태그 가져오기
  const timeNow = document.getElementById('timeNow');

  //날짜와 시간
  const date = new Date();

  const hours = date.getHours();
  const minutes = date.getMinutes();
  const seconds = date.getSeconds();
  const milliseconds = date.getMilliseconds();

  //html에 출력
  timeNow.innerHTML = date.toLocaleTimeString('en-kr');
  }

  /* 1초마다 clock함수 실행 */
  clock();
  setInterval(clock,1000);
</script>


<script>

  //출근시간, 퇴근시간 체크하기 
  function entertime(){
    entertime = new Date();

    const val = document.getElementById('enter-time').innerHTML = entertime.toLocaleTimeString('en-kr');
    
    const startTime = val;
    $('input[name=startTime]').attr('value', startTime);
  }

  function exittime(){
    exittime = new Date();

    const val = document.getElementById('exit-time').innerHTML = exittime.toLocaleTimeString('en-kr');

    const endTime = val;
    $('input[name=endTime]').attr('value', endTime);
  }


</script>


<script type="text/javascript">

  //sweet alert로 출퇴근 여부 확인창 띄우기

	var alert = function(msg, type) {
		swal({
			title : '',
			text : msg,
			type : type,
			timer : 1500,
			customClass : 'sweet-size',
			showConfirmButton : false
		});
	}

	function Alert() {
		alert('확인되었습니다.', 'success');
	}
	
</script>


</body>
</html>