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
  <form name="myform" method="post" action="${pageContext.request.contextPath}/study/el_jstl/el1">
	  <div>
	  	atom : <input type="text" name="atom" value="Seoul"  class="form-control"/>
	  </div>
	  <div>
	  	성명 : <input type="text" name="name" value="홍길동"  class="form-control"/>
	  </div>
	  <div>
	  	첫번째수 : <input type="text" name="su1" value="100"  class="form-control"/>
	  </div>
	  <div>
	  	두번째수 : <input type="text" name="su2" value="200"  class="form-control"/>
	  </div>
	  <div>
	  	<input type="submit" value="전송" class="btn btn-success form-control mt-2" />
	  </div>
  </form>
</div>
<p><br/></p>
</body>
</html>