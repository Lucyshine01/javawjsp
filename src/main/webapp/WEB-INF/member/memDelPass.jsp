<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memDelPass.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
	  'use strict';
		function memberDel() {
			let pwd = document.getElementById("pwd").value;
			if(pwd.trim()==""){
				alert("비밀번호를 입력하세요!");
				document.getElementById("pwd").focus();
				return;
			}
			let ans = confirm("정말로 탈퇴하시겠습니까?");
			if(ans) {
				ans = confirm("탈퇴후 1개월간은 같은아이디로 가입하실수 없습니다.\n탈퇴 하시겠습니까?");
				if(ans) myform.submit();
			}
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/memDeleteOk.mem" class="was-validated">
  	<h2 class="text-center">회원탈퇴 인증</h2>
		<table class="table table-bordered">
			<tr>
				<th class="text-center" style="padding-top: 20px">비밀번호 입력</th>
				<td>
					<input type="password" name="pwd" id="pwd" autofocus required class="form-control" />
					<div class="invalid-feedback">비밀번호를 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="text-center">
					<input type="button" value="회원 탈퇴" onclick="memberDel()" class="btn btn-danger" /> &nbsp;
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/';" class="btn btn-success" />
				</td>
			</tr>
		</table>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>