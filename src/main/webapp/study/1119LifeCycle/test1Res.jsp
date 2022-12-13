<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1Res.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>JSP/Servlet Life Cycle 연습(test1Res.jsp)</h2>
	<table class="table">
		<tr>
			<th>제목</th>
			<td>${title}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${content}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="location.href='${pageContext.request.contextPath}/study/1119LifeCycle/test1.jsp'" value="돌아가기" class="btn btn-success form-control"/></td>
		</tr>
	</table>
</div>
<p><br/></p>
</body>
</html>