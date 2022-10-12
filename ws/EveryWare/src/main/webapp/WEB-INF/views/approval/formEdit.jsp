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
        margin: 100px 0 10px 0;
    }
    .appr-font-color{
        color: rgb(119, 118, 118);
    }
    /* #detail-box{
        margin-left: 20px;
    } */
    .card{
        margin: 0 auto;
        width: 60vw;
    }
    #content-box{
        margin-left: 70px;
    }
    #form-detail > label{
        font-size: 0.9rem;
        margin-bottom: 15px;
    }
    #form-detail > div{
        margin: 15px;
    }
</style>
</head>
<body>

	<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ include file="/WEB-INF/views/approval/sidemenu-content.jsp" %>

    <main role="main" class="main-content">
        <form action="">
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
                                <td>
                                    <select class="custom-select form-control" id="formSelect">
                                        <option selected>선택</option>
                                        <option>사용</option>
                                        <option>미사용</option>
                                    </select>
                                </td>
                            </tr>
                        </table>
                        
                        <div id="content-box">
                            <h5 id="detail-title" class="appr-font-color">양식 설명</h5> 
                            <div id="detail-box">
                                <div class="form-group mb-3 m-auto">
                                    <label for="example-textarea"></label>
                                    <textarea class="form-control" id="example-textarea">품의 할 수 있는 품의서 입니다 ~~</textarea>
                                </div>
                                
                            </div>
            
                            <h5 id="detail-title" class="appr-font-color">양식 항목</h5>
                            <div id="form-detail">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck1">
                                    <label class="custom-control-label" for="customCheck1">내용</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck2">
                                    <label class="custom-control-label" for="customCheck2">회계월</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck3">
                                    <label class="custom-control-label" for="customCheck3">적요</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck4">
                                    <label class="custom-control-label" for="customCheck4">계좌번호</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck5">
                                    <label class="custom-control-label" for="customCheck5">거래처명</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck6">
                                    <label class="custom-control-label" for="customCheck6">송금</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck7">
                                    <label class="custom-control-label" for="customCheck7">수신자</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="customCheck8">
                                    <label class="custom-control-label" for="customCheck8">참조인</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="text-center">
                <button type="button" class="btn mb-2 btn-secondary ">수정하기</button>
            </div>
        </form>
    </main>

</body>
</html>