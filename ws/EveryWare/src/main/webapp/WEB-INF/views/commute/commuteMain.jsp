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
  margin-right: 750px;
}
#page-area{
margin-left: 35%;
margin-top: 5%;
}
#page-area>a{
  margin: 5px;
}
td{
  margin-left: 10px;
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
                  <h1 id="clock">document.write(timeNow)</h1>
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
                  <input type="text" class="mb-0" name="startTimeFormat" id="enter-time" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
                  <input type="hidden" class="mb-0" name="startTime" id="enter-time-format" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
                </h6>
              </div>
              <div class="col-md-6 pt-4">
                <h6 class="mb-0">
                  <input type="button" value="퇴근하기" id="exit" class="btn mb-2 btn-primary commute" onclick="Alert(); exittime();">
                  <input type="text" class="mb-0" name="endTimeFormat" id="exit-time" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
                  <input type="hidden" class="mb-0" name="endTime" id="exit-time-format" value="" style="font-size: 20px; background-color:transparent;  border:0px transparent solid;"></input>
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
                  <h4 class="mb-1">${normalCnt} 회</h4>
                </div>
                <div class="col-6 text-center mb-3 border-bottom">
                  <h4 class="mb-1">조기퇴근</h4><br>
                  <h4 class="mb-1">${earlyCnt} 회</h4>
                </div>
                <div class="col-6 text-center border-right border-bottom mb-3">
                  <h4 class="mb-1">결근</h4><br>
                  <h4 class="mb-1">${lateCnt} 회</h4><br>
                </div>
                <div class="col-6 text-center  border-bottom mb-3">
                  <h4 class="mb-1">지각</h4><br>
                  <h4 class="mb-1">${absentCnt} 회</h4><br>
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
          <form action="${root}/commute/main/1" method="get">
            <h4 class="card-title">기간 선택</h4>
            <div class="form-row mb-3">
              <div class="col-md-4 mb-3">
                <div class="input-group">
                  <input class="form-control" id="example-date" type="date" name="enrollDate" required>
                </div>
              </div>
              ~ 
              <div class="col-md-4 mb-3">
                <div class="input-group">
                  <input class="form-control" id="example-date" type="date" name="enrollDate" required>
                </div>
              </div>
            </div>
            <h5 class="card-title">출퇴근 여부</h5>
            <div class="commute-yn">
              <input type="radio" name="comStatus" id="normal" value="정상출근">정상출근
              <input type="radio" name="comStatus" id="absent" value="결근">결근
              <input type="radio" name="comStatus" id="late" value="지각">지각
              <input type="radio" name="comStatus" id="early" value="조기퇴근">조기퇴근
            </div>
            <input type="submit" class="btn mb-2 btn-outline-primary" value="search" id="search"><br><br>
          </form>
        </div> 

        <img id="company-img" src="${root}/resources/img/EveryWareLogoSmall.png" alt="">
        
        <c:if test="${empty commuteDateCnt}">
          <h6 class="card-title" style="margin-left: 20px;">
            조회 결과 ${commuteCnt} 건
          </h6>
        </c:if>
    
        <c:if test="${empty commuteCnt}">
	        <h6 class="card-title" style="margin-left: 20px;">
            조회 결과 ${commuteDateCnt} 건
          </h6>
        </c:if>

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
            <c:if test="${empty comDateList}">
              <c:forEach items="${comList}" var="x">
                <tr>
                  <td>${x.enrollDate}</td>
                  <td>${x.startTimeFormat}</td>
                  <td>${x.endTimeFormat}</td>
                  <td>${x.workingTime}</td>
                  <c:if test="${x.comStatus == '조기퇴근'}">
                    <td><span class="badge badge-pill badge-warning">조기퇴근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '정상출근'}">
                    <td><span class="badge badge-pill badge-success">정상출근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '결근'}">
                    <td><span class="badge badge-pill badge-danger">결근</span></td>
                  </c:if>
                  <c:if test="${x.comStatus == '지각'}">
                    <td><span class="badge badge-pill badge-warning">지각</span></td>
                  </c:if>
                </tr>
              </c:forEach> 
            </c:if>
            <c:if test="${empty comList}">
          		<c:forEach items="${comDateList}" var="y">
                <tr>
                  <td>${y.enrollDate}</td>
                  <td>${y.startTimeFormat}</td>
                  <td>${y.endTimeFormat}</td>
                  <td>${y.workingTime}</td>
                  <c:if test="${y.comStatus == '조기퇴근'}">
                    <td><span class="badge badge-pill badge-warning">조기퇴근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '정상출근'}">
                    <td><span class="badge badge-pill badge-success">정상출근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '결근'}">
                    <td><span class="badge badge-pill badge-danger">결근</span></td>
                  </c:if>
                  <c:if test="${y.comStatus == '지각'}">
                    <td><span class="badge badge-pill badge-warning">지각</span></td>
                  </c:if>
                </tr>
              </c:forEach>
          	</c:if>
          </tbody>
        </table>

        <c:if test="${empty comDateList && empty enrollDate1 && empty enrollDate2}">
          <div id="page-area">
            <c:if test="${pv.startPage ne 1}">
              <a href="${root}/commute/main/${pv.startPage - 1}" class="btn mb-2 btn-primary"><</a>
            </c:if>
            <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
                <a href="${root}/commute/main/${i}" class="btn mb-2 btn-primary">${i}</a>
            </c:forEach>
            <c:if test="${pv.endPage ne pv.maxPage }">
              <a href="${root}/commute/main/${pv.endPage + 1}" class="btn mb-2 btn-primary">></a>
            </c:if>	
          </div>
        </c:if>
        <c:if test="${empty comList && not empty enrollDate1 && not empty enrollDate2}">
          <div id="page-area">
	          <c:if test="${pv.startPage ne 1}">
	            <a href="${root}/commute/main/${pv.startPage - 1}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary"><</a>
	          </c:if>
	          <c:forEach begin="${ pv.startPage }" end="${ pv.endPage }" var="i">
	              <a href="${root}/commute/main/${i}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary">${i}</a>
	          </c:forEach>
	          <c:if test="${pv.endPage ne pv.maxPage }">
	            <a href="${root}/commute/main/${pv.endPage + 1}?enrollDate=${enrollDate1}&enrollDate=${enrollDate2}&comStatus=${comStatus}" class="btn mb-2 btn-primary">></a>
	          </c:if>	
	        </div>
        </c:if>

      </div>
	</main>
