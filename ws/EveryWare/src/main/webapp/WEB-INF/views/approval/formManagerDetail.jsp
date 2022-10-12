<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EveryWare - 전자결재</title>
<style>
    .center{
        text-align: center;
        align-items: center;
        justify-content: center;
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
        margin: 100px 0 20px 0;
    }
    .appr-font-color{
        color: rgb(119, 118, 118);
    }
    #detail-box{
        margin-left: 20px;
    }
    #detail-box > div{
        margin-bottom: 5px;
    }
    .card{
        margin: 0 auto;
        width: 60vw;
    }
    #content-box{
        margin-left: 70px;
    }
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>

    <main role="main" class="main-content">
        <a href="${root}/approval/formEdit">수정하기</a>
        <div class="card shadow mb-4">
            <div class="card-body">
                <div>
                    <h3 class="center">양식 상세</h3>
                    <table class="table table-bordered mb-0 shadow" id="form-manager-table">
                        <tr>
                            <td class="appr-table-color">양식 번호</td>
                            <td class="appr-table-color">양식명</td>
                            <td class="appr-table-color">상태</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>품의서</td>
                            <td>사용</td>
                        </tr>
                    </table>
                    
                    <div id="content-box">
                        <h5 id="detail-title" class="appr-font-color">양식 설명</h5> 
                        <div id="detail-box">
                            품의할 수있는 품의서 입니다~~
                        </div>
        
                        <h5 id="detail-title" class="appr-font-color">양식 항목</h5>
                        <div id="detail-box">
                            <div>회계월</div>
                            <div>적요</div>
                            <div>송금요청</div>
                            <div>등</div>
                            <div>등</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

</body>
</html>