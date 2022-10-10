<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
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
            <button type="button" class="btn mb-2 btn-primary btn-lg btn-block" onclick="location.href='${root}/approval/approvalInsert'">
              <i class="fe fe-file-plus fe-12 mr-2"></i><span class="small">피드백 보내기</span>
            </button>
          </div>
          
          <ul class="navbar-nav flex-fill w-100 mb-2">
            <li class="nav-item dropdown">
              <a href="#ui-elements" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-edit-3 fe-16"></i>
                <span class="ml-3 item-text ">받은 피드백</span>
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
            
            <li class="nav-item dropdown">
              <a href="#forms" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle nav-link">
                <i class="fe fe-inbox fe-16"></i>
                <span class="ml-3 item-text">보낸 피드백</span>
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
            
          
        </nav>
      </aside>