<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
	.card{
		margin: auto;
		width: 80%;
		padding: 10px
	}
	.form-group{
		width: 100%;
	}
	#approval-table{
		margin-top: 40px;
		text-align: center;
	}
	#approval-table td{
		width: 100px;
	}
	#custom-select {
		align-items: center;
		justify-content: center;
	}
	#approval-setting-table tr{
		height: 10px;
	}
  .appr-table-color{
    background-color: rgb(244, 249, 255);
  }
  .appr-wid{
    width: 30%;
  }
  .right-btn{
    text-align: right; 
  }
  .appr-mark{
    width: 50px;
    height: 50px;
  }
  .appr-mark-td{
    width: 70px;
  }
  .center{
    text-align: center;
    align-items: center;
    justify-content: center;
  }
  #appr-content{
    margin: 0 40px;
  }
  #appr-content * {
    margin: 30px 0;
  }
  .font-size-1{
    font-size: 1rem;
  }
  #appr-comment{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
  }
  #appr-comment > button{
    width: 80px;
    margin:  0 20px;
  }
  #approval-table{
    width: auto;
  }

</style>
</head>
<body>

  	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
 	<main role="main" class="main-content">

		<div class="card shadow mb-4">
      <div class="card-body">
      <div>
        <h3 class="center">${apprDocVo.formName}</h3>
        <table class="table table-bordered mb-0 shadow" id="approval-setting-table">
          <tr>
            <td class="appr-table-color">문서 종류</td>
            <td>${apprDocVo.formName}</td>
            <td class="appr-table-color">문서 번호</td>
            <td id="doc-code">${apprDocVo.docCode}</td>
          </tr>
          <tr>
            <td class="appr-table-color">작성부서</td>
            <td>${apprDocVo.deptName}</td>
            <td class="appr-table-color">작성자</td>
            <td>${apprDocVo.empName}</td>
          </tr>
          <tr>
            <td class="appr-table-color">문서상태</td>
            <c:choose>
            	<c:when test="${apprDocVo.docStatus eq 'N'}">
	            	<td>정상</td>
            	</c:when>
            	<c:when test="${apprDocVo.docStatus eq 'D'}">
            		<td>삭제</td>
            	</c:when>
            	<c:otherwise>
            		<td>임시저장</td>
            	</c:otherwise>
            </c:choose>
            <td class="appr-table-color">보존연한</td>
            <td>${apprDocVo.period}</td>
          </tr>
          <tr>
            <td class="appr-table-color">작성일시</td>
            <td>${apprDocVo.docEnrollDate}</td>
            <td class="appr-table-color">완료일시</td>
            <td id="appr-date">${apprDocVo.docApprDate}</td>
          </tr>
        </table>
        
        <!-- 결재라인 -->
        <table id="approval-table" class="table table-bordered mb-0 shadow">
          <c:forEach items="${apprTypeCountList}" var="c">
          <tr class="appr-table-color appr-line">
            <td rowspan="3" style="width: 160px;">${c.apprTypeName}</td>
            <c:forEach items="${approverVoList}" var="a">
            	<c:if test="${c.apprTypeCode eq a.apprTypeCode}">
	            	<td style="width: 160px;">${a.rankName}</td>
            	</c:if>
            </c:forEach>
          </tr>
          <tr style="height: 160px;" class="appr-length" class="appr-line">
          	<c:forEach items="${approverVoList}" var="a">
          		<c:if test="${c.apprTypeCode eq a.apprTypeCode}">
	          		<c:choose>
	          			<c:when test="${a.apprStatus eq 'A'}">
	          				<c:choose>
	          					<c:when test="${not empty loginMember.empFileName}">
					          		<td  style="width: 160px;"><img class="appr-mark" src="${root}/resources/upload/signFile/${loginMember.empFileName}" alt="승인"> <br>${a.apprDate}</td>
	          					</c:when>
	          					<c:otherwise>
	          						<td  style="width: 160px;"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br>${a.apprDate}</td>
	          					</c:otherwise>
	          				</c:choose>
	          			</c:when>
              		    <c:when test="${a.apprStatus eq 'C'}">
			          		<td class="font-weight-bold text-dark" style="width: 160px;">반려<br>${a.apprDate}</td></td> 
	          			</c:when>
	          			<c:otherwise>
                    <c:if test="${apprDocVo.docStatus eq 'N'}">
                      <td class="appr-mark-td" style="width: 100px;">
                        <button status="${a.apprStatus}" apprSeq="${a.apprSeq}" apprEmpCode="${a.apprEmpCode}" type="button" class="btn mb-2 btn-outline-info d-none appr-btn">승인</button> 
                        <button status="${a.apprStatus}" apprSeq="${a.apprSeq}" apprEmpCode="${a.apprEmpCode}" type="button" class="btn mb-2 btn-outline-secondary d-none un-appr-btn" data-toggle="modal" data-target="#unApprModal">반려</button> 
                      </td>
                    </c:if>
	          			</c:otherwise>
	          		</c:choose>
          		</c:if>
            </c:forEach>
          </tr>
          <tr class="appr-line">
          	<c:forEach items="${approverVoList}" var="a">
	          	<c:if test="${c.apprTypeCode eq a.apprTypeCode}">
    	        	<td>${a.empName}</td>
            	</c:if>
            </c:forEach>
          </tr>
          </c:forEach>
          
          <tr>
            <td class="appr-table-color">참조인</td>
            <td colspan="9" class="text-left">
            	<c:forEach items="${approvalRefVoList}" var="a">
	            	<span>${a.empName}</span> 
            	</c:forEach>
            </td>
          </tr>
        </table>
      </div>
      </div>
     </div>
         
         
         
		 <div class="card shadow mb-4">
      <div class="card-body">
        <div id="appr-content">
          <h4>${apprDocVo.docTitle}</h4>
          <hr>
          
          <c:forEach items="${docDataVoList}" var="d">
              <c:if test="${d.formDetailCode == 1}">
                <div class="font-size-1" style="white-space:pre-wrap">
      ${d.docContent}	
                </div>
              </c:if>
          </c:forEach>
          
         <div style="width: 800px;">
           <table class="table table-bordered mb-0 shadow font-size-1">
             <c:forEach items="${docDataVoList}" var="d">
                <tr>
                <c:if test="${d.formDetailCode != 1}">
                 <td class="appr-table-color w-25">${d.formDetailName}</td>
                 <td>${d.docContent}</td>
                </c:if>
              </tr>
              </c:forEach>
            <tr>
          </table>		
         </div>
    
          <hr>
          <div>
          	<c:forEach items="${approvalFileList}" var="f">
	            <div>${f.originName}&nbsp;&nbsp;<a href="${root}/approval/fileDownload/${f.fileCode}" class="fe fe-download"></a></div>
          	</c:forEach>
          </div>
        </div>
      </div>
     </div>	
	
     <c:if test="${not empty unApprComment}">
        <div class="card shadow mb-4">
          <div class="card-body">
            <h6 class="mb-4">반려 메세지</h6>
            <span>${unApprComment.writerName}</span> &nbsp;&nbsp; <span>${unApprComment.comEnrollDate}</span>
            <div class="d-flex">
              <div class="form-group mt-3 mb-5 ml-3" id="appr-comment">
                ${unApprComment.comContent}
              </div>
              <div class="form-group mb-5 mt-3 ml-3  w-25 align-items-center"></div>
            </div>
          </div>
        </div>
      </c:if>
	
	  <c:if test="${apprDocVo.docStatus eq 'N'}">
	  <c:if test="${(seqStatus.apprStatus eq 'W' && apprDocVo.empCode eq loginMember.empCode) || loginMember.rightCode eq 1 || loginMember.rightCode eq 3}">
      <div class="text-center">
        <button class="btn mb-2 btn-secondary" onclick="location.href='${root}/approval/approvalDocEdit/${apprDocVo.docCode}/${apprDocVo.docFormCode}'"> 수정하기 </button>
        <button id="delete-btn" class="btn mb-2 btn-secondary"> 삭제하기</button>
      </div>
	  </c:if>	
	  </c:if>

    <c:if test="${apprDocVo.docStatus eq 'T'}">
      <c:if test="${apprDocVo.empCode eq loginMember.empCode}">
        <div class="text-center">
          <button class="btn mb-2 btn-secondary" onclick="location.href='${root}/approval/approvalDocEdit/${apprDocVo.docCode}/${apprDocVo.docFormCode}'"> 작성하기</button>
          <button id="delete-btn" class="btn mb-2 btn-secondary"> 삭제하기</button>
        </div>
      </c:if>	
    </c:if>
	
	
      <div class="modal fade" id="unApprModal" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="varyModalLabel">반려</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label for="message-text" class="col-form-label">의견 남기기</label>
                <textarea class="form-control" id="un-appr-message"></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
              <button type="button" class="btn mb-2 btn-primary un-appr">반려하기</button>
            </div>
          </div>
        </div>
      </div>
	
	
	</main>

	<script>

    $('document').ready(function () {
      
      //내가 결재해야 할 문서이면 내 순서일 때 승인 버튼 표시
      let currentAppr = $('.appr-btn').attr('status', 'W').eq(0);
      let currentUnAppr = $('.un-appr-btn').attr('status', 'W').eq(0);
      let docCode = $('#doc-code')[0].innerHTML;

      if('${loginMember.empCode}' == currentAppr.attr('apprEmpCode')){
        currentAppr.removeClass('d-none');
        currentUnAppr.removeClass('d-none');
      }

      //승인
      $('.appr-btn').on('click', function(){

        let apprConfirm = confirm('승인 하시겠습니까?');

        if(apprConfirm == true) {
          let param =  JSON.stringify({
              docCode : docCode,
              apprEmpCode : currentAppr.attr('apprEmpCode'),
              apprSeq : currentAppr.attr('apprSeq')
            });
          
          $.ajax({
            url : "${root}/approval/approve",
            method : "POST",
            data : param,
            dataType : 'text',
            contentType : 'application/json; charset=UTF-8',
            success : function () {
              alert("승인 완료");
              location.reload();
            },
            error : (error) => {
              alert("승인 실패")
              console.log(JSON.stringify(error));
            }
  
          })
        }

      })

      //반려
      $('.un-appr').on('click', function () {
        
        let comment = $('#un-appr-message').val();
        console.log(comment);

        let param =  JSON.stringify({
            docCode : docCode,
            apprEmpCode : currentUnAppr.attr('apprEmpCode'),
            apprSeq : currentUnAppr.attr('apprSeq'),
            comContent : $('#un-appr-message').val()
          });
        
        $.ajax({
          url : "${root}/approval/unApprove",
          method : "POST",
          data : param,
          dataType : 'text',
          contentType : 'application/json; charset=UTF-8',
          success : function (data) {
            alert("반려 완료");
            location.reload();
          },
          error : (error) => {
            alert("반려 실패")
            console.log(JSON.stringify(error));
          }

        })
      })

      //삭제
      $('#delete-btn').on('click', function () {
        
        if(confirm('문서를 삭제 하시겠습니까?')){

          $.ajax({
            url : "${root}/approval/approvalDocDelete",
            method : "POST",
            data : JSON.stringify({docCode : docCode}),
            dataType : "text",
            contentType : 'application/json; charset=UTF-8',
            success : function () {
              alert('삭제 완료');
              location.href='${root}/approval/progressList/1/0'
            },
            error : function () {
              console.log('문서 삭제 실패');
            }
          })

        }
      })

    })  
  </script>
</body>
</html>