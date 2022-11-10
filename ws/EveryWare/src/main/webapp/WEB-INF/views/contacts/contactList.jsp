<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
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
                  <h2 class="h3 mb-0 page-title">주소록 목록</h2>
                </div>
                
                
                <div class="col-auto">
                  
                 <!-- Button trigger modal -->
                 <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#defaultModal"><span class="fe fe-filter fe-12 mr-2"></span> Create </button>
                  
                 <!-- Modal -->
                 <form action="${root}/contacts/write" method="post">
                  <div class="modal fade" id="defaultModal" tabindex="-1" role="dialog" aria-labelledby="defaultModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <div class="modal-header">
                           <h5 class="modal-title" id="defaultModalLabel">주소록 추가</h5>
                           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                             <span aria-hidden="true">&times;</span>
                           </button>
                        </div>
                        
                       <div class="modal-body">
                       <label for="simpleinput">Name</label>
                        <input type="text" id="simpleinput" class="form-control" placeholder="Name" name="conName">
                       <label for="example-email">Email</label>
                         <input type="email" id="example-email" class="form-control" placeholder="Email" name="conEmail">
                       <label for="simpleinput">Phone</label>
                        <input type="text" id="simpleinput" class="form-control" placeholder="Phone" name="conTel">
                       <label for="simpleinput">Company</label>
                        <input type="text" id="simpleinput" class="form-control" placeholder="Company" name="conCompany">
                       <label for="example-textarea">Memo</label>
                        <textarea class="form-control" id="example-textarea" rows="4" name="conMemo"></textarea>
                       <label for="customFile">Image file</label>
                       <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                       </div>
                       </div>
                       
                         <div class="modal-footer">
                           <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
                           <button type="submit" class="btn mb-2 btn-primary">저장</button>
                         </div>
                       </div>
                     </div>
                   </div>
                  </form>
                      
                </div>
              </div>
              
              
              <!-- table -->
              <div class="card shadow">
                <div class="card-body">
                  <table class="table table-borderless table-hover">
                  
                    <thead>
                      <tr>
                        <th>...</th>
                        <th>Image</th>
                        <th>User</th>
                        <th>Company/Email</th>
                        <th>Phone</th>
                        <th>Action</th>
                      </tr>
                    </thead>
                    
                    <tbody>
                    <c:forEach items="${cList}" var="list">
                    <c:if test="${ list.conWriter eq loginMember.empName }">
                      <tr>
                       <td>
                         <i class="fe fe-24 fe-circle small text-muted"></i>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <a href="${root}/contacts/detail/${list.conNo}">
                          <p class="mb-0 text-muted"><strong>${list.conName}</strong></p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">${list.conCompany}</p>
                          <small class="mb-0 text-muted">${list.conEmail}</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">${list.conTel}</p>
                        </td>
                        
                        <!-- 수정/삭제 버튼 -->
                        <td>
                        <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn mb-2 btn-primary btn-sm" data-toggle="modal" data-target="#varyModal" data-whatever="@mdo" onclick="location.href='${root}/contacts/edit/${list.conNo}';"> Edit </button>
                        <button type="button" class="btn mb-2 btn-secondary btn-sm" onclick="location.href='${root}/contacts/delete/${list.conNo}';"> Delete </button>
                        </div>
                       </td>
                      </tr>
                      
                      </c:if>
                    </c:forEach>
                    </tbody>
                    
                  </table>
                 </div>
                </div>
                  
             <!-- 페이징 -->
             <nav aria-label="Table Paging" class="my-3">
              <ul class="pagination justify-content-center mb-0">
              	<c:if test="${pv.startPage ne 1}">
            	    <li class="page-item"><a class="page-link" href="/app00/contacts/contactList/${pv.startPage - 1}">Previous</a></li>
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
                	<li class="page-item"><a class="page-link" href="/app00/contacts/contactList/${i}">${i}</a></li>
                </c:forEach>
                <c:if test="${pv.endPage ne pv.maxPage}">
           	     <li class="page-item"><a class="page-link" href="/app00/contacts/contactList/${pv.endPage + 1}">Next</a></li>
                </c:if>
               </ul>
              </nav>
                  
                
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main> <!-- main -->
      
    </div> <!-- .wrapper -->
    
    
    
    <script>

        var i = 0;
        $('i').on('click',function(){
            if(i == 0){
                $(this).attr('class','fe fe-24 fe-check-circle small text-muted');
                i++;
            }else if(i == 1){
                $(this).attr('class','fe fe-24 fe-check-circle small text-muted');
                i--;
            }
        });

    </script>
    
</body>
</html>