<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
  .center{
      align-items: center;
      justify-content: center;
      text-align: center;
  }
  .appr-table-color{
      background-color: rgb(244, 249, 255);
  }
  #form-manager-table{
      margin: 0 auto;
      margin-top: 30px;
      width: 80%;
      
  }

  .appr-font-color{
      color: rgb(119, 118, 118);
  }
  #detail-box{
      margin: 0 auto;
      margin-top: 80px;
      width: 80%;
      height: 800px;
  }
  .text-center{
      margin-top: 20px;
  }
  #form-detail > label{
      font-size: 0.9rem;
      margin-bottom: 15px;
  }
  #form-detail > div{
      margin: 15px;
  }
  #form-intro{
      margin: 50px 0;
  }
	#form-select-box{
		height: 500px;
	}
	.w-80{
		width: 80%
	}
  #selected-detail, #form-name{
    height: 100px;
  }
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>

	<main role="main" class="main-content">
		
    <div class="card shadow w-75 m-auto">
      <div class="card-body">
        <h4 class="center appr-font-color">양식 수정</h4>
        <table class="table table-bordered mb-0 shadow" id="form-manager-table">
            <tr>
              <td class="appr-table-color">양식명</td>
              <td>
                <div class="form-group mb-3">
                  ${docForm.formName}
                </div>
              </td>
            </tr>
            <tr>
                <td class="appr-table-color">사용여부</td>
                <td>
                    <select class="custom-select form-control" id="formSelect" name="formUseYn">
                        <option>선택</option>
                        <option value="Y" <c:if test="${docForm.formUseYn eq 'Y'}">selected="selected"</c:if>>사용</option>
                        <option value="N" <c:if test="${docForm.formUseYn eq 'N'}">selected="selected"</c:if>>미사용</option>
                    </select>
                </td>
            </tr>
        </table>

        <div id="detail-box">
          <div id="form-intro">
              <label for="example-textarea"><h5 class="appr-font-color">양식 설명</h5></label>
              <div class="form-group mb-3">
                  <textarea class="form-control" id="example-textarea" rows="4" name="formIntro">${docForm.formIntro}</textarea>
              </div>
          </div>
          
					<h5 id="detail-title" class="appr-font-color">양식 항목</h5>
						<hr>

            <div id="form-select-box" class="d-flex w-100 m-auto">

              <div id="name-list" class="w-50 h-100">
                <label for="example-textarea"><h6 class="appr-font-color">전체 항목</h6></label>
                <select id="form-name" multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll">
                  <c:forEach items="${formDetailList}" var="f">
                    <option value="${f.formDetailCode}">${f.formDetailName}</option>
                  </c:forEach>
                </select>
              </div>
  
              <div class="w-25 h-150 d-flex flex-column justify-content-center align-items-center">
                <a id="" class="fe fe-32 fe-arrow-right-circle w-25 mb-1 add-user"></a>
                <a class="fe fe-32 fe-arrow-left-circle w-25 delete-user"></a>
              </div>
              
  
              <div id="selected-list" class="w-50 h-100">
                <label for="example-textarea"><h6 class="appr-font-color">추가할 항목</h6></label>
                <select id="selected-detail" multiple="multiple" class="custom-select form-control w-100 h-100 non-scroll" name="formDetailCode">
                  <c:forEach items="${formMappingList}" var="f">
                    <option value="${f.formDetailCode}">${f.formDetailName}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
        </div>
      </div>
    </div>
    <div class="text-center">
      <button type="submit" class="btn mb-2 btn-secondary ">수정하기</button>
    </div>
	</main>

  <script>

    $('[type=submit]').on('click', function () {

      //양식순서 추가
      selected = $('#selected-detail option');
      selected.each(function (i) {
        $('#selected-detail option').eq(i).attr('detailSeq', i+1);
      })
      
      let formDetailList = [];
      $('[name=formDetailCode] option').each(function(){
        let object = {
          formDetailCode : $(this).val(),
          formDetailSeq : $(this).attr('detailSeq')
        };
        formDetailList.push(object)
      });

      let param = {
				formCode : '${docForm.formCode}' ,
        formUseYn : $('[name=formUseYn]').val() ,
				formIntro : $('[name=formIntro]').val() ,
        formDetailList : formDetailList 
      };

      $.ajax({
        url : "${root}/approval/formEdit" ,
        method : "POST" ,
        contentType: "application/json; charset=utf-8",
        data : JSON.stringify(param) ,
        success : function (data) {
          alert('양식 수정 성공');
          location.href='${root}/approval/formManager'
        } ,
        error : (error) => {
          console.log(JSON.stringify(error));
        }
      })
      
    })

    $('.add-user').on('click', function () {
      let detailCode = $('#form-name option:selected').val();
      let formOption = $('#form-name option[value=' + detailCode + ']')[0].outerHTML;

      let selectedOptionVal = [];
      $($('#selected-detail option[value=' + detailCode + ']')).each(function () {
        var selected = $(this).val();
        selectedOptionVal.push(selected);
      })

      if(selectedOptionVal.length == 0){
        $('#selected-detail').append(formOption);
      } else {
          if($.inArray(detailCode, selectedOptionVal) != -1){
            alert('이미 추가한 항목입니다.');
          } else {
            $('#selected-detail').append(formOption);
          }
      }
    })

    $('.delete-user').on('click', function () {
      let detailCode = $('#selected-detail option:selected').val();
      $('#selected-detail option[value=' + detailCode + ']').remove();
    })
    
  </script>


</body>
</html>