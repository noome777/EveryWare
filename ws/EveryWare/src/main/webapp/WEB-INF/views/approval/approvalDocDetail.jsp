<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <td>${apprDocVo.docCode}</td>
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
            <td>${apprDocVo.period}</td>
          </tr>
          <tr>
            <td class="appr-table-color">작성일시</td>
            <td>${apprDocVo.docEnrollDate}</td>
            <td class="appr-table-color">완료일시</td>
            <td></td>
          </tr>
        </table>
        
        <!-- 결재라인 -->
        <table id="approval-table" class="table table-bordered mb-0 shadow">
          <c:forEach items="${apprTypeCountList}" var="c">
          <tr class="appr-table-color">
            <td rowspan="3" style="width: 100px;">${c.apprTypeName}</td>
            <c:forEach items="${approverVoList}" var="a">
            	<c:if test="${c.apprTypeCode eq a.apprTypeCode}">
	            	<td>${a.rankName}</td>
            	</c:if>
            </c:forEach>
          </tr>
          <tr style="height: 100px;">
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
          	<td></td>
            <%-- <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"></td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"></td> --%>
          </tr>
          <tr>
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
            구매 견적서.xlsx
          </div>
        </div>
      </div>
     </div>	
	
     <div class="card shadow mb-4">
        <div class="card-body">
          <h6>의견 남기기</h6>
          <div class="form-group mb-3" id="appr-comment">
            <textarea class="form-control" id="example-textarea" ></textarea>
            <button class="btn mb-2 btn-outline-info">등록</button>
          </div>



        </div>
      </div>

        
        
        
		
		
	
	
	
	

	</main>
	
</body>
</html>