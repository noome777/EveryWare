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
	<!-- 문서종류, 문서번호, 작성부서, 작성자, 보안등급, 보존연한, 기안일시, 완료일시   결재라인, 참조, 내용, 즐겨찾기, 첨부한 파일, 의견남기기 -->

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
            <td>정상</td>
            <td class="appr-table-color">보존연한</td>
            <td>
              <div class="form-group mb-3">
                <select class="custom-select form-control align-items-center justify-content-center" id="custom-select" name="periodCode">
                  <c:forEach items="${periodList}" var="p">
                    <option value="${p.periodCode}" <c:if test="${apprDocVo.period == p.periodCode}">selected="selected"</c:if>>${p.period}</option>
                  </c:forEach>
                </select>
              </div>
            </td>
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
			          		<td  style="width: 160px;"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br>${a.apprDate}</td>
	          			</c:when>
              		    <c:when test="${a.apprStatus eq 'C'}">
			          		<td class="font-weight-bold text-dark" style="width: 160px;">반려<br>${a.apprDate}</td></td> 
	          			</c:when>
	          			<c:otherwise>
	          				<td class="appr-mark-td" style="width: 100px;">
		                      <button status="${a.apprStatus}" apprSeq="${a.apprSeq}" apprEmpCode="${a.apprEmpCode}" type="button" class="btn mb-2 btn-outline-info d-none appr-btn">승인</button> 
		                      <button status="${a.apprStatus}" apprSeq="${a.apprSeq}" apprEmpCode="${a.apprEmpCode}" type="button" class="btn mb-2 btn-outline-secondary d-none un-appr-btn" data-toggle="modal" data-target="#unApprModal">반려</button> 
		                    </td>
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
       <div class="card-body" id="form-content">
         <div class="form-group mb-3">
           <label>제목</label>
           <input type="text" class="form-control" name="docTitle" value="${apprDocVo.docTitle}">
         </div>	
         <c:forEach items="${formMappingList}" var="f">
            <div class="form-group mb-3">
              <label>${f.formDetailName}</label>
              <c:choose>
                <c:when test="${f.formDetailType eq 'textarea'}">
                  <textarea class="form-control" detailCode="${f.formDetailCode}" name="docContent"><c:forEach items="${docDataVoList}" var="d"><c:if test="${f.formDetailCode eq d.formDetailCode}">${d.docContent}</c:if></c:forEach></textarea>
                </c:when>
                <c:otherwise>
                  <input type="${f.formDetailType}" detailCode="${f.formDetailCode}" class="form-control" name="docContent" <c:forEach items="${docDataVoList}" var="d"><c:if test="${f.formDetailCode eq d.formDetailCode}">value="${d.docContent}"</c:if></c:forEach>>
                </c:otherwise>
              </c:choose>	            
            </div>
          </c:forEach>	
       </div>
     </div>
         
     <div class="card shadow mb-4">
        <div class="card-body">
          첨부파일
        </div>
      </div>
	
      <div class="text-center">
        <button id="edit-btn" class="btn mb-2 btn-secondary"> 수정하기</button>
      </div>
	
	
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

      $('#edit-btn').on('click', function () {
        
        let docDataList = [];
        $('[name=docContent]').each(function() {
          let object = {
            formDetailCode : $(this).attr('detailCode'),
            docContent : $(this).val()  
          }
          docDataList.push(object);
        })
  
        let docCode = $('#doc-code')[0].innerHTML;
        let periodCode = $('#custom-select').val();
        let docTitle = $('[name=docTitle]').val();
        
        let param = JSON.stringify({
          docCode : docCode,
          periodCode : periodCode,
          docTitle : docTitle,
          docDataList : docDataList
        })

        console.log(param);

        $.ajax({
          url : '${root}/approval/approvalDocEdit',
          method : 'POST',
          data : param,
          dataType : 'text',
          contentType: "application/json; charset=utf-8",
          success : function(data){
            alert('수정 성공');
            console.log(param);
            location.href='${root}/approval/approvalDocDetail/' + docCode;
          } , 
          error : (error) => {
            console.log(JSON.stringify(error));
          }

        })
        
      })


    })  
  </script>
</body>
</html>