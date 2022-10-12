<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 월 근무 내역</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>


<style type="text/css">
  .card{
    margin: 10px 30px;
  }
  .form-group{
    width: 150px;
    margin-left: 30px;
  }
  .mb-5{
    float: left;
    margin: 30px;
    width: 97.5%;
  }
  .commute{
    margin-right: 10px;
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
  .form-group{
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
    margin-top: -80px;
    margin-right: 810px;
  }
  table{
    margin-left: -10px;
  }
  #search-btn{
    float: right;
    margin-bottom: 80px;
    margin-top: -70px;
  }
</style>
</head>
<body class="vertical  light  ">
  <div class="wrapper">
  
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/commute/commute-side.jsp" %>
   	<main role="main" class="main-content">

    <!-- 기간 선택 후 조회  -->

    <form style="margin-left: 30px;" action="">
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

    <!-- chart.js -->
    <canvas id="myChart" width="45" height="15"></canvas>
    <script>
      const ctx = document.getElementById('myChart').getContext('2d');
      const myChart = new Chart(ctx, {
          type: 'bar',
          data: {
            labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
            datasets: [{
                label: '# of Votes',
                data: [12, 19, 3, 5, 2, 3],
                backgroundColor: [
                    'rgba(255, 99, 132, 0.2)',
                    'rgba(54, 162, 235, 0.2)',
                    'rgba(255, 206, 86, 0.2)',
                    'rgba(75, 192, 192, 0.2)',
                    'rgba(153, 102, 255, 0.2)',
                    'rgba(255, 159, 64, 0.2)'
                ],
                borderColor: [
                    'rgba(255, 99, 132, 1)',
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 206, 86, 1)',
                    'rgba(75, 192, 192, 1)',
                    'rgba(153, 102, 255, 1)',
                    'rgba(255, 159, 64, 1)'
                ],
                borderWidth: 1
            }]
          },
          options: {
              scales: {
                  y: {
                      beginAtZero: true
                  }
              }
          }
      });
    </script>



    <!-- 근무결과 조회 -->
    <div class="card shadow mb-5" >
      <div style="margin-left: 20px; margin-top: 20px;">
      <h4 class="card-title">근무결과 조회</h4><br><br>
      <h6 class="card-title">조회 결과 {}건</h6>
      <table class="table table-hover">
        <thead>
          <tr>
            <th>일자</th>
            <th>근무시간</th>
            <th>시간외 근무 시간</th>
            <th>총근무시간</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>3224</td>
            <td>Keith Baird</td>
            <td>Enim Limited</td>
            <td>Apr 24, 2019</td>
          </tr>
          <tr>
            <td>3218</td>
            <td>Graham Price</td>
            <td>Nunc Lectus Incorporated</td>
            <td>May 23, 2020</td>
          </tr>
          <tr>
            <td>2651</td>
            <td>Reuben Orr</td>
            <td>Nisi Aenean Eget Limited</td>
            <td>Nov 4, 2019</td>
          </tr>
          <tr>
            <td>2636</td>
            <td>Akeem Holder</td>
            <td>Pellentesque Associates</td>
            <td>Mar 27, 2020</td>
          </tr>
          <tr>
            <td>2757</td>
            <td>Beau Barrera</td>
            <td>Augue Incorporated</td>
            <td>Jan 13, 2020</td>
          </tr>
          <tr>
            <td>2757</td>
            <td>Beau Barrera</td>
            <td>Augue Incorporated</td>
            <td>Jan 13, 2020</td>
          </tr>
        </tbody>
      </table>
    </div>
	</main>
</div>
</body>
</html>