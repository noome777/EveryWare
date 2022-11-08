<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 관리</title>

<style>


.card-wrap {
    
    margin-top: 45px;
    margin-left: 10px;
}

.grid-col {
  display: flex;
  justify-content: flex-end;
  align-items: center;
}

.grid-col > * {
  margin-right: 15px;
}

.profile-wrap {
  margin: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.profile-texts-wrap {
  margin-top: 20px;
  display: flex;
  flex-wrap: wrap;
  flex-direction: column;
  width: 85%;
}

.flex-items {
  height: 38px;
  display: grid;
  grid-template-columns: 1fr 2fr;
  align-items: center;
  justify-items: center;
}

.flex-items:hover {
  background-color: rgb(248, 249, 250);
}


#option-area {
  width: 80%;
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
}

#checkNum-area {
  width: 5%;
  height: 100%;
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  padding-bottom: 5px;
}

#option-button-area {
  width: 95%;
  height: 100%;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  padding-bottom: 8px;
  margin: 10px;
}

#option-button-area > button {
  margin-left: 10px;
  border-radius: 5px;
}

.hide-input{
	border:none;
	border-right:0px;
	border-top:0px;
	boder-left:0px; 
	boder-bottom:0px;
	text-align: center;
  color : gray;
  height: 34px;
}

.hide-select {
	border-style: none;
}


#search-body {
	display: flex;
	flex-direction: row;
	justify-content: flex-start;
}

#plus-icon {
  width: 27px;
  height: 27px;
  margin-top : 5px;
  margin-left : 7px;
}

#search-result-area {
	width : auto;
	height : auto;
	display: flex;
	flex-directrion : row;
	justify-content: center;
	align-items: center;
}

#rightSelector{
  width: 90px;
  height: 26px;
	border : 1px solid rgb(27, 104, 255); 
	text-align: center;
  border-radius: 8px;
  margin-right: 20px;
}

th, td {
  text-align: center !important;
}


