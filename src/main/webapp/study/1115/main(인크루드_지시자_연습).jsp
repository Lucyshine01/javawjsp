<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null ? "" : request.getParameter("sw");
			
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script></script>
  <style>
  	body {
  		margin: 0 auto;
  		padding: 0px;
  	}
  	#header {
  		background-color: aquamarine;
  		text-align: center;
  		height: 90px;
  	}
  	#content {
  	 	margin: 0 auto;
  		background-color: #eee;
  		text-align: center;
  	}
  	#footer {
  		background-color: #ddd;
  		text-align: center;
  		height: 80px;
  	}
  </style>
</head>
<body>
<div class="container">
	<!-- 헤더영역(메뉴/로고를 표시한다.) -->
  <div id="header">
  	<%@ include file="menu.jsp" %>
  </div>
  <!-- 본문영역 -->
  <div id="content">
	  <%if(sw.equals("guest")) { %>
	  	<%@ include file="guest.jsp" %>
	  <%} else if(sw.equals("board")) { %>
	  	<%@ include file="board.jsp" %>
	  <%} else if(sw.equals("pds")) { %>
	  	<%@ include file="pds.jsp" %>
	  <%} else if(sw.equals("photo")) { %>
	  	<%-- <%@ include file="photo.jsp" %> --%>
	  	<jsp:include page="photo.jsp"></jsp:include>
	  <%} else { %>
	  <h2>이곳은 메인 화면 입니다.</h2>
	  <hr/>
	  <p><img src="../../images/1.png" width="600px"/></p>
	  <%} %>
	  <br/>
	</div>
  <!-- 푸터영역(Copyright나 주소, 소속, 작성자 등을 기술한다.) -->
  <div id="footer">
  	<%@ include file="footer.jsp" %>
  </div>
</div>
</body>
</html>