<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

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
                  <div id="chart_div"></div>
                </div>
              </div>
            </div>
            </div>
      </div>
      </main>
    </div>
</body>


<script type="text/javascript">
  google.charts.load('current', {packages:["orgchart"]});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'Name');
    data.addColumn('string', 'Manager');
    data.addColumn('string', 'ToolTip');

    // For each orgchart box, provide the name, manager, and tooltip to show.
    data.addRows([
      [{'v':'Mike', 'f':'Mike<div style="color:red; font-style:italic">President</div>'},
       '', 'The President'],
      [{'v':'Jim', 'f':'Jim<div style="color:red; font-style:italic">Vice President</div>'},
       'Mike', 'VP'],
      ['Alice', 'Mike', ''],
      ['Bob', 'Jim', 'Bob Sponge'],
      ['Carol', 'Bob', '']
    ]);

    // Create the chart.
    var chart = new google.visualization.OrgChart(document.getElementById('chart_div'));
    // Draw the chart, setting the allowHtml option to true for the tooltips.
    chart.draw(data, {'allowHtml':true});
  }
</script>
</html>