</style>

	
</head>
<body class="vertical  light">

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/organization/sidemenu-content.jsp" %>
    
	<div class="wrapper">
	    <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row align-items-center my-3 margin">
                <div class="col">
                  <h2 class="h3 mb-0 page-title">권한 관리</h2>
                </div>
              </div>
              
              <!-- table -->
              <div class="card shadow card-wrap">
                <div class="card-body">
                    <div id="search-body">
                        <input type="text" id="search-bar" class="hide-input shadow" placeholder="관리자 추가" name="empData"> 
                        <input type="image" id="plus-icon" src="${root}/resources/img/plus.png" onclick="insertAdmin();">
                    </div>
                 </div>
                  <table class="table table-borderless table-hover">
                    <thead>
                      <tr>
                      	<th></th>
                        <th>프로필</th>
                        <th>이름(사번)</th>
                        <th>ID</th>
                        <th>직위</th>
                        <th>소속</th>
                        <th>권한</th>
                        <th></th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${adminList}" var="adminList">
                      <tr>
                        <td></td>
                        <td>
                          <div class="avatar avatar-sm">
                            <c:choose>
                              <c:when test="${empty adminList.empProfileName}">
                           	 		<img src="${root}/resources/img/guest.png" alt="..." class="avatar-img rounded-circle ${adminList.empCode}-profile" >
                           	  </c:when>
                           	  <c:otherwise>
                           	   	<img src="${root}/resources/upload/profile/${adminList.empProfileName}" alt="..." class="avatar-img rounded-circle ${adminList.empCode}-profile" >
                           	  </c:otherwise>
                           	</c:choose>
                          </div>
                        </td>
                        <td>
                          <p class="mb-0 text-muted">
                          	<strong>${adminList.empName}</strong>
                          </p>
                          <small class="mb-0 text-muted">${adminList.empCode}</small>
                        </td>
                        
                        <td>
                          <p class="mb-0 text-muted">
                         	 <a href="#" class="text-muted">${adminList.empId}</a>
                          </p>
                        </td>
                        <td >
                          <p class="mb-0 text-muted ${adminList.empCode}-rank">${adminList.rankName}</p>
                        </td>
                        <td>
                          <p class="mb-0 text-muted ${adminList.empCode}-dept">${adminList.deptName}</p>
                        </td>
                        <td>
                        	<p class="mb-0 text-muted ${adminList.empCode}-right">${adminList.rightName}</p>
                        </td>
                        <td>
                          <c:if test="${adminList.rightName ne '관리자'}">
                            <button class="btn shadow delete-btn" value="${adminList.empCode}">삭제</button>
                          </c:if>
                        </td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main> <!-- main -->
		</div>

    <!-- 관리자 추가 모달 -->
    <div class="modal fade" id="resultModal" tabindex="-1" role="dialog" aria-labelledby="verticalModalTitle" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" >관리자 추가</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div id="search-result-area" class="modal-body">
          	<table class="table table-borderless table-hover">
              <thead>
                <tr>
                  <th>체크</th>
                  <th>사번</th>
                  <th>이름</th>
                  <th>직위</th>
                  <th>소속</th>
                </tr>
              </thead>
              <tbody id="target">
                <tr>
                  <td colspan="5"></td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <div class="modal-footer">
            <select name="rightName" id="rightSelector">
              <option value="2">인사관리자</option>
              <option value="3">결재관리자</option>
            </select>
            <button type="button" class="btn mb-2 btn-primary" onclick="addAdmin();">추가</button>
            <button type="button" class="btn mb-2 btn-secondary" data-dismiss="modal" onclick="cleanModal();">취소</button>
          </div>
        </div>
      </div>
    </div>


    <!-- 삭제버튼 클릭 시 해당 관리자 사번 가져옴 -->
    <script>
      $(document).ready(function() {
          $('.delete-btn').click(function() {
            var value= $(this).val();
            console.log(value);

            var result = window.confirm("정말로 삭제하시겠습니까?");

            if(result==false) {
              return false;
            }

            console.log(result)

            $.ajax({
              url : "${root}/organization/management/right/delete",
              type : "POST",
              traditional : true,
              dataType : "JSON",
              data : {
                value : value
              },
              success : function(result) {
                alert(result);
                window.location.href = "${root}/organization/management/right";
              },
              error : function(fail) {
                alert(fail);
              }
            });

          });
      });
    </script>

    <script>

      function cleanModal() {

        var tbodyLength = $('#target tr').length;

        console.log(tbodyLength);

        for(let i=0; i<tbodyLength; ++i) {
          $('#target > tr').eq(i).empty();
        }
      }

    </script>
    
    <script>
    	function insertAdmin() {

    		
    		let word = $('#search-bar').val();

        const searchNum = word.search(/[0-9]/g);
				const searchEng = word.search(/[a-z]/ig);
				const searchSpe = word.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

				if(word.trim() === "") {
					alert("검색창에 글자를 입력하여 주시길 바랍니다.");
					return false;
				} else if(searchNum != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				} else if(searchEng != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				} else if(searchSpe != -1) {
					alert("검색창에는 한글만 적어주시길 바랍니다.");
					return false;
				}

        word = word.trim();

        $.ajax({
          
          url : "${root}/organization/management/right/select",
          type : "POST",
          traditional : true,
          dataType : "JSON",
          data : {
             word : word
          },
          success : function(jsonStr) {
            console.log(jsonStr);

            const resultLength = jsonStr.length;

            for (let i=0; i<resultLength; ++i) {
              var result = jsonStr.pop();

              $(target).prepend(
                '<tr>' + '<td><input type="checkbox" value="' + result['empCode']  +'"></td>' + 
                '<td>' + result['empCode'] + '</td>' +
                '<td>' + result['empName'] + '</td>' +
                '<td>' + result['rankName'] + '</td>' +
                '<td>' + result['deptName'] + '</td>' +
                '</tr>'
              );
            }
            $('#resultModal').modal();
          },
          error : function(fail) {
            alert(fail)
          }
        });
    		
    	}
    </script>

    <script>
      function addAdmin() {

        const checkBoxArr = [];
	      $('input:checkbox:checked').each(function(){
	       checkBoxArr.push($(this).val());
	      });

        const rightValue = $('#rightSelector').val();
	      
        var confirm = window.confirm("정말로 관리자에 추가하시겠습니까?");

        if(confirm==false) {
          alert("관리자 추가가 취소되었습니다.");
          return false;
        }
        
        $.ajax({
          url : "${root}/organization/management/right/add",
          type : "POST",
          traditional : true,
          dataType : "JSON",
          async : false,
          cache: false,
          data : {
            checkBoxArr : checkBoxArr,
            rightValue : rightValue
          },
          success : function(jsonStr) {
            alert(jsonStr);
          	window.location.href = "${root}/organization/management/right";
         },
          error : function(e) {
            alert(e);
          }
        });
    }


    </script>

		

</body>
</html>