</div>

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
  // clock.innerText  = hours + ':'+ minutes + ':' + seconds ;
  }

  /* 1초마다 clock함수 실행 */
  clock();
  setInterval(clock,1000);

</script>


<script>

  //출근시간, 퇴근시간 체크하기 
  function entertime(){
    entertime = new Date();

    const hours = entertime.getHours();
    const minutes = entertime.getMinutes();
    const seconds = entertime.getSeconds();

    const val = document.getElementById('enter-time').innerHTML = entertime.toLocaleTimeString('en-kr');
    const valFormat = document.getElementById('enter-time-format').innerHTML = hours + ':'+ minutes + ':' + seconds;
    
    const startTime = val;
    const startTimeFormat = valFormat;
    $('input[name=startTime]').attr('value', startTimeFormat);
    $('input[name=startTimeFormat]').attr('value', startTime);
  }

  function exittime(){
    exittime = new Date();

    const hours = exittime.getHours();
    const minutes = exittime.getMinutes();
    const seconds = exittime.getSeconds();

    const val = document.getElementById('exit-time').innerHTML = exittime.toLocaleTimeString('en-kr');
    const valFormat = document.getElementById('exit-time-format').innerHTML = hours + ':'+ minutes + ':' + seconds;

    const endTime = val;
    const endTimeFormat = valFormat;
    $('input[name=endTime]').attr('value', endTimeFormat);
    $('input[name=endTimeFormat]').attr('value', endTime);
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