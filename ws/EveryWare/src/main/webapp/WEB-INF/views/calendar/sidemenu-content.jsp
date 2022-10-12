<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
          <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
          <!-- nav bar -->
          <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="${root}">
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
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#eventModal"><span class="fe fe-plus fe-16 mr-3">
            </span>일정 추가</button>
          </div>
          <p class="text-muted nav-heading mt-4 mb-1">
            <span>일정</span>
          </p>
          <ul class="navbar-nav flex-fill w-100 mb-2">
           	<li class="nav-item dropdown">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">개인 일정</span>
              </a>
            </li>

            <li class="nav-item w-100">
              <a href="/app99/calendar/select" data-toggle="collapse" aria-expanded="false" class="nav-link">
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">부서 일정</span>
              </a>
            </li>
            
           
          </ul>
        
        </nav>
      </aside>