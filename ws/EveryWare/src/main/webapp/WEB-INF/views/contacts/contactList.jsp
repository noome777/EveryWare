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
                  <button type="button" class="btn btn-secondary"><span class="fe fe-trash fe-12 mr-2"></span>Delete</button>
                  
                  <!-- Modal -->
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
                        <input type="text" id="simpleinput" class="form-control" placeholder="Name">
                       <label for="example-email">Email</label>
                         <input type="email" id="example-email" name="example-email" class="form-control" placeholder="Email">
                       <label for="simpleinput">Phone</label>
                        <input type="text" id="simpleinput" class="form-control" placeholder="Phone">
                       <label for="simpleinput">Company</label>
                        <input type="text" id="simpleinput" class="form-control" placeholder="Company">
                       <label for="example-textarea">Memo</label>
                        <textarea class="form-control" id="example-textarea" rows="4"></textarea>
                       <label for="customFile">Image file</label>
                       <div class="custom-file">
                        <input type="file" class="custom-file-input" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
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
                        <th>Image</th>
                        <th>User</th>
                        <th>Company/Email</th>
                        <th>Phone</th>
                        <th>Action</th>
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
                        <td data-toggle="modal" data-target="#verticalModal">
                          <p class="mb-0 text-muted"><strong>김춘배</strong></p>
                          <small class="mb-0 text-muted">2474</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Accumsan Consulting</p>
                          <small class="mb-0 text-muted">meow10@gmail.com</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(02) 421-0798</a></p>
                        </td>
                        <td>
                        
                        <div class="btn-group" role="group" aria-label="Basic example">
                        <button type="button" class="btn mb-2 btn-primary btn-sm">Edit</button>
                        <button type="button" class="btn mb-2 btn-secondary btn-sm">Delete</button>
                        </div>
                        
                        </td>
                      </tr>
                      
                      
                      <!-- Dtail Modal -->
                      <div class="modal fade" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="verticalModalTitle">상세보기</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                            
                            <span>내용어쩌구</span>
                            
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn mb-2 btn-primary">Edit</button>
                              <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                          </div>
                        </div>
                      </div>
                      
    
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
    
</body>
</html>