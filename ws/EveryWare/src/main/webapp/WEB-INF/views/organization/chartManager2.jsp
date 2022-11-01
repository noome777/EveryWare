<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../../../resources/css/organization/style.css">
	<link rel="stylesheet" href="../../../resources/css/organization/prism.css">
	<link rel="StyleSheet" href="../../../resources/css/organization/zooTree.css"/>

	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="../../../resources/js/organization/zooTree.js"></script>

	<script>

		$(document).ready(function(){

			$.ajax({
				async: false,
				type: "GET",
				url : "data/data.json",
				dataType: "json",
				cache: false,
				success:function(data){
					if(data.length == 0) {
					}else{

						$("#beforeJSON").html( JSON.stringify(data, null, "    ") );
						var jsonData = getTreeModel( data, '999',{
			            	id: "itemId",
			            	parentId: "parentId",
                            order: ["label","desc"]
						});
						$("#afterJSON").html( JSON.stringify(jsonData, null, "    ") );

						$(".verticalTree").zooTree(jsonData, {
							forceCreate: true,
							render: function(data) {
								var $a = $("<a>").append(data.label);
								return $a;
							}
						});
						$(".horizontalTree").zooTree(jsonData, {
							forceCreate: true,
							render: function(data) {
								var $a = $("<a>").append(data.label);
								return $a;
							}
						});
						$(".horizontalTreeTop").zooTree(jsonData, {
							forceCreate: true,
							render: function(data) {
								var $a = $("<a>").append(data.label);
								return $a;
							}
						});

					}
				}
			});

		});

	</script>
	<style>

	</style>



</head>
<body>

<h2>가로형 조직도(최상위계층:상단)</h2>
    <pre class="line-numbers"><code class="language-markup">&lt;div class="horizontalTreeTop"&gt;&lt;/div&gt;</code></pre>
	<div class="horizontalTreeTop"></div>

	<script src="../../../resources/js/organization/prism.js"></script>

</body>
</html>