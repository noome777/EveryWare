<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head></head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.ui-droppable {
		background-color: rgba(27, 104, 255, 0.4) !important;
		border-radius: 8px !important;
		color : black !important;
	}
	
	.jOrgChart {
		left-padding : 200px;
	}
</style>


    <link rel="stylesheet" href="/EveryWare/resources/css/organization/jquery.jOrgChart.css"/>
    <link rel="stylesheet" href="/EveryWare/resources/css/organization/custom.css"/>
    <link href="/EveryWare/resources/css/organization/prettify.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.16/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/EveryWare/resources/js/organization/prettify.js"></script>
    <script src="/EveryWare/resources/js/organization/jquery.jOrgChart.js"></script>

    <script>
    jQuery(document).ready(function() {
        $("#org").jOrgChart({
            chartElement : '#chart',
            dragAndDrop  : true
        });
    });
    </script>
    
    <div class="wrapper">
	    <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center my-3 margin">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">조직도</h2>
                </div>
              </div>
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                  
    
				    <ul id="org" style="display:none">
				    <li>
				       Food
				       <ul>
				         <li id="beer">Beer</li>
				         <li>Vegetables
				           <a href="http://wesnolte.com" target="_blank">Click me</a>
				           <ul>
				             <li>Pumpkin</li>
				             <li>
				                <a href="http://tquila.com" target="_blank">Aubergine</a>
				                <p>A link and paragraph is all we need.</p>
				             </li>
				           </ul>
				         </li>
				         <li class="fruit">Fruit
				           <ul>
				             <li>Apple
				               <ul>
				                 <li>Granny Smith</li>
				               </ul>
				             </li>
				             <li>Berries
				               <ul>
				                 <li>Blueberry</li>
				                 <li><img src="images/raspberry.jpg" alt="Raspberry"/></li>
				                 <li>Cucumber</li>
				               </ul>
				             </li>
				           </ul>
				         </li>
				         <li>Bread</li>
				         <li class="collapsed">Chocolate
				           <ul>
				             <li>Topdeck</li>
				             <li>Reese's Cups</li>
				           </ul>
				         </li>
				       </ul>
				     </li>
				   </ul>            
				    
				    <div id="chart" class="orgChart"></div>

                 
                </div>
              </div>
            </div>
            </div>
      </div>
      </main>
    </div>
</body>

 <script>
        jQuery(document).ready(function() {
            
            /* Custom jQuery for the example */
            $("#show-list").click(function(e){
                e.preventDefault();
                
                $('#list-html').toggle('fast', function(){
                    if($(this).is(':visible')){
                        $('#show-list').text('Hide underlying list.');
                    }else{
                        $('#show-list').text('Show underlying list.');  
                    }
                });
            });
            
            $('#list-html').text($('#org').html());
            
            $("#org").bind("DOMSubtreeModified", function() {
                $('#list-html').text('');
                
                $('#list-html').text($('#org').html());
                
                prettyPrint();                
            });
        });
    </script>



</html>
