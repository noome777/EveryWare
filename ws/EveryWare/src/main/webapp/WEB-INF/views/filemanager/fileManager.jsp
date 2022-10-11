<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  	/* body 스타일 */  
  	body {    
	  	margin-top: 40px;    
	  	font-size: 14px;    
	  	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;  
  	}


	#fileMain{
		margin-right:5%;
		width: 80%;
		height: 100%;
		float: right;
	}
</style>
</head>
<body>
    <div class="wrapper">
      <%@ include file="/WEB-INF/views/common/header.jsp" %>
      <%@ include file="/WEB-INF/views/filemanager/sidemenu-content.jsp" %>
     </div>
     
 
     <div id="fileMain">
     	<%@ include file="/WEB-INF/views/filemanager/fileManager-content.jsp" %>
     </div>
</body>
</html>