<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
  <nav>
        <!-- <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a> -->
        <ul class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="${root}">
              <img src="${root}/resources/img/EveryWareLogo.png" alt="" class="logo">
            </a>
          </div>
          
          <div class="btn-box w-100 mt-4 mb-1">
            <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="location.href='${root}/approval/write'">
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
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">전체</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">진행</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">대기</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">확인</span></a>
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
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">전체</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">기안</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">결재</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">수신</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">회람/참조</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1 item-text">반려</span></a>
                </li>
              </ul>
            </li>
          </ul>  

          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="${root}/approval/storage" aria-expanded="false" class="nav-link">
                <i class="fe fe-edit fe-16"></i>
                <span class="ml-3 item-text">임시저장</span>
              </a>
            </li>
          </ul>

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
                  <a class="nav-link pl-3" href="${root}/approval/formManager"><span class="ml-1">양식 관리</span></a>
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1">전체 문서 목록</span></a>
                  <a class="nav-link pl-3" href="${root}/approval/list"><span class="ml-1">삭제 문서 목록</span></a>
                  <a class="nav-link pl-3" href="${root}/approval/approvalAdmin"><span class="ml-1">전자결재 관리자</span></a>
                </ul>
              </li>
            </ul>
        </nav>
      </aside>