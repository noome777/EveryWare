<%@ page language="java" contentType="text/html; charset=UTF-8"%>
    pageEncoding="UTF-8"%>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar">
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="./index.html">
              <img src="${root}/resources/img/EveryWareLogo.png" alt="" class="logo">
                <g>
                  <polygon class="st0" points="78,105 15,105 24,87 87,87 	" />
                  <polygon class="st0" points="96,69 33,69 42,51 105,51 	" />
                  <polygon class="st0" points="78,33 15,33 24,15 87,15 	" />
                </g>
              </svg>
            </a>
          </div>
          <div class="btn-box w-100 mt-4 mb-1">
            <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="location='${root}/dayoff/main'">
              <span class="small">+ 휴가 신청하기</span>
            </button>
          </div>
         
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-user fe-16"></i>
                <span class="ml-3 item-text">근태 관리</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="ui-elements">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/commute/main"><span class="ml-1 item-text">출퇴근 관리</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/commute/selectByMonth"><span class="ml-1 item-text">월 근무내역</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/commute/overwork"><span class="ml-1 item-text">시간 외 근무</span></a>
                </li>
              </ul>
            </li>
          
            <li class="nav-item dropdown">
              <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-pie-chart fe-16"></i>
                <span class="ml-3 item-text">휴가 관리</span>
              </a>
              <ul class="collapse list-unstyled pl-4 w-100" id="forms">
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/dayoff/main/1"><span class="ml-1 item-text">휴가관리</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link pl-3" href="${root}/dayoff/calendar"><span class="ml-1 item-text">휴가현황</span></a>
                </li>
              </ul>
            </li>
        </nav>
      </aside>