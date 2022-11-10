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
              <a class="nav-link" href="${root}/commute/main/1">
                <i class="fe fe-layers fe-16"></i>
                <span class="ml-3 item-text">근태</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link d-flex flex-row justify-content-between" id="approval" href="${root}/approval/progressAllList/1/0" aria-expanded="false" class="nav-link">
                <div>
                  <i class="fe fe-check-square fe-16"></i>  
                  <span class="ml-3 item-text">전자결재</span>
                </div>
                <span id="apprNoti" class="justify-self-end"></span>
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
              <a class="nav-link" href="${root}/booking/bookingList/1">
                <i class="fe fe-calendar fe-16"></i>
                <span class="ml-3 item-text">예약</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="${root}/contacts/contactList/1" aria-expanded="false" class=" nav-link">
                <i class="fe fe-book fe-16"></i>
                <span class="ml-3 item-text">주소록</span>
              </a>
            </li>
            <li class="nav-item dropdown">
              <a href="${root}/notice/noticeMain/1" aria-expanded="false" class="nav-link">
               <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building" viewBox="0 0 16 16">
				  <path fill-rule="evenodd" d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022zM6 8.694 1 10.36V15h5V8.694zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5V15z"/>
				  <path d="M2 11h1v1H2v-1zm2 0h1v1H4v-1zm-2 2h1v1H2v-1zm2 0h1v1H4v-1zm4-4h1v1H8V9zm2 0h1v1h-1V9zm-2 2h1v1H8v-1zm2 0h1v1h-1v-1zm2-2h1v1h-1V9zm0 2h1v1h-1v-1zM8 7h1v1H8V7zm2 0h1v1h-1V7zm2 0h1v1h-1V7zM8 5h1v1H8V5zm2 0h1v1h-1V5zm2 0h1v1h-1V5zm0-2h1v1h-1V3z"/>
				</svg>
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
              <a href="${root}/faq/faqList" aria-expanded="false" class="nav-link">
                <i class="fe fe-compass fe-16"></i>
                <span class="ml-3 item-text">FAQ</span>
              </a>
            </li>
             <li class="nav-item dropdown">
              <a href="${root}/mail/main" aria-expanded="false" class="nav-link">
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

      <script>
        window.onload  = function () {
          $.ajax({
            url : "${root}/approval/count",
            method : "GET",
            dataType : 'json',
            success : function (data) {
              if(parseInt(data.apprProgCount + data.apprWaitCount + data.apprRefCount + data.apprExpectCount) > 1){
                $('#apprNoti').addClass("dot dot-md bg-success");
              } else if(parseInt(data.apprProgCount + data.apprWaitCount + data.apprRefCount + data.apprExpectCount) > 1){
                $('#apprNoti').removeClass("dot dot-md bg-success");
              } 
            }
          });
        }
      </script>