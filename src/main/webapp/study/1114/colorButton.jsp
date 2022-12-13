<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>colorButton.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <div class="w3-container">
	  <h2>Buttons (w3-button)</h2>
	  <input type="button" class="w3-button w3-black" value="Input Button">
	  <button class="w3-button w3-black">Button Button</button>
	  <a href="#" class="w3-button w3-black">Link Button</a>
	</div>
</div>
	<hr /><br />
	<div class="container">
	  <div class="w3-container">
		  <h2>Buttons (bs4-button)</h2>
		  <input type="button" class="btn w3-khaki w3-hover-sand w3-padding-large" value="Input Button">
		  <button class="btn w3-khaki w3-hover-sand">Button Button</button>
		  <a href="#" class="btn w3-khaki w3-hover-sand">Link Button</a>
		  <hr /><br />
		  <div style="width: 600px;height: 200px;" class="w3-pink">
		  	이곳은 내용영역입니다.
		  </div>
		</div>
	</div>
<p><br/></p>
</body>
</html>