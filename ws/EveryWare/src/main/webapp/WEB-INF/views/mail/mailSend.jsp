<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일홈 </title>
<style>
  
  #mailReceive {
  	font-size: 20px;
  }
  
  #maillist {
	margin-top: 30px;  
  }
  
 
  .search-txt{
  	border-radius: 3px;
  	
  }
 
 .search-btn {
 	border-radius: 3px;
  	background-color: white;
 }
  
  .buttonSet{
  	margin-bottom:20px;
  }


</style>
</head>
<body>
	<div class="wrapper" style="background-color: white">
	
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/mail/sidemenu-content.jsp" %>
    <div class="main-content">
		
		<h2 id="mailSend">보낸 메일함</h2>
		<br>
		<div class="input-group w-50">
		    <input class="search-txt" type="text" placeholder="메일 검색" id="basic-addon1"> 
		    <button class="search-btn" type="submit">
		    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
			  	<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
			</svg>
			</button>
		</div>
		<!-- <div class="input-group w-50" >
		<span class="input-group-text" id="basic-addon1">
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  		<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"></path>
		</svg>
		</span>
		<input type="text" class="form-control" aria-label="mailSearch" id="mailSearch" placeholder="메일검색"  aria-describedby="basic-addon1">
		</div> -->
		
		<br>
		 	<div class="buttonSet">
		 		<button type="button" id="sendBtn" class="btn btn-primary">삭제</button>
		 		<button type="button" id="cancelBtn" class="btn btn-primary">답장</button>
		 	</div>
		 	
		 	 <div class="card shadow">
         		 <div class="card-body">
		
		<table class="table table-striped" id="maillist">
		
        <tr>
        	<th></th>
           	<th>발신자</th>
            <th>제목</th>
            <th>작성일</th>
        </tr>
        <tbody>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요2</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요3</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요4</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요5</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요6</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요7</td>
            <td>12:12</td>
        </tr>
        <tr>
        	<td><input type="checkbox" name="xxx" value="yyy" ></td>
           	<td>EVERYWARE</td>
            <td>안녕하세요8</td>
            <td>12:12</td>
        </tr>
             
		</tbody>
	</table>
           <nav aria-label="Page navigation example">
 			<ul class="pagination justify-content-center mb-0">
		    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item"><a class="page-link" href="#">Next</a></li>
		  </ul>
		</nav>
           
	</div>
	 </div>
	 	</div>
	 </div>
</body>
</html>