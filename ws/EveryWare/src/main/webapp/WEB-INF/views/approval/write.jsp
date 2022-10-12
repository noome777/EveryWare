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
		width: 70%;
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
</style>
</head>
<body>

  	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
 	<main role="main" class="main-content">
	<!-- 제목;, 내용;, 회계월;, 적요;, 지출자;, 계좌번호;, 거래처, 은행명, 예금주, 송금액;, 송금요청날짜;, 첨부파일;, 제출버튼 -->
	
		<div class="card shadow mb-4">
		
           <div class="card-body">
           	  
               <table class="table table-bordered mb-0 shadow" id="approval-setting-table">
                 <tr>
                   <td class="appr-table-color">문서 종류</td>
                   <td>
                     <div class="form-group mb-3">
		               <select class="custom-select form-control" id="formSelect">
		                 <option selected>선택</option>
		                 <c:forEach items="${formList}" var="f">
			                 <option id="formSelect" value="${f.formCode}">${f.formName}</option>
		                 </c:forEach>
		               </select>
					   <input type="hidden" id="formCode">
		             </div>
				   </td>
                   <td class="appr-table-color">보존연한</td>
                   <td>
					 <div class="form-group mb-3">
		               <select class="custom-select form-control" id="custom-select">
		                 <c:forEach items="${periodList}" var="p">
			                 <option value="${p.periodCode}">${p.period}</option>
		                 </c:forEach>
		               </select>
		             </div>
			       </td>
                 </tr>
                 <tr>
                   <td class="appr-table-color">작성자</td>
                   <td>고은비 </td>
                   <td class="appr-table-color">보안등급</td>
                   <td>
                     <div class="form-group mb-3">
		               <select class="custom-select form-control" id="custom-select">
		                 <option selected>선택</option>
		                 <c:forEach items="${securityList}" var="s">
			                 <option value="${s.securityCode}">${s.securityLevle}</option>
		                 </c:forEach>
		               </select>
		             </div>
                   </td>
                 </tr>
               </table>
               
               <!-- 결재라인 -->
               <table id="approval-table" class="table table-bordered mb-0 shadow">
                 <tr class="appr-table-color">
                   <td rowspan="3" style="width: 100px;">신청</td>
                   <td>사원</td>
                   <td>대리</td>
                   <td>팀장</td>
                   <td></td>
                   <td rowspan="3" style="width: 100px;">처리</td>
                   <td>주임</td>
                   <td>과장</td>
                   <td>팀장</td>
                   <td></td>
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
                 </tr>
                 <tr>
                   <td>이름</td>
                   <td>이름</td>
                   <td>이름</td>
                   <td></td>
                   <td>이름</td>
                   <td>이름</td>
                   <td>이름</td>
                   <td></td>
                 </tr>
                 
                 <tr>
                   <td class="appr-table-color">참조인</td>
                   <td colspan="9"></td>
                 </tr>
               </table>
               
           </div>
           
         </div>
         
	
		<%-- <c:choose> --%>
		
			<div class="card shadow mb-4">
			
	          <div class="card-body">
	          
	            <div class="form-group mb-3">
	              <label for="simpleinput">제목</label>
	              <input type="text" id="simpleinput" class="form-control">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-textarea">내용</label>
	              <textarea class="form-control" id="example-textarea" rows="4"></textarea>
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-month">회계월</label>
	              <input class="form-control" id="example-month" type="month" name="month">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-textarea">적요</label>
	              <textarea class="form-control" id="example-textarea" rows="4"></textarea>
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="simpleinput">지출자</label>
	              <input type="text" id="simpleinput" class="form-control">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-number">계좌번호 (숫자만 입력)</label>
	              <input class="form-control" id="example-number" type="number" name="number">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="custom-money">지출액</label>
	              <input class="form-control input-money" id="custom-money" type="text" name="money">
	            </div>
	            
	            
	            <div class="form-group mb-3">
	              <label for="custom-money">송금액</label>
	              <input class="form-control input-money" id="custom-money" type="text" name="money">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-date">송금요청일</label>
	              <input class="form-control" id="example-date" type="date" name="date">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="example-number">계좌번호 (숫자만 입력)</label>
	              <input class="form-control" id="example-number" type="number" name="number">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="simpleinput">거래처</label>
	              <input type="text" id="simpleinput" class="form-control">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="simpleinput">은행명</label>
	              <input type="text" id="simpleinput" class="form-control">
	            </div>
	            
	            <div class="form-group mb-3">
	              <label for="simpleinput">예금주</label>
	              <input type="text" id="simpleinput" class="form-control">
	            </div>
	            
	          </div> <!-- /.card-body -->
	          
	        </div> <!-- / .card -->
        
        <%-- </c:choose> --%>
        
        
		
		<!-- 첨부파일 -->
		<div class="">
	      <div class="card shadow mb-4">
	        <div class="card-header">
	          <strong>첨부파일</strong>
	        </div>
	        <div class="card-body">
	          <form action="/file-upload" class="dropzone bg-light rounded-lg" id="tinydash-dropzone">
	            <div class="dz-message needsclick">
	              <div class="circle circle-lg bg-primary">
	                <i class="fe fe-upload fe-24 text-white"></i>
	              </div>
	              <h5 class="text-muted mt-4">Drop files here or click to upload</h5>
	            </div>
	          </form>
	          <!-- Preview -->
	          <!-- <div class="dropzone-previews mt-3" id="file-previews"></div> -->
	          <!-- file preview template -->
	          <div class="d-none" id="uploadPreviewTemplate">
	            <div class="card mt-1 mb-0 shadow-none border">
	              <div class="p-2">
	                <div class="row align-items-center">
	                  <div class="col-auto">
	                    <img data-dz-thumbnail src="#" class="avatar-sm rounded bg-light" alt="">
	                  </div>
	                  <div class="col pl-0">
	                    <a href="javascript:void(0);" class="text-muted font-weight-bold" data-dz-name></a>
	                    <p class="mb-0" data-dz-size></p>
	                  </div>
	                  <div class="col-auto">
	                    <!-- Button -->
	                    <a href="" class="btn btn-link btn-lg text-muted" data-dz-remove>
	                      <i class="dripicons-cross"></i>
	                    </a>
	                  </div>
	                </div>
	              </div>
	            </div>
	          </div>
	        </div> <!-- .card-body -->
	      </div> <!-- .card -->
	    </div> <!-- .col -->
		
		<div class="text-center">
			<button type="button" class="btn mb-2 btn-secondary ">작성하기</button>
		</div>
	
	
	

	</main>
	

	<script>
		
		//선택한 양식 코드 가져오기
		$('#formSelect').change(function(){
			console.log($('#formSelect option:selected').val());
			const selectedForm = $('#formSelect option:selected').val();
			
			$.ajax({
				url : "${root}/approval/formSelect" ,
				type : "GET" , 
				data : {formCode : selectedForm} , 
				success : function(data){
					console.log(data)
				} ,
				error : function() {
					console.log("양식 불러오기 실패");
				}
			});
		});
		

	</script>
</body>
</html>