<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록_수정</title>
<style>
.edit-box{
margin: 10px;
}
.btn{
margin-left: 5px;
}
</style>
</head>
<body class="vertical  light  ">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/common/sidemenu-content.jsp" %>

<div class="wrapper">
   <main role="main" class="main-content">
     
	<div class="card shadow mb-4">
      <div class="card-header">
        <strong class="card-title">상세보기</strong>
      </div>
       
     <div class="card shadow">
       <div class="card-body">
       
        <table class="table table-borderless table-hover">
        <div class="edit-box">
          <form "action="" method="post" enctype="multipart/form-data">
           <label for="simpleinput">Name</label>
            <input type="text" id="simpleinput" class="form-control" placeholder="Name" name="conName" value="${vo.conName}">
           <label for="example-email">Email</label>
             <input type="email" id="example-email" class="form-control" placeholder="Email" name="conEmail" value="${vo.conEmail}">
           <label for="simpleinput">Phone</label>
            <input type="text" id="simpleinput" class="form-control" placeholder="Phone" name="conTel" value="${vo.conTel}">
           <label for="simpleinput">Company</label>
            <input type="text" id="simpleinput" class="form-control" placeholder="Company" name="conCompany" value="${vo.conCompany}">
           <label for="example-textarea">Memo</label>
            <textarea class="form-control" id="example-textarea" rows="4" name="conMemo">${vo.conMemo}</textarea>
           <label for="customFile">Image file</label>
           <div class="custom-file">
            <input type="file" class="custom-file-input" id="customFile" name="profile">
            <label class="custom-file-label" for="customFile">Choose file</label>
           </div>
           <div id="profile-tumb">
                <img src="${root}/resources/upload/profile/${vo.fileName}" width="20%" height="20%">
            </div>
	       </div>
	       </table>  
         
       </div> 
      </div>
     </div> <!-- /card -->
     
     <button type="button" class="btn mb-2 btn-secondary float-right" onclick="history.back()">뒤로가기</button> 
     <button type="submit" class="btn mb-2 btn-primary float-right">저장하기</button>
     </form>
        
   </main>
</div>


</body>
</html>