<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
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
                  <h2 class="h3 mb-0 page-title">예약</h2>
                </div>
                
                
                <div class="col-auto">
                  <button type="button" class="btn btn-secondary"><span class="fe fe-trash fe-12 mr-2"></span>Delete</button>
                  <button type="button" class="btn btn-primary"><span class="fe fe-filter fe-12 mr-2"></span>Create</button>
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
                        <th>ID</th>
                        <th>User</th>
                        <th>Company</th>
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
                            <img src="./assets/avatars/face-3.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>김춘배</strong></p>
                          <small class="mb-0 text-muted">2474</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Accumsan Consulting</p>
                          <small class="mb-0 text-muted">Ap #331-7123 Lobortis Avenue</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(958) 421-0798</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2786">
                            <label class="custom-control-label" for="2786"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-1.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>김영철</strong></p>
                          <small class="mb-0 text-muted">2786</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Fringilla Ornare Placerat Consulting</p>
                          <small class="mb-0 text-muted">287-8300 Nisl. St</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(899) 881-3833</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2747">
                            <label class="custom-control-label" for="2747"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-2.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>팔봉춘</strong></p>
                          <small class="mb-0 text-muted">2747</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Tristique Ltd</p>
                          <small class="mb-0 text-muted">4577 Cras St.</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(977) 220-6518</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2639">
                            <label class="custom-control-label" for="2639"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-4.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>김파인애플</strong></p>
                          <small class="mb-0 text-muted">2639</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Orci Luctus Et Inc.</p>
                          <small class="mb-0 text-muted">P.O. Box 228, 7512 Lectus Ave</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(537) 315-1481</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2238">
                            <label class="custom-control-label" for="2238"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-5.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>김나비</strong></p>
                          <small class="mb-0 text-muted">2238</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Sit Amet Lorem Industries</p>
                          <small class="mb-0 text-muted">Ap #377-5357 Sed Road</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(238) 386-0247</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2152">
                            <label class="custom-control-label" for="2152"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-6.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>봉미선</strong></p>
                          <small class="mb-0 text-muted">2152</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Suspendisse LLC</p>
                          <small class="mb-0 text-muted">Ap #410-5363 Non, Avenue</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(587) 675-3258</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
                        </td>
                      </tr>
                      <tr>
                        <td>
                          <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="2488">
                            <label class="custom-control-label" for="2488"></label>
                          </div>
                        </td>
                        <td>
                          <div class="avatar avatar-sm">
                            <img src="./assets/avatars/face-7.jpg" alt="..." class="avatar-img rounded-circle">
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><strong>신짱아</strong></p>
                          <small class="mb-0 text-muted">2488</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">Dolor Incorporated</p>
                          <small class="mb-0 text-muted">8250 Molestie St.</small>
                        </td>
                        <td>
                          <p class="mb-0 text-muted"><a href="#" class="text-muted">(934) 582-9495</a></p>
                        </td>
                        <td><button class="btn btn-sm dropdown-toggle more-horizontal" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="text-muted sr-only">Action</span>
                          </button>
                          <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="#">Edit</a>
                            <a class="dropdown-item" href="#">Remove</a>
                            <a class="dropdown-item" href="#">Assign</a>
                          </div>
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
    
</body>
</html>