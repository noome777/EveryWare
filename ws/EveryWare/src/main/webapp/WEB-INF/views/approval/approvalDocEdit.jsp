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
  #approver-select, #ref-select, #selected-ref{
    height: 600px;
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
        <table class="table table-bordered mb-5 shadow" id="approval-setting-table">
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
            <td class="writer-name" id="${apprDocVo.empCode}">${apprDocVo.empName}</td>
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
        <div class="fe fe-settings fe-16 text-info" id="appr-line-setting" data-toggle="modal" data-target="#verticalModal"> 결재라인 설정</div>
        <table id="approval-table" class="table table-bordered mt-3 mb-0 shadow">
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
        </table>

        <table id="approval-ref-table" class="table table-bordered mb-0 shadow">
          <tr>
            <td class="appr-table-color">참조인</td>
            <td colspan="9" class="text-left" id="ref-selected">
              <c:forEach items="${approvalRefVoList}" var="a">
                <span>${a.empName}</span> 
              </c:forEach>
              <span id="appr-ref-setting" class="fe fe-plus fe-16 w-25 text-info" data-toggle="modal" data-target="#refModal">
                편집하기
              </span>
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
      <div class="card-header">
        <strong>첨부파일</strong>
      </div>
      <div class="card-body">
        <div class="form-group mb-3">
          <div class="custom-file">
            <input type="file" class="custom-file-input" multiple id="customFile" name="file">
            <label class="custom-file-label" for="customFile">Choose file</label>
            <div id="file-name" class="m-1">
              <c:forEach items="${approvalFileList}" var="f">
                <div class="file-name-div">${f.originName}</div>
              </c:forEach>
            </div>
          </div>
        </div>
      </div>
    </div>
	
      <div class="text-center">
        <button id="edit-btn" class="btn mb-2 btn-secondary">수정하기</button>
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
	
	<!-- 결재라인 설정 모달창 -->
  <div class="modal" id="verticalModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="verticalModalTitle">결재라인 설정</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">

          <div id="modal-appr-type" class="d-flex m-2">
            <c:forEach items="${approvalTypeList}" var="a">
              <div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input mb-1" id="customCheck${a.apprTypeCode}" value="${a.apprTypeCode}" name="typeCheck[]">
                <label class="custom-control-label p-1 mr-2" for="customCheck${a.apprTypeCode}">${a.apprTypeName}</label>
              </div>
            </c:forEach>
          </div>
          <div class="form-group mb-3 w-25">
            <select class="custom-select form-control" id="appr-dept-selectbox">
              <option value="0">전체</option>
              <c:forEach items="${deptList}" var="d" >
                <option value="${d.deptCode}">${d.deptName}</option>
              </c:forEach>
            </select>
          </div>

          <div id="approver-select" class="d-flex">

            <div id="name-list" class="w-50">
              <select id="emp-name" multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll">
                <c:forEach items="${empList}" var="e">
                  <option value="${e.empCode}">${e.empName} (${e.deptName} - ${e.rankName})</option>
                </c:forEach>
              </select>
            </div>
            <div class="w-75 d-flex flex-column">
              <c:forEach items="${approvalTypeList}" var="a">
                <div class="d-none appr-custom-box" apprTypeCode="${a.apprTypeCode}">
                  <div class="d-flex">
                    <div class="h-150 w-25 mx-4 d-flex flex-column justify-content-center align-items-center">
                      <a id="${a.apprTypeCode}" class="fe fe-24 fe-arrow-right-circle mb-1 add-user"></a>
                      <a id="${a.apprTypeCode}" class="fe fe-24 fe-arrow-left-circle delete-user"></a>
                    </div>
                    <div class="w-75 h-150" id="type-content" apprTypeCode="${a.apprTypeCode}">
                      <span class="">${a.apprTypeName}</span>
                      <select id="${a.apprTypeCode}" multiple="multiple" class="custom-select form-control w-100 non-scroll mb-3 approver-select-box">
                      </select>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </div>

          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn mb-2 btn-primary" data-dismiss="modal" id="approver-submit">완료</button>
        </div>
      </div>
    </div>
  </div> 

  <!-- 참조인 설정 모달창 -->
  <div class="modal" id="refModal" tabindex="-1" role="dialog" aria-labelledby="refModalTitle" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="refModalTitle">참조인 설정</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <div class="modal-body">

          <div class="form-group mb-3 w-25">
            <select class="custom-select form-control" id="ref-dept-selectbox">
              <option value="0">전체</option>
              <c:forEach items="${deptList}" var="d" >
                <option value="${d.deptCode}">${d.deptName}</option>
              </c:forEach>
            </select>
          </div>

          <div id="ref-select" class="d-flex">
            <div id="ref-name-list" class="w-50">
              <select id="ref-emp-name" multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll">
                <c:forEach items="${empList}" var="e">
                  <option value="${e.empCode}">${e.empName} (${e.deptName} - ${e.rankName})</option>
                </c:forEach>
              </select>
            </div>
            <div class="w-75 d-flex flex-column">
              <div class="ref-custom-box">
                <div class="d-flex">
                  <div class="h-150 w-25 mx-4 d-flex flex-column justify-content-center align-items-center">
                    <a id="ref-add-user" class="fe fe-24 fe-arrow-right-circle mb-1"></a>
                    <a id="ref-delete-user" class="fe fe-24 fe-arrow-left-circle"></a>
                  </div>
                  <div class="w-75 h-150" id="ref-content">
                    <select id="selected-ref" multiple="multiple" class="custom-select form-control w-100 non-scroll mb-3 ref-select-box">
                    </select>
                  </div>
                </div>
              </div>
            </div>

          </div>

        </div>

        <div class="modal-footer">
          <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn mb-2 btn-primary" data-dismiss="modal" id="ref-submit">완료</button>
        </div>
      </div>
    </div>
  </div>
	</main>

	<script>

    $('document').ready(function () {

      //부서별 임직원 불러오기 - 결재라인
    $('#ref-dept-selectbox').on('change', function () {
      let deptCode = $('#ref-dept-selectbox option:selected').val();
      let paramData = JSON.stringify({"deptCode" : $('#ref-dept-selectbox option:selected').val()});

      $.ajax({
        url : "${root}/approval/selectDept" ,
        method : "POST" ,
        data : {deptCode : deptCode} ,
        dataType : 'json' ,
        success : function(deptEmpList){

          $('#ref-emp-name option').remove();
          let str;
          $.each(deptEmpList, function (i) {
            str += '<option value="'  + deptEmpList[i].empCode + '">' + deptEmpList[i].empName + ' (' + deptEmpList[i].deptName + ' - ' +
                    deptEmpList[i].rankName + ')</option>'
          })
          $('#ref-emp-name').append(str);
          
        } , 
        error : (error) => {
          console.log(JSON.stringify(error));
        }
      })
    })

    
    


    //체크박스 체크 시 해당 결재타입 보이기
    $('#modal-appr-type input[type=checkbox]').on('click', function(){
      let clickedBox = $('.appr-custom-box[apprTypeCode = '+ this.value + ']');
      
      if($(this).prop('checked')){
        clickedBox.removeClass('d-none');
      } else {
        clickedBox.addClass('d-none');
      }
      
      

    });

    //결재자 추가하기
    $('.add-user').on('click', function () {
      let userCode = $('#emp-name option:selected').val();
      let userOption = $('#emp-name option[value=' + userCode + ']')[0].outerHTML;
      let addTypeCode = $(this).attr('id');
      let apprSelectBox = $('.approver-select-box[id=' + addTypeCode + ']');
      let selectedOption = apprSelectBox.find('option').val();
      
      //중복체크
      let selectedOptionVal = [];
      $($('.approver-select-box[id=' + addTypeCode + '] option')).each(function () {
        var selected = $(this).val();
        selectedOptionVal.push(selected);
      })
      
      if($.inArray(userCode, selectedOptionVal) != -1){
        alert('해당 결재타입에 추가한 결재자는 중복추가 할 수 없습니다.');
      } else {
        apprSelectBox.append(userOption);
      }
    })
    
    //결재자 삭제하기
    $('.delete-user').on('click', function () {
      let userCode = $('.approver-select-box option:selected').val();
      let userOption = $('.approver-select-box option[value=' + userCode +']');
      
      let addTypeCode = $(this).attr('id');
      
      $('.approver-select-box[id='+ addTypeCode +'] option[value=' + userCode +']').remove();
    })
    

    

    //결재라인 설정 완료하기
    $('#approver-submit').on('click', function () {
      
      let userCode = $('.approver-select-box option').val();
      
      $('#approval-table *').remove();
      
      let checkedVal = [];
      $('#modal-appr-type input[type=checkbox]:checked').each(function () {
        var checked = $(this).val();
        checkedVal.push(checked); 
      })
      
      let apprTableHtml;

      let seq = 1;
      $.each(checkedVal, function(i){
        
        let typeName = $('#type-content[apprTypeCode='+ checkedVal[i] +']>span')[0].outerText;
        let approverVal = [];
        $('.approver-select-box[id='+ checkedVal[i] +'] option').each(function () {
          var selected = $(this).val();
          approverVal.push(selected);
        })
        
        let rankHtml;
        let nameHtml;
        let markHtml;
        $.each(approverVal, function (j) {
          let approverEmp = $('.approver-select-box[id='+ checkedVal[i] +'] option[value=' + approverVal[j] + ']').attr('approverSeq', seq += 1)[0].innerHTML;
          let empInfo = approverEmp.split(' ');
          let empName = empInfo[0];
          let empRankName = empInfo[3].replace(')', '');
          let writer = $('.writer-name')[0].innerHTML;
          let writerCode = $('.writer-name').attr('id');
          if(i == 0 && j == 0){
           
            rankHtml += '<td></td>';
            markHtml += '<td></td>';
            nameHtml += '<td>' + writer + '</td>';
          }

          rankHtml += '<td>' + empRankName + '</td>';
          markHtml += '<td></td>';
          nameHtml += '<td>' + empName + '</td>';

        })
        let blankTd;
        if(approverVal.length < 9 && i == 0) {
          let blankCount = (7-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td></td>';
          }
        } else {
          let blankCount = (8-approverVal.length);
          for(let i=0; i<blankCount; i++){
            blankTd += '<td></td>';
          }
        }
        if(approverVal.length != 0){
          apprTableHtml += '<tr class="appr-table-color"> <td rowspan="3" style="width: 100px;">' + typeName + 
            '</td>' + rankHtml + blankTd + '</tr> <tr style="height: 100px;">' + markHtml + blankTd + '</tr> <tr class="approver-emp">' + nameHtml + blankTd + '</tr>';
        }
        
        
      })
        $('#approval-table').append(apprTableHtml);
    });
    
    //부서별 임직원 불러오기 - 참조인
    $('#appr-dept-selectbox').on('change', function () {
      let deptCode = $('#appr-dept-selectbox option:selected').val();
      let paramData = JSON.stringify({"deptCode" : $('#appr-dept-selectbox option:selected').val()});

      $.ajax({
        url : "${root}/approval/selectDept" ,
        method : "POST" ,
        data : {deptCode : deptCode } ,
        dataType : 'json' ,
        success : function(deptEmpList){

          $('#emp-name option').remove();
          let str;
          $.each(deptEmpList, function (i) {
            str += '<option value="'  + deptEmpList[i].empCode + '">' + deptEmpList[i].empName + ' (' + deptEmpList[i].deptName + ' - ' +
                    deptEmpList[i].rankName + ')</option>'
          })
          $('#emp-name').append(str);
          
        } , 
        error : (error) => {
          console.log(JSON.stringify(error));
        }
      })
    })

    //참조인 추가하기
    $('#ref-add-user').on('click', function () {
      let userCode = $('#ref-emp-name option:selected').val();
      let userOption = $('#ref-emp-name option[value=' + userCode + ']')[0].outerHTML;

      //중복체크
      let selectedOptionVal = [];
      $($('.ref-select-box option')).each(function () {
        var selected = $(this).val();
        selectedOptionVal.push(selected);
      })

      if($.inArray(userCode, selectedOptionVal) != -1){
        alert('이미 추가한 참조인 입니다.');
      } else {
        $('.ref-select-box').append(userOption);
      }
    })

    //참조인 삭제하기
    $('#ref-delete-user').on('click', function () {
      let userCode = $('.ref-select-box option:selected').val();
      let userOption = $('.ref-select-box option[value=' + userCode +']');

      $('.ref-select-box option[value=' + userCode +']').remove();
    })
    
    //참조인 설정 완료
    $('#ref-submit').on('click', function () {
      let userCode = $('.ref-select-box option').val();
      $('#ref-selected .ref-name').remove();

      let refVal = [];
      $('.ref-select-box option').each(function (i) {
        let selected = $(this).val();
        refVal.push(selected);
      })
      console.log(refVal);


      let refHtml = '';
      $.each(refVal, function (i) {
        let refEmp = $('.ref-select-box option[value=' + refVal[i] + ']')[0].innerHTML;
        let empInfo = refEmp.split(' ');
        empName = empInfo[0];
        
        refHtml += '<span id="'+ refVal[i] + '" class="ref-name"> ' + empName + '</span>';
      })

      $('#ref-selected').prepend(refHtml);


    })

      function fileInit() {
        var fileList = "";
        $('#file-name div').remove();
        
        for(var i=0; i<$('#customFile')[0].files.length; i++){  
          fileList += '<div class="file-name-div" id="' + i + '">' + $('#customFile')[0].files[i].name + '&nbsp;&nbsp;<i class="fe fe-x-square del-file" id="'+ i +'"></i></div>';
        } 
        
        $('#file-name').append(fileList);
      }

      $("input[type='file']").on('change',fileInit);
      
      $($('#file-name')).on('click', $('.del-file') ,function (e) {
        let id = e.target.id;

        $('.file-name-div[id='+ id +']').remove();
        const dataTransfer = new DataTransfer();

        let files = $('#customFile')[0].files;
        let fileArray = Array.from(files);
        fileArray.splice(id, 1);

        fileArray.forEach(file => {
          dataTransfer.items.add(file);
        });

        $('#customFile')[0].files = dataTransfer.files;
        fileInit();
      });

      $('#edit-btn').on('click', function () {
        let writerCode = $('.writer-name').attr('id');
        let docDataList = [];
        $('[name=docContent]').each(function() {
          let object = {
            formDetailCode : $(this).attr('detailCode'),
            docContent : $(this).val()  
          }
          docDataList.push(object);
        })

        let checkedVal = [];
        $('#modal-appr-type input[type=checkbox]:checked').each(function (i) {
          var checked = $(this).val();
          checkedVal.push(checked); 
        })

        let approverList = [];
        $.each(checkedVal, function(i){
        
          $('.approver-select-box[id='+ checkedVal[i] +'] option').each(function (j) {
            let approverObject = {
              apprTypeCode : checkedVal[i], 
              apprEmpCode : $(this).val(),
              apprSeq : $(this).attr('approverSeq'),
              apprStatus : "W"
            }
            approverList.push(approverObject);

            if(i==0 && j==0 ){
              approverObject = {
              apprTypeCode : checkedVal[0], 
              apprEmpCode : writerCode,
              apprSeq : "1",
              apprStatus : "A"
            }
            approverList.push(approverObject);
            }
          })
        })
        
        let approvalRefList = [];
        $('.ref-select-box option').each(function (i) {
          let object = {
            refEmpCode : $(this).val()
          }
          approvalRefList.push(object);
        })
  
        let docCode = $('#doc-code')[0].innerHTML;
        let periodCode = $('#custom-select').val();
        let docTitle = $('[name=docTitle]').val();
        
        let param = {
          docCode : docCode,
          periodCode : periodCode,
          docTitle : docTitle,
          docDataList : docDataList,
          approverList : approverList,
          approvalRefList : approvalRefList,
          docStatus : '${apprDocVo.docStatus}'
        };
        console.log(param);
        var formData = new FormData();
        for(var i=0; i<$('#customFile')[0].files.length; i++){  
          formData.append("file", $('#customFile')[0].files[i]);
          console.log($('#customFile')[0].files[i]);
        } 
        formData.append('appr', new Blob([JSON.stringify(param)], {type : "application/json"}));

        $.ajax({
          url : '${root}/approval/approvalDocEdit',
          method : "POST" ,
          data : formData,
          enctype: 'multipart/form-data',
          contentType : false,
          processData : false,
          success : function(data){
            alert('수정 성공');
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