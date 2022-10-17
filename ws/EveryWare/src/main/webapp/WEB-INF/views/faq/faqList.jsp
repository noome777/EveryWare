<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<style>
</style>
</head>
<body class="vertical  light">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/common/sidemenu-content.jsp" %>
    
    <div class="wrapper">

      <main role="main" class="main-content">

        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
    
			    <div class="w-50 mx-auto text-center justify-content-center py-5 my-5">
			       <!-- 도와드릴까여? -->
			       <h2 class="page-title mb-0">FAQ</h2>
			       <p class="lead text-muted mb-4">자주하는 질문</p>
			       
			       <!-- 검색창 -->
			       <form class="searchform searchform-lg">
			       <input class="form-control form-control-lg bg-white rounded-pill pl-5" type="search" placeholder="검색어를 입력하세요" aria-label="Search">
			       <p class="help-text mt-2 text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
			       </form>
			     </div>
		     
		      </div> <!-- .col-12 -->
           </div> <!-- .row -->
         </div> <!-- .container-fluid -->
		     
		     
		    <!-- 드롭다운 (자주하는 질문) -->
		     <div class="row my-4">
                <div class="col-md-6">
                  <div class="accordion w-100" id="accordion1">
                    <div class="card shadow">
                      <div class="card-header" id="heading1">
                        <a role="button" href="#collapse1" data-toggle="collapse" data-target="#collapse1" aria-expanded="false" aria-controls="collapse1">
                          <strong>파일이란 무엇인가요?</strong>
                        </a>
                      </div>
                      <div id="collapse1" class="collapse show" aria-labelledby="heading1" data-parent="#accordion1">
                        <div class="card-body"> 파일은 다양한 자료를 개인적으로 저장하거나 팀원이나 동료 혹은 외부 협업자들에게 공유할 수 있는 기능을 제공하는 드라이브 솔루션입니다. </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading2">
                        <a role="button" href="#collapse2" data-toggle="collapse" data-target="#collapse2" aria-expanded="false" aria-controls="collapse2">
                          <strong>외부 링크 공유가 무엇인가요?</strong>
                        </a>
                      </div>
                      <div id="collapse2" class="collapse" aria-labelledby="heading2" data-parent="#accordion1">
                        <div class="card-body"> '외부 공유 링크' 기능은 외부 사람에게 자료를 공유할 수 있는 기능입니다. 
                        공유하고자 하는 폴더를 선택 후 [공유 > 외부 링크 공유]를 선택하여 링크 URL을 생성할 수 있습니다.
                        단, 외부 링크는 기본 7일, 옵션 선택적으로 14일간 유지됩니다. </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading3">
                        <a role="button" href="#collapse3" data-toggle="collapse" data-target="#collapse3" aria-expanded="false" aria-controls="collapse3">
                          <strong>외부 공유 링크 페이지에 접근하려면 어떻게 해야하나요?</strong>
                        </a>
                      </div>
                      <div id="collapse3" class="collapse" aria-labelledby="heading3" data-parent="#accordion1">
                        <div class="card-body"> '외부 링크 공유' 페이지 URL로 접근하게 될 경우 공유 설정에 따라 3가지 화면을 보실 수 있습니다. <hr>
						<br>• 링크가 있는 모든 사람에게 공개 → 바로 드라이브 공개 페이지로 접근
						<br>• 같은 오피스 사용자에게 공개 → 오피스 로그인 페이지로 접근, 로그인 이후 파일 공유 페이지 접근가능
						<br>• 비밀번호를 아는 사람에게 공개 → 비밀번호 입력 페이지로 접근, 비밀번호 입력 후 파일 공유 페이지 접근가능
						<br>단, 유효기간이 만료된 링크로 접근 시에는 '요청하신 링크 공유 폴더를 찾을 수 없습니다.'라는 안내 문구가 표시됩니다. </div>
                      </div>
                    </div>
                  </div>
                </div> <!-- /.col -->
                <div class="col-md-6">
                  <div class="accordion w-100" id="accordion2">
                    <div class="card shadow">
                      <div class="card-header" id="heading4">
                        <a role="button" href="#collapse4" data-toggle="collapse" data-target="#collapse4" aria-expanded="false" aria-controls="collapse4">
                          <strong>결재자가 결재 양식을 수정할 수 있나요?</strong>
                        </a>
                      </div>
                      <div id="collapse4" class="collapse show" aria-labelledby="heading4" data-parent="#accordion2">
                        <div class="card-body"> 결재자의 경우, 결재선 변경은 가능하나 결재 양식 등 내용 수정은 불가합니다.
						내용 수정이 필요한 경우, 결재자는 반려 후 하단 [의견]을 작성해 기안자가 문서를 재기안할 수 있도록 요청합니다. 
						사내 정책에 따라 기안자와 협의가 가능한 경우, 기안자가 내용 수정 또는 기안 취소를 하는 방식으로 진행할 수도 있습니다. </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading5">
                        <a role="button" href="#collapse5" data-toggle="collapse" data-target="#collapse5" aria-expanded="false" aria-controls="collapse5">
                          <strong>결재 중인 문서를 수정하거나 취소할 수 있나요?</strong>
                        </a>
                      </div>
                      <div id="collapse5" class="collapse" aria-labelledby="heading5" data-parent="#accordion2">
                        <div class="card-body">기안자가 기안 내용 수정이 필요하다고 판단했을 경우, 결재 진행 중에도 수정할 수 있습니다.
						단, 내용을 수정하는 동안에도 결재는 진행되지만, 내용 수정이 완료되면 기존 결재 내역이 모두 초기화되니 유의해주셔야 합니다.  </div>
                      </div>
                    </div>
                    <div class="card shadow">
                      <div class="card-header" id="heading6">
                        <a role="button" href="#collapse6" data-toggle="collapse" data-target="#collapse6" aria-expanded="false" aria-controls="collapse6">
                          <strong>다음 결재자가 부재한 경우 어떻게 하면 되나요?</strong>
                        </a>
                      </div>
                      <div id="collapse6" class="collapse" aria-labelledby="heading6" data-parent="#accordion2">
                        <div class="card-body">결재 순서가 순차 결재로 되어있는 경우, 같은 결재선 내에서 선결재, 합의 또는 처리 먼저 결재, 대결, 후결 등의 결재 방식을 일부 허용으로 변경하여, 부재한 결재자를 대신하여 다른 결재자가 먼저 결재할 수 있도록 설정할 수 있습니다. </div>
                      </div>
                    </div>
                  </div>
                </div> <!-- /.col -->
              </div> <!-- end section -->
              
              
		     
	 </main>
	</div>
		
</body>
</html>