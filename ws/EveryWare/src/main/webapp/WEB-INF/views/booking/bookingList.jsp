<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<style>
.form-group{
    width: 150px;
    margin-left: 30px;
    margin-top: 18px;
  }
#booking-date{
	margin-top: 20px;
	margin-bottom: 20px;
}
.returnBtn{
border: 0;
outline: 0;
background-color:transparent;
}
</style>
</head>

<body class="vertical  light  ">

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%@ include file="/WEB-INF/views/common/sidemenu-content.jsp" %>

<div class="wrapper">
      
      <main role="main" class="main-content">
      
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center my-4">
              
                <div class="col">
                  <h2 class="h3 mb-0 page-title">예약 목록</h2>
                </div>
                
	           <!-- 카테고리 -->
		       <div class="form-group mb-3">
		         <select class="custom-select" id="custom-select">
		           <option selected>전체</option>
		           <option value="1">비품</option>
		           <option value="2">회의실</option>
		         </select>
		       </div>
	       
                <div class="col-auto">
                  <button type="button" class="btn btn-secondary"><span class="fe fe-trash fe-12 mr-2"></span>Delete</button>
                  
                  <!-- Button modal -->
                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#defaultModal"><span class="fe fe-filter fe-12 mr-2"></span> Create </button>
                  
                  <!-- Modal boutton-->
                  <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="defaultModalLabel">예약하기</h5>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        
                      <div class="modal-body">
                       <!-- 카테고리 선택 -->
                        <label for="example-select">자원 이름</label>
                        <select class="form-control" id="example-select">
                          <option>비품1</option>
                          <option>비품2</option>
                          <option>비품3</option>
                        </select>
                 
	                 	  <!-- 예약일자 -->      
	                      <div id="booking-date">
	                      <label for="example-date">예약기간</label>
		                 	  <div class="input-group">
		                        <input class="form-control" id="example-date" type="date" name="date">
		                        <input class="form-control" id="example-time" type="time" name="time">
		                      </div>
		                      
		                      <div class="input-group">
		                      	<input class="form-control" id="example-date" type="date" name="date">
		                        <input class="form-control" id="example-time" type="time" name="time">
		                       </div>
	                      </div>
                       </div>
                       
                         <div class="modal-footer">
                           <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
                           <button type="button" class="btn mb-2 btn-primary">저장</button>
                         </div>
                         
                       </div>
                     </div>
                   </div>
                </div>
              </div>
              
              
              <!-- table -->
              <div class="card shadow">
                <div class="card-body">
                  <table class="table table-borderless table-hover">
                  
                    <thead>
                      <tr>
                        <th>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="all2">
                            <label class="custom-control-label" for="all2"></label>
                          </div>
                        </th>
                        <th>이미지</th>
                        <th>자원명</th>
                        <th>예약 시간</th>
                        <th>상태</th>
                        <th>반납</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2474">
                            <label class="custom-control-label" for="2474"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>비품1</strong></p>
                          <small class="mb-0 text-muted">A1234</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">2020/10/10 15:00 ~ 2020/10/20 18:00</p>
                        </td>
                        <td>
                          <span class="badge badge-primary">예약중</span>
                        </td>
                        <td>
                          <button class="returnBtn" onclick="javascript:btn()"><span class="badge badge-primary">반납하기</span></button>
                        </td> 
                      </tr>
                    </tbody>
                    
                  </table>
                </div>
              </div>
              
              <!-- 페이징 -->
              <nav aria-label="Table Paging" class="my-3">
                <ul class="pagination justify-content-end mb-0">
                  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                  <li class="page-item active"><a class="page-link" href="#">1</a></li>
                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                  <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
              </nav>
              
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
        
      </main> <!-- main -->
      
    </div> <!-- .wrapper -->
    
    <script>
		function btn(){
		    alert('반납 처리 되었습니다.');
		}
	</script>

</body>
</html>