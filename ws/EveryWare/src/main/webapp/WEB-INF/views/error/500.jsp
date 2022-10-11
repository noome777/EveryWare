<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error</title>
<body>
	<div style="display: none">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
	</div>
	<div class="wrapper vh-100">
      <div class="align-items-center h-100 d-flex w-50 mx-auto">
        <div class="mx-auto text-center">
          <h1 class="display-1 m-0 font-weight-bolder text-muted" style="font-size:80px;">500</h1>
          <h1 class="mb-1 text-muted font-weight-bold">OOPS!</h1>
          <h6 class="mb-3 text-muted">The page could not be found.</h6>
          <a href="${root}" class="btn btn-lg btn-primary px-5">Back to Dashboard</a>
        </div>
      </div>
    </div>
</body>
</html>