<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_LoginMember.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <p><font color="blue">${sMid}님</font> 로그인 중이십니다.</p>
  <hr/>
  <p><img src="${pageContext.request.contextPath}/images/ecat.png" width="300px"/></p>
  <hr/>
  <p><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LoginDelete.jsp" class="btn btn-success form-control">쿠키의 아이디 삭제</a></p>
  <p><a href="${pageContext.request.contextPath}/study/storage/t2_LogOut" class="btn btn-success form-control">로그아웃</a></p>
<%--   <p><a href="${pageContext.request.contextPath}/study/1118_storage/t2_Login.jsp" class="btn btn-success form-control">로그아웃</a></p> --%>
  <hr/>
</div>
<p><br/></p>
</body>
</html>