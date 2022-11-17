<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t3_SessionCheck.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style>
  	.col, .row {
  		padding: 0px;
  		margin-top: 10px;
  		margin-bottom: 10px;
  	}
 	</style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2 class="mb-2">세션 확인</h2>
  <div class="border">
	  <div class="row">
	  	<div class="col">세션 아이디</div>
	  	<div class="col">${sMid}</div>
	  </div>
	  <div class="row">
	  	<div class="col">세션 닉네임</div>
	  	<div class="col">${sNickName}</div>
	  </div>
	  <div class="row">
	  	<div class="col">세션 나이</div>
	  	<div class="col">${sAge}</div>
	  </div>
	  <div class="row">
	  	<div class="col">세션 성명</div>
	  	<div class="col">${sName}</div>
	  </div>
	  <div class="row">
	  	<div class="col">
	  		<a href="t3_SessionMain.jsp" class="btn btn-success form-control">돌아가기</a>
	  	</div>
	  </div>
	</div>
</div>
<p><br/></p>
</body>
</html>