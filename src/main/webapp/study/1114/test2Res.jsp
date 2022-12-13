<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String name = request.getParameter("name");
	String hostIp = request.getParameter("hostIp");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 관리자화면입니다.</h2>
  <P>전송된 아이디 : <%=mid%></P>
  <P>성명 : <%=name%></P>
  <hr/>
  <p><img src="../../images/2.png" width="200px"/></p>
  <hr/>
  접속 전송방식 : <%=request.getMethod() %><br/>
  접속 URL : <%=request.getRequestURL() %><br/>
  접속 URI : <%=request.getRequestURI() %><br/>
  접속 서버이름 : <%=request.getServerName() %><br/>
  접속 포트번호 : <%=request.getServerPort() %><br/>
  요청 파라메터 길이 : <%=request.getContentLength() %><br/>
  현재 ContextPath : <%=request.getContextPath() %><br/>
  현재 사용중인 프로토콜 : <%=request.getProtocol() %><br/>
  접속자 IP : <%=hostIp %><br/>
  <hr/>
  <p>
  	<!-- <a href="logout.jsp">로그아웃</a> -->
  	<a href="<%=request.getContextPath()%>/j1114_Logout?name=<%=name%>">로그아웃</a>
  </p>
</div>
<p><br/></p>
</body>
</html>