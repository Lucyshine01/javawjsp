<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>form.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>자료 전송 연습</h2>
  <!-- <form name="myform" method="post" action="el1.jsp"> -->
  <form name="myform" method="post" action="${pageContext.request.contextPath}/study/el_jstl/El2">
	  <div>
	  	성명 : <input type="text" name="name" value="홍길동"  class="form-control"/>
	  </div>
	  <div>
	  	취미 : <input type="checkbox" name="hobby" value="독서" checked/>독서
	  	취미 : <input type="checkbox" name="hobby" value="수영"/>수영
	  	취미 : <input type="checkbox" name="hobby" value="등산"/>등산
	  	취미 : <input type="checkbox" name="hobby" value="바둑"/>바둑
	  	취미 : <input type="checkbox" name="hobby" value="승마"/>승마
	  </div>
	  <div>
	  	<input type="submit" value="전송" class="btn btn-success form-control mt-2" />
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>