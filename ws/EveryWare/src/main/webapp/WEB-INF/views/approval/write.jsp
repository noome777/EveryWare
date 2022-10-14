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
  /* #appr-layer{
  	position: fixed;
    width: 50%;
    left: 50%;
    margin-left: -20%;
    height: 45%;
    top: 37%;
    margin-top: -150px; 
    overflow: auto;


    border: 1px solid #000;
    background-color: #eee;
    padding: 1em;
    box-sizing: border-box;
  } */
  #appr-layer{
    width: 600px;
  }
  .hidden{
  	display: none;
  }
  #appr-line-setting{
  	margin-top: 40px;
  	margin-bottom: 20px;
    
  }
  #appr-line-setting:hover{
    cursor: pointer;
  }
  .modal-dialog-centered{
    width: 100px;
  }
</style>
</head>
<body>

  <%@ include file="/WEB-INF/views/common/header.jsp" %>
  <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>
 	<main role="main" class="main-content">
    
    <form action="" method="post">
      <div class="card shadow mb-4">
        <div class="card-body">
          <table class="table table-bordered mb-0 shadow" id="approval-setting-table">
            <tr>
              <td class="appr-table-color">문서 종류</td>
              <td>
                <div class="form-group mb-3">
                <select class="custom-select form-control" id="formSelect" name="docFormCode">
                  <option value="0">선택</option>
                  <c:forEach items="${formList}" var="f">
                    <option value="${f.formCode}" <c:if test="${selectedFormCode == f.formCode}">selected="selected"</c:if>>${f.formName}</option>
                  </c:forEach>
                </select>
                </div>
              </td>
              <td class="appr-table-color">보존연한</td>
              <td>
                <div class="form-group mb-3">
                  <select class="custom-select form-control" id="custom-select" name="periodCode">
                    <c:forEach items="${periodList}" var="p">
                      <option value="${p.periodCode}">${p.period}</option>
                    </c:forEach>
                  </select>
                </div>
              </td>
            </tr>
            <tr>
              <td class="appr-table-color">작성자</td>
              <td>고은비</td>
              <td class="appr-table-color">보안등급</td>
              <td>
                <div class="form-group mb-3">
                  <select class="custom-select form-control" id="custom-select" name="securityCode">
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
          <div class="fe fe-settings fe-16 " data-toggle="modal" data-target="#verticalModal" id="appr-line-setting"> 결재라인 설정</div>
          <table id="approval-table" class="table table-bordered mb-0 shadow">
            <tr class="appr-table-color">
              <td rowspan="3" style="width: 100px;">신청</td>
              <td class="fe fe-plus fe-12 mr-2"></td>
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
        
        
      
      <div class="card shadow mb-4">
        <div class="card-body" id="form-content">
          <div class="form-group mb-3">
          	<label>제목</label>
          	<input type="text" class="form-control" name="docTitle">
          </div>	
          <c:forEach items="${formMappingList}" var="f">
            <div class="form-group mb-3">
              <label>${f.formDetailName}</label>
              <c:choose>
                <c:when test="${f.formDetailType eq 'textarea'}">
                  <textarea class="form-control" detailCode="${f.formDetailCode}" name="docContent"></textarea>
                </c:when>
                <c:otherwise>
                  <input type="${f.formDetailType}" detailCode="${f.formDetailCode}" class="form-control" name="docContent">
                </c:otherwise>
              </c:choose>	            
            </div>
          </c:forEach>	
        </div>
      </div>
          
          
          
      
      <!-- 첨부파일 -->
      <c:if test="${not empty formMappingList}">
        <div class="">
          <div class="card shadow mb-4">
            <div class="card-header">
              <strong>첨부파일</strong>
            </div>
            <div class="card-body">
              <!-- <form action="/file-upload" class="dropzone bg-light rounded-lg" id="tinydash-dropzone">
                <div class="dz-message needsclick">
                  <div class="circle circle-lg bg-primary">
                    <i class="fe fe-upload fe-24 text-white"></i>
                  </div>
                  <h5 class="text-muted mt-4">Drop files here or click to upload</h5>
                </div>
              </form> -->
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
          <input type="submit" class="btn mb-2 btn-secondary" value="작성하기">
        </div>
      </c:if>
    </form>


    
    <!-- Button trigger modal -->
    <button type="button" class="btn mb-2 btn-outline-success" data-toggle="modal" data-target="#verticalModal" data-backdrop="static"> Launch demo modal </button>
    <!-- Modal -->
    <div class="modal" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="verticalModalTitle">Modal title</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body"> Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dui urna, cursus mollis cursus vitae, fringilla vel augue. In vitae dui ut ex fringilla consectetur. Sed vulputate ante arcu, non vehicula mauris porttitor quis. Praesent tempor varius orci sit amet sodales. Nullam feugiat condimentum posuere. Vivamus bibendum mattis mi, vitae placerat lorem sagittis nec. Proin ac magna iaculis, faucibus odio sit amet, volutpat felis. Proin eleifend suscipit eros, quis vulputate tellus condimentum eget. Maecenas eget dui velit. Aenean in maximus est, sit amet convallis tortor. In vel bibendum mauris, id rhoncus lectus. Suspendisse ullamcorper bibendum tellus a tincidunt. Donec feugiat dolor lectus, sed ullamcorper ante rutrum non. Mauris vestibulum, metus sit amet lobortis fringilla, dui est venenatis ligula, a euismod sem augue vel lorem. Nunc feugiat eget tortor vel tristique. Mauris lobortis efficitur ligula, et consectetur lectus maximus sed. 
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla dui urna, cursus mollis cursus vitae, fringilla vel augue. In vitae dui ut ex fringilla consectetur. Sed vulputate ante arcu, non vehicula mauris porttitor quis. Praesent tempor varius orci sit amet sodales. Nullam feugiat condimentum posuere. Vivamus bibendum mattis mi, vitae placerat lorem sagittis nec. Proin ac magna iaculis, faucibus odio sit amet, volutpat felis. Proin eleifend suscipit eros, quis vulputate tellus condimentum eget. Maecenas eget dui velit. Aenean in maximus est, sit amet convallis tortor. In vel bibendum mauris, id rhoncus lectus. Suspendisse ullamcorper bibendum tellus a tincidunt. Donec feugiat dolor lectus, sed ullamcorper ante rutrum non. Mauris vestibulum, metus sit amet lobortis fringilla, dui est venenatis ligula, a euismod sem augue vel lorem. Nunc feugiat eget tortor vel tristique. Mauris lobortis efficitur ligula, et consectetur lectus maximus sed.   
          </div>
          <div class="modal-footer">
            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn mb-2 btn-primary">Save changes</button>
          </div>
        </div>
      </div>
    </div>





	</main>
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script>
		//confirm 분기문 수정 필요
		$('document').ready(function () {
			
			//문서종류 불러오기, 선택 유지
			$('#formSelect').change(function(){
				const formCode = $('#formSelect option:selected').val();
				const nonSelect = $('#formSelect option[value=0]');
				
				if(formCode != 0){
					if(confirm('문서 종류를 바꾸시겠습니까? 작성한 내용은 저장되지 않습니다.')) {
						location.href = '${root}/approval/write/' + formCode;
					}
				} else {
					location.href = '${root}/approval/write/' + formCode;
				}
				
			});
			
			//결재라인 설정
			$('#appr-line-setting').click(function() {	
				const layer = $('#appr-layer');
     		    layer.removeClass('hidden');
			})
			
			
			
		})
	</script>
	
</body>
</html>