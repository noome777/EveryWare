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
  #detail-title{
      margin: 100px 0 50px 0;
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
        <h4 class="center appr-font-color">양식 생성</h4>
        <table class="table table-bordered mb-0 shadow" id="form-manager-table">
            <tr>
              <td class="appr-table-color">양식명</td>
              <td>
                <div class="form-group mb-3">
                  <input type="text" id="simpleinput" class="form-control" name="formName">
                </div>
              </td>
            </tr>
            <tr>
                <td class="appr-table-color">상태</td>
                <td>
                    <select class="custom-select form-control" id="formSelect" name="formUseYn">
                        <option selected>선택</option>
                        <option value="Y">사용</option>
                        <option value="N">미사용</option>
                    </select>
                </td>
            </tr>
        </table>

        <div id="detail-box">
          <div id="form-intro">
              <label for="example-textarea"><h5 class="appr-font-color">양식 설명</h5></label>
              <div class="form-group mb-3">
                  <textarea class="form-control" id="example-textarea" rows="4" name="formIntro"></textarea>
              </div>
          </div>
          
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
              </select>
            </div>

          </div>
        </div>
      </div>
    </div>
    <div class="text-center">
      <button type="submit" class="btn mb-2 btn-secondary ">생성하기</button>
    </div>
	</main>

  <script>
    //결재자 추가하기
    $('.add-user').on('click', function () {
      let formCode = $('#form-name option:selected').val();
      let formOption = $('#form-name option[value=' + formCode + ']')[0].outerHTML;

      //중복체크
      let selectedOptionVal = [];
      $($('#selected-detail option[value=' + formCode + ']')).each(function () {
        var selected = $(this).val();
        selectedOptionVal.push(selected);
      })

      if(selectedOptionVal.length == 0){
        $('#selected-detail').append(formOption);
      } else {
          if($.inArray(formCode, selectedOptionVal) != -1){
            alert('이미 추가한 항목입니다.');
          } else {
            $('#selected-detail').append(formOption);
          }
      }
    })

    //결재자 삭제하기
    $('.delete-user').on('click', function () {
      let formCode = $('#form-name option:selected').val();
      let formOption = $('#form-name option[value=' + formCode + ']');

      $('#selected-detail option[value=' + formCode + ']').remove();

      
    })
    
    $('[type=submit]').on('click', function () {
      //양식순서 추가
      selected = $('#selected-detail option');
      selected.each(function (i) {
        $('#selected-detail option').eq(i).attr('detailSeq', i+1);
      })
      
      let formName = $('[name=formName]').val();
      let formUseYn = $('[name=formUseYn]').val();
      let formIntro = $('[name=formIntro]').val();

      let formDetailList = [];
      $('[name=formDetailCode] option').each(function(){
        let object = {
          formDetailCode : $(this).val(),
          formDetailSeq : $(this).attr('detailSeq')
        };
        formDetailList.push(object)
      });
      console.log(formDetailList)

      let param = {
        formName : $('[name=formName]').val() ,
        formUseYn : $('[name=formUseYn]').val() ,
        formIntro : $('[name=formIntro]').val() , 
        formDetailList : formDetailList 
      };

      $.ajax({
        url : "${root}/approval/formInsert" ,
        method : "POST" ,
        contentType: "application/json; charset=utf-8",
        data : JSON.stringify(param) , // 컨텐츠 타입 및 stringify 작업을 통해 제이쿼리 ajax와 spring 사이의 파싱이슈 대비
        success : function (data) {
          alert('양식 생성 성공');
          location.href='${root}/approval/formManager'
        } ,
        error : (error) => {
          console.log(JSON.stringify(error));
        }
      })
      
    })

  </script>


</body>
</html>