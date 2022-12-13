<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>500번 에러</title>
  <jsp:include page="../../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>현재 공사중입니다.</h3>
  <p>작업에 불편을 드려서 죄송합니다.</p>
  <p>빠른시일내에 복수하도록 하겠습니다.</p>
  <p><a href="http://192.168.50.79:9090/javawsjsp" target="_blank">돌아가기</a></p>
  <p><img src="${pageContext.request.contextPath}/images/ecat.png" alt="에러" width="300px"/></p>
</div>
<p><br/></p>
</body>
</html>