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
	#login-logo{
	   width: 280px;
	   height: 280px;
	   margin-top: 30px;
	}

  #search-id{
    margin-right: 50px;
  }
  #search-pwd, #search-id{
    margin-left: 35px;
  }
  .swal-wide{
    width: 600px !important;
  } 
</style>
</head>
<!-- jQuery -->
<script src="https://cdn.staticfile.org/jquery/3.1.1/jquery.min.js"></script>
<!-- sweet alert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
        <div class="col-lg-3 col-md-4 col-10 mx-auto text-center" method="post">
          <img alt="login-logo" id="login-logo" src="${root}/resources/img/EveryWareLogoSmall.png"><br><br>
          <h1 class="h6 mb-3">Sign in</h1>
          <div class="form-group">
            <label for="inputId" class="sr-only">ID</label>
            <input type="text" name="empId" id="empId" value="${cookie.saveId.value}" class="form-control form-control-lg" placeholder="ID" required="" autofocus="">
          </div>
          <div class="form-group">
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" name="empPwd" id="empPwd" class="form-control form-control-lg" placeholder="Password" required="">
          </div>
          <div class="checkbox mb-3">
            <label>
            <input type="checkbox" value="true" id="saveId" name="saveId"> Stay logged in </label>
          </div>
          <button class="btn btn-lg btn-primary btn-block" id="loginBtn">Let me in</button><br>
          <a href="${root}/emp/searchId" id="search-id">search ID </a>
          |
          <a href="${root}/emp/mailMain" id="search-pwd">  search Password</a>
          <p class="mt-5 mb-3 text-muted">© 2022</p>
        </div>
      </div>
    </div>
   

<script>
  const loginBtn = document.querySelector('#loginBtn');
  loginBtn.addEventListener('click', function(){

  const empId = document.querySelector('#empId').value;
  const empPwd = document.querySelector('#empPwd').value;
  const saveId = document.querySelector('#saveId').value;

    $.ajax({
      url: "${root}/emp/login",
      type: "POST",
      data: {"empId" : empId , "empPwd" : empPwd, "saveId" : saveId},
      success: function(data){
        console.log(data);

        if(data == 'success'){
          location.href='${root}';
        }else{
          Swal.fire({
            title : '아이디 또는 비밀번호를 확인해주세요',
            customClass: 'swal-wide',

          });
        }
      },
      error: function(){
        alert('ajax 통신 실패');
      }

    });

  });

</script>
</body>
</html>