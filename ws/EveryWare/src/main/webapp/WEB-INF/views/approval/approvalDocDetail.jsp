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
        <h3 class="center">품의서</h3>
        <table class="table table-bordered mb-0 shadow" id="approval-setting-table">
          <tr>
            <td class="appr-table-color">문서 종류</td>
            <td>품의서</td>
            <td class="appr-table-color">문서 번호</td>
            <td>품의_1234_1234</td>
          </tr>
          <tr>
            <td class="appr-table-color">작성부서</td>
            <td>인사팀</td>
            <td class="appr-table-color">작성자</td>
            <td>고은비</td>
          </tr>
          <tr>
            <td class="appr-table-color">보안등급</td>
            <td>C등급</td>
            <td class="appr-table-color">보존연한</td>
            <td>영구</td>
          </tr>
          <tr>
            <td class="appr-table-color">작성일시</td>
            <td>2022.10.03</td>
            <td class="appr-table-color">완료일시</td>
            <td>2022.10.03</td>
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
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"></td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"><img class="appr-mark" src="${root}/resources/img/appr-mark.png" alt="승인"> <br> 22.10.03</td>
            <td class="appr-mark-td"></td>
          </tr>
          <tr>
            <td>김사원</td>
            <td>김대리</td>
            <td>김팀장</td>
            <td></td>
            <td>김주임</td>
            <td>김과장</td>
            <td>나팀장</td>
            <td></td>
          </tr>
          <tr>
            <td class="appr-table-color">참조인</td>
            <td colspan="9"></td>
          </tr>
        </table>
      </div>
      </div>
     </div>
         
         
         
		 <div class="card shadow mb-4">
      <div class="card-body">
        <div id="appr-content">
          <h4>신규 입사자 노트북 구매의 건</h4>
          <hr>
            <div class="font-size-1" style="white-space:pre-wrap">
  2022년도 11월 입사 예정인 신입사원 3인의 노트북 구매를 하고자 아래와 같이 품의하오니 결재하여 주시기 바랍니다.


  구매 목적 : 개발팀 신규 입사자 3인 노트북 구매

  구매 내역

  - 품명 : LG gram
  - 단가 : 1,600,000
  - 수량 : 3EA
  - 합계 : 4,800,000
          </div>
    
          <table class="table table-bordered mb-0 shadow font-size-1">
            <tr class="appr-table-color">
              <td>거래처</td>
              <td>은행명</td>
              <td>계좌번호</td>
              <td>예금주</td>
              <td>송금액</td>
              <td>송금 요청일</td>
            </tr>
            <tr>
              <td>lg 베스트샵</td>
              <td>기업</td>
              <td>111-1111-1111</td>
              <td>lg</td>
              <td>4,800,000</td>
              <td>22-10-06</td>
            </tr>
          </table>		
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