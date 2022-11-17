<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	String pwd = session.getAttribute("sPwd")==null ? "" : (String)session.getAttribute("sPwd");

%>
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
  <p>
  	방문카운트(session) : <br/>
  	전체 총방문카운트(application) : <font color='red'><b>${aVisitCnt}</b></font>
  </p>
  <hr/>
  <%
  	if(mid.equals("admin") && pwd.equals("1234")){
  		out.println("<p><a href='${pageContext.request.contextPath}/study/1118_storage/t5_LoginDelete.jsp' class='btn btn-success form-control'>전체 방문카운트 초기화</a></p>");
  	}
  %>
  <p><a href="${pageContext.request.contextPath}/study/1118_storage/t5_LogOut.jsp" class="btn btn-success form-control">로그아웃</a></p>
  <hr/>
</div>
<p><br/></p>
</body>
</html>