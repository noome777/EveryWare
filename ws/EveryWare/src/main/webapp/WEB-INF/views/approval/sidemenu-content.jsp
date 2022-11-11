<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
      *{
        box-sizing: border-box; 
      }
      .non-scroll{
        overflow: auto;
      }
      .appr-table-color{
        background-color: rgb(244, 249, 255);
      }
      .appr-font-color{
        color: rgb(119, 118, 118);
      }
    </style>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <c:set var="apprWaitCount" value="${sessionScope.apprWaitCount}" />
    <c:set var="apprProgCount" value="${sessionScope.apprProgCount}" />
    <c:set var="apprRefCount" value="${sessionScope.apprRefCount}" />
    <c:set var="apprExpectCount" value="${sessionScope.apprExpectCount}" />
  <nav>
        <ul class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="${root}">
              <img src="${root}/resources/img/EveryWareLogo.png" alt="" class="logo">
            </a>
          </div>
          
          <div class="btn-box w-100 mt-4 mb-1">
            <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="location.href='${root}/approval/write/0'">
              <i class="fe fe-file-plus fe-12 mr-2"></i><span class="small">작성하기</span>
            </button>
          </div>
          
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-edit-3 fe-16"></i>
                <span class="ml-3 item-text ">진행 중인 문서</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="ui-elements">
                <li class="nav-item">
                  <a class="nav-link pl-3 d-flex align-items-center justify-content-between" href="${root}/approval/progressAllList/1/0"><span class="ml-1 item-text">부서전체</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3 d-flex align-items-center justify-content-between" href="${root}/approval/progressList/1/0"><span class="ml-1 item-text">진행</span>
                 	     <span class="mr-4" id="apprProgCount"></span>
                  </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link pl-3 d-flex align-items-center justify-content-between" href="${root}/approval/progressWaitList/1/0"><span class="ml-1 item-text">대기</span>
                      <span class="mr-4" id="apprWaitCount"></span>
                    </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3 d-flex align-items-center justify-content-between" href="${root}/approval/progressRefList/1/0"><span class="ml-1 item-text">확인</span>
                 	     <span class="mr-4" id="refCount"></span>
                  </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link pl-3 d-flex align-items-center justify-content-between" href="${root}/approval/progressExpectedList/1/0"><span class="ml-1 item-text">예정</span>
                 	     <span class="mr-4" id="apprExpectCount"></span>
                    </a>
                </li>
                
                
                
                
              </ul>
            </li>
          </ul>

          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-inbox fe-16"></i>
                <span class="ml-3 item-text">문서함</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="forms">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/completAllList/1/0"><span class="ml-1 item-text">부서전체</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/completWriteList/1/0"><span class="ml-1 item-text">기안</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/completApprList/1/0"><span class="ml-1 item-text">결재</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/completRefList/1/0"><span class="ml-1 item-text">참조</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/unApprList/1/0"><span class="ml-1 item-text">반려</span></a>
                </li>
              </ul>
            </li>
          </ul>  

          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="${root}/approval/storage/1/0" aria-expanded="false" class="nav-link">
                <i class="fe fe-edit fe-16"></i>
                <span class="ml-3 item-text">임시저장</span>
              </a>
            </li>
          </ul>

          <c:if test="${loginMember.rightCode eq 1 || loginMember.rightCode eq 3}">
            <p class="text-muted nav-heading mt-4 mb-1">
              <span>admin</span>
            </p>
            <ul class="navbar-nav flex-fill w-100 mb-2">
              <li class="nav-item dropdown">
                <a href="#contact" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                  <i class="fe fe-settings fe-16"></i>
                  <span class="ml-3 item-text">설정</span>
                </a>
                <ul class="collapse list-unstyled pl-4 w-100" id="contact">
                  <li class="nav-item">
                    <a class="nav-link pl-3" href="${root}/approval/formManager"><span class="ml-1">양식 관리</span></a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link pl-3" href="${root}/approval/approvalAllList/1/0"><span class="ml-1">전체 문서 목록</span></a>
                  </li>                  
                  <li class="nav-item">
                    <a class="nav-link pl-3" href="${root}/approval/approvalDeleteList/1/0"><span class="ml-1">삭제 문서 목록</span></a>
                  </li>
                </ul>
              </li>
            </ul>
          </c:if>
        </nav>
      </aside>

      <script>
        window.onload  = function () {
          $.ajax({
            url : "${root}/approval/count",
            method : "GET",
            dataType : 'json',
            success : function (data) {
              if(data.apprProgCount > 0) $('#apprProgCount').append(data.apprProgCount);
              if(data.apprWaitCount > 0) $('#apprWaitCount').append(data.apprWaitCount);
              if(data.apprRefCount > 0) $('#refCount').append(data.apprRefCount);
              if(data.apprExpectCount > 0) $('#apprExpectCount').append(data.apprExpectCount);
            }
          });
        }
      </script>