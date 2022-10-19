<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
  .non-scroll{overflow:hidden}
</style>

<aside class="sidebar-left border-right bg-white shadow non-scroll" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="${root}">
              <img src="${root}/resources/img/EveryWareLogo.png" alt="" class="logo">
            </a>
          </div>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>기능</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-user fe-16"></i>
                <span class="ml-3 item-text">인사</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="ui-elements">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/organization/info"><span class="ml-1 item-text">임직원 정보</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/organization/management/chart"><span class="ml-1 item-text">조직도</span></a>
                </li>
              </ul>
            </li>
            <li class="nav-item w-100">
              <a class="nav-link" href="${root}/commute/main">
                <i class="fe fe-layers fe-16"></i>
                <span class="ml-3 item-text">근태</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="${root}/approval/list" aria-expanded="false" class="nav-link">
                <i class="fe fe-check-square fe-16"></i>
                <span class="ml-3 item-text">전자결재</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#tables" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">일정</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="tables">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/calendar/personal/select"><span class="ml-1 item-text">개인 일정</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/calendar/department/select"><span class="ml-1 item-text">부서 일정</span></a>
                </li>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a href="#charts" aria-expanded="false" class="nav-link">
                <i class="fe fe-flag fe-16"></i>
                <span class="ml-3 item-text">그룹</span>
              </a>
            </li>
          </ul>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>Other</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item w-100">
              <a class="nav-link" href="calendar.html">
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">예약</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#contact" aria-expanded="false" class=" nav-link">
                <i class="fe fe-book fe-16"></i>
                <span class="ml-3 item-text">주소록</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#profile" aria-expanded="false" class="nav-link">
                <i class="fe fe-user fe-16"></i>
                <span class="ml-3 item-text">공지사항</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="${root}/filemanager/select" aria-expanded="false" class="nav-link">
                <i class="fe fe-folder fe-16"></i>
                <span class="ml-3 item-text">파일 매니저</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="#support" aria-expanded="false" class="nav-link">
                <i class="fe fe-compass fe-16"></i>
                <span class="ml-3 item-text">FAQ</span>
              </a>
            </li>
             <li class="nav-item dropdown">
              <a href="#support" aria-expanded="false" class="nav-link">
                <i class="fe fe-mail fe-16"></i>
                <span class="ml-3 item-text">이메일</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="${root}/feedback/main" aria-expanded="false" class="nav-link">
                <i class="fe fe-send fe-16"></i>
                <span class="ml-3 item-text">피드백</span>
              </a>
            </li>
          </ul>
        </nav>
      </aside>