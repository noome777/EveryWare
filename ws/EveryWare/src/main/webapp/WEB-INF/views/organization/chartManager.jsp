<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="img/logo.png">
  <link rel="stylesheet" href="/EveryWare/resources/css/organization/jquery.orgchart.css">
  <link rel="stylesheet" href="/EveryWare/resources/css/organization/style.css">

  <style>
    .orgchart { background: white; }
    #chart-container {
      border-radius: 8px;
      border : none;
    }
  </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    <div class="wrapper">
	    <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center my-3 margin">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">권한 관리</h2>
                </div>
              </div>
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                  <div id="chart-container" class="shadow"></div>

                 
                </div>
              </div>
            </div>
            </div>
      </div>
      </main>
    </div>
</body>


<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/EveryWare/resources/js/organization/jquery.orgchart.js"></script>
  <script type="text/javascript">
      $(function() {

var datascource = {
  'name': 'Lao Lao',
  'title': '테스트부서1',
  'children': [
    { 'name': 'Bo Miao', 'title': 'department manager' },
    { 'name': 'Su Miao', 'title': 'department manager',
      'children': [
        { 'name': 'Tie Hua', 'title': 'senior engineer' },
        { 'name': 'Hei Hei', 'title': 'senior engineer',
          'children': [
            { 'name': 'Pang Pang', 'title': 'engineer' },
            { 'name': 'Dan Zai', 'title': 'UE engineer',
              'children': [
                { 'name': 'Er Dan Zai', 'title': 'Intern' }
              ]
            }
          ]
        }
      ]
    },
    { 'name': 'Hong Miao', 'title': 'department manager' },
    { 'name': 'Chun Miao', 'title': 'department manager' }
  ]
};

$('#chart-container').orgchart({
  'visibleLevel': 2,
  'pan': true,
  'data' : datascource,
  'nodeContent': 'title',
  'createNode': function($node, data) {
    $node.on('click', function(event) {
      if (!$(event.target).is('.edge, .toggleBtn')) {
        var $this = $(this);
        var $chart = $this.closest('.orgchart');
        var newX = window.parseInt(($chart.outerWidth(true)/2) - ($this.offset().left - $chart.offset().left) - ($this.outerWidth(true)/2));
        var newY = window.parseInt(($chart.outerHeight(true)/2) - ($this.offset().top - $chart.offset().top) - ($this.outerHeight(true)/2));
        $chart.css('transform', 'matrix(1, 0, 0, 1, ' + newX + ', ' + newY + ')');
      }
    });
  }
});

});
  </script>

</html>
