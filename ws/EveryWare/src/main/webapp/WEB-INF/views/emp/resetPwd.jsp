<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>
<c:set var="alertMsg" value="${sessionScope.alertMsg}"/>
<c:if test="${not empty alertMsg}">
    <script>
      alert('${alertMsg}');
    </script>
</c:if>
<c:remove var="alertMsg" scope="session" />
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
  .swal-wide{
    width: 800px !important;
  } 
	
</style>
</head>
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

    <form action="${root}/emp/resetPwd" method="post">
        <div class="wrapper vh-100">
        <div class="row align-items-center h-100">
            <div class="col-lg-3 col-md-4 col-10 mx-auto text-center">
            <div class="wrapper vh-100">
            <a href="${root}/emp/login">
            <img alt="searchId-logo" id="searchId-logo" src="${root}/resources/img/EveryWareLogo.png"><br><br>
            </a>
            <h1 class="h6 mb-3">Reset Password</h1>
            <div class="form-group">
                <label for="inputId" class="sr-only">ID</label>
                <input type="text" name="empId" id="empId" class="form-control form-control-lg" placeholder="ID" required="" autofocus="">
              </div>
            <div class="form-group">
                <label for="inputTempPwd" class="sr-only">Temp Password</label>
                <input type="password" id="inputTempPwd" name="empPwd" class="form-control form-control-lg" placeholder="Temp Password" required="" autofocus="">
            </div>
            <div class="form-group email">
                <label for="inputNewPwd" class="sr-only">New Password</label>
                <input type="password" id="inputNewPwd" name="empPwd" class="form-control form-control-lg" placeholder="New Password" required="">
            </div>
            <button class="btn btn-lg btn-outline-primary btn-block" id="updatePwdBtn" type="submit" onclick=" return checkData();"> Update New Password</button><br><br><br><br><br><br>
            <div>Do you want to sing in? 
            <a href="${root}/emp/login">Sing in</a>
            </div>
            <p class="mt-5 mb-3 text-muted">© 2022</p>
            </div>
        </div>
        </div>
    </form>



<script>
//비밀번호 유효성 검사
 function checkData(){

    const pwd = $("#inputNewPwd").val();
    const pwdNum = pwd.search(/[0-9]/g);
    const pwdEng = pwd.search(/[a-z]/ig);
    const pwdSpe = pwd.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
    
    if(pwd.length < 8 || pwd.lengthd > 20){
    alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
    return false;
    }else if(pwd.search(/\s/) != -1){
    alert("비밀번호는 공백 없이 입력해주세요.");
    return false;
    }else if( (pwdNum < 0 && pwdEng < 0) || (pwdEng < 0 && pwdSpe < 0) || (pwdSpe < 0 && pwdNum < 0) ){
    alert("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
    return false;
    }

}

</script>
</body>
</html>