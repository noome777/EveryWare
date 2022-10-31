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
<body style="width: 100%; overflow-x: hidden;" class="vertical  light  " >
<div class="wrapper">

  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  <%@ include file="/WEB-INF/views/commute/commute-side.jsp" %>
  <main role="main" class="main-content">

  <button id="bar" class="btn mb-2 btn-outline-primary" onclick="offLine();">BAR</button>
  <button id="line" class="btn mb-2 btn-outline-primary" onclick="onLine();">LINE</button>


  <!-- chart.js -->
  <canvas id="myChartBar" width="45" height="22"></canvas>
  <canvas id="myChartLine" width="45" height="22"></canvas>
  
<script>
  window.onload = function showBar(){
    $('#myChartLine').hide()
  }

  function offLine(){
    $('#myChartLine').hide();
    $('#myChartBar').show();
  }

  function onLine(){
    $('#myChartBar').hide();
    $('#myChartLine').show();
  }
  
</script>

<!-- bar 형태 -->
<script>
  var context = document
          .getElementById('myChartBar')
          .getContext('2d');
      var myChart = new Chart(context, {
          type: 'bar', // 차트의 형태
          data: { // 차트에 들어갈 데이터
              labels: [
                  //x 축
                  '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
              ],
              datasets: [
                  { //데이터
                      label: '정상 출근', //차트 제목
                      fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                      data: [
                          21,19,25,20,23,26,25,30,21,20,13,28 //x축 label에 대응되는 데이터 값
                      ],
                      backgroundColor: [
                          //색상
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                          'rgba(54, 162, 235, 0.2)',
                      ],
                      borderColor: [
                          //경계선 색상
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                          'rgba(54, 162, 235, 1)',
                      ],
                      borderWidth: 1 //경계선 굵기
                  },
                  {
                      label: '결근',
                      fill: false,
                      data: [
                          3,5,1,3,6,2,5,8,3,4,1,2
                      ],
                      backgroundColor: 'rgba(255, 99, 132, 0.2)',
                      borderColor: 'rgba(255, 99, 132, 1)',
                      borderWidth: 1
                  },
                  {
                      label: '지각',
                      fill: false,
                      data: [
                          2,7,4,9,1,4,3,6,8,2,5,3
                      ],
                      backgroundColor: 'rgba(255, 206, 86, 0.2)',
                      borderColor: 'rgba(255, 206, 86, 1)',
                      borderWidth: 1
                  },
                  {
                      label: '조기퇴근',
                      fill: false,
                      data: [
                          6,3,5,4,2,5,7,4,3,2,4,1
                      ],
                      backgroundColor: 'rgba(75, 192, 192, 0.2)',
                      borderColor: 'rgba(75, 192, 192, 1)',
                      borderWidth: 1
                  }
              ]
          },
          options: {
              scales: {
                  yAxes: [
                      {
                          ticks: {
                              beginAtZero: true
                          }
                      }
                  ]
              }
          }
      });
     
</script>

<script>
  // function showLine(){
    var context = document
            .getElementById('myChartLine')
            .getContext('2d');
        var myChart = new Chart(context, {
            type: 'line', // 차트의 형태
            data: { // 차트에 들어갈 데이터
                labels: [
                    //x 축
                    '1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'
                ],
                datasets: [
                    { //데이터
                        label: '정상 출근', //차트 제목
                        fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                        data: [
                            21,19,25,20,23,26,25,30,21,20,13,28 //x축 label에 대응되는 데이터 값
                        ],
                        backgroundColor: [
                            //색상
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                        ],
                        borderColor: [
                            //경계선 색상
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(54, 162, 235, 1)',
                        ],
                        borderWidth: 1 //경계선 굵기
                    },
                    {
                        label: '결근',
                        fill: false,
                        data: [
                            3,5,1,3,6,2,5,8,3,4,1,2
                        ],
                        backgroundColor: 'rgba(255, 99, 132, 0.2)',
                        borderColor: 'rgba(255, 99, 132, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '지각',
                        fill: false,
                        data: [
                            2,7,4,9,1,4,3,6,8,2,5,3
                        ],
                        backgroundColor: 'rgba(255, 206, 86, 0.2)',
                        borderColor: 'rgba(255, 206, 86, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '조기퇴근',
                        fill: false,
                        data: [
                            6,3,5,4,2,5,7,4,3,2,4,1
                        ],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }
                ]
            },
            options: {
                scales: {
                    yAxes: [
                        {
                            ticks: {
                                beginAtZero: true
                            }
                        }
                    ]
                }
            }
        });
  // }
  
</script>


	</main>
</div>
</body>
</html>