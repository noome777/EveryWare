<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
  .card{
    margin: 10px 30px;
  }
  .form-group{
    width: 150px;
    margin-left: 30px;
  }
  .pagination{
  	margin-top: 60px;
  }
  #delete-all:hover{
    color: rgb(72, 72, 243);
    cursor: pointer;
  }
</style>
</head>
<body class="vertical  light  ">
  
  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
  <main role="main" class="main-content">

    
    <div class="form-group mb-3">
      <select class="custom-select" id="custom-select">
        <option value="0" selected>전체</option>
        <c:forEach items="${formList}" var="f">
            <option value="${f.formCode}" <c:if test="${selectedFormCode == f.formCode}">selected="selected"</c:if>>${f.formName}</option>
          </c:forEach>
      </select>
    </div>
    <div class="card shadow">
      <div class="card-body">
        <table class="table table-hover">
          <thead>
            <tr>
              <th>문서종류</th>
              <th>제목</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${docList}" var="d">
            <tr onclick="location.href='${root}/approval/approvalDocDetail/${d.docCode}'">
              <td>${d.formName}</td>
              <td>${d.docTitle}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        
        <nav aria-label="Table Paging" class="my-3">
          <ul class="pagination justify-content-center mb-0">
            <c:if test="${pv.startPage ne 1}">
              <li class="page-item"><a class="page-link" href="${root}/approval/storage/${pv.startPage - 1}/${selectedFormCode}">Previous</a></li>
            </c:if>
            <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
              <li class="page-item"><a class="page-link" href="${root}/approval/storage/${i}/${selectedFormCode}">${i}</a></li>
            </c:forEach>
            <c:if test="${pv.endPage ne pv.maxPage}">
              <li class="page-item"><a class="page-link" href="${root}/approval/storage/${pv.endPage + 1}/${selectedFormCode}">Next</a></li>
            </c:if>
          </ul>
        </nav>
      </div>
    </div>
    <div class="form-group mb-3">
      <span id="delete-all">전체 삭제</span>
    </div>
  </main>

  <script>
    $('#custom-select').on('change', function () {
      let docFormCode = $('#custom-select option:selected').val();
      location.href='${root}/approval/storage/1/' + docFormCode;
    })

    $('#delete-all').on('click', function () {

      if($('tbody tr').length > 0){
        if(confirm('임시저장된 문서를 전체 삭제 하시겠습니까?')){
          $.ajax({
            url : '${root}/approval/storageDelete',
            method : 'POST',
            success : function () {
              alert('전체삭제 완료');
            },
            error :  (error) => {
              console.log(JSON.stringify(error))
            }  
          })
        }
      } else {
        alert('삭제 할 문서가 존재하지 않습니다.');
      }
    })
  </script>
</body>
</html>