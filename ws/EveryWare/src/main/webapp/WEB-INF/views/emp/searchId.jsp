<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare</title>
<style>
	#searchId-logo{
    width: 500px;
    height: 70px;
    margin-left: -80px;
    margin-top: 175px;
    margin-bottom: 30px;
	}
	
	
</style>
</head>
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- jQuery -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Simple bar CSS -->
<link rel="stylesheet" href="${root}/resources/css/simplebar.css">
<!-- Fonts CSS -->
<link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<!-- Icons CSS -->
<link rel="stylesheet" href="${root}/resources/css/feather.css">
<link rel="stylesheet" href="${root}/resources/css/select2.css">
<link rel="stylesheet" href="${root}/resources/css/dropzone.css">
<link rel="stylesheet" href="${root}/resources/css/uppy.min.css">
<link rel="stylesheet" href="${root}/resources/css/jquery.steps.css">
<link rel="stylesheet" href="${root}/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="${root}/resources/css/quill.snow.css">
<!-- Date Range Picker CSS -->
<link rel="stylesheet" href="${root}/resources/css/daterangepicker.css">
<!-- App CSS -->
<link rel="stylesheet" href="${root}/resources/css/app-light.css" id="lightTheme">
<!-- <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled> -->
<body style="width: 100%; overflow-x: hidden;">
      
      <div class="wrapper vh-100">
      <div class="row align-items-center h-100">
        <div id="formSerial" class="col-lg-3 col-md-4 col-10 mx-auto text-center" method="post">
         <div class="wrapper vh-100">
         <a href="${root}/emp/login">
          <img alt="searchId-logo" id="searchId-logo" src="${root}/resources/img/EveryWareLogo.png"><br><br>
         </a>
          <h1 class="h6 mb-3">Find ID</h1>
          <div class="form-group">
            <label for="inputName" class="sr-only">Name</label>
            <input type="text" id="empName" name="empName" class="form-control form-control-lg" placeholder="Name" required="" autofocus="">
          </div>
          <div class="form-group text">
            <label for="inputTel" class="sr-only">Phone</label>
            <input type="tel" id="empPhone" name="empPhone" class="form-control form-control-lg" placeholder="Please enter your phone without '-'" required="">
          </div>
          <button class="btn btn-lg btn-outline-primary btn-block" id="findIdBtn">Find</button><br><br>
          <!-- ajax로 변환 예정 -->
          <!-- <div id="findIdResult"><h3>Your ID is <mark id="findId">${idVo.empEMail}<mark></h3></div><br><br><br> -->
          <div>Don't you remember your PWD? 
          <a href="${root}/emp/searchPwd"> Find PWD</a>
          </div>
        
          <p class="mt-5 mb-3 text-muted">© 2022</p>
        </div>
      </div>
    </div>
 

    
<script>
  const findIdBtn = document.querySelector('#findIdBtn');
  findIdBtn.addEventListener('click', function(){

  const empName = document.querySelector('#empName').value;
  const empPhone = document.querySelector('#empPhone').value;
  const sendData = {"empName" : empName, "empPhone" : empPhone}

    $.ajax({
      url: "${root}/emp/searchId",
      type: "POST",
      data: sendData,
      success: function(data){
        const email = data['empEMail'];
        Swal.fire('당신의 이메일 주소는 ' + email +' 입니다');

      },
      error: function(error){
        console.log(error);
        Swal.fire({
            title : '회원정보가 일치하지 않습니다.',
            icon : 'warning'
          });

      }
      
    });

});


</script>



</body>
</html>
