<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/bs4.jsp" %>
<!-- test1Ok.jsp -->
<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	String name = request.getParameter("name")==null ? "" : request.getParameter("name");
%>
<p><br/></p>
<div class="container">
	<p>아이디 : <%=mid%></p>
	<p>비밀번호 : <%=pwd%></p>
	<p>성명 : <%=name%></p>
	<p><a href="test1.jsp" class="btn btn-success">돌아가기</a></p>
</div>
<% if(mid.equals("admin") && pwd.equals("1234")){ %>
<!--jsp:forward : 물흐르듯이 페이지를 바로 넘김  -->
		<jsp:forward page="test1Res.jsp">
			<jsp:param value="<%=pwd%>" name="flag"/>
		</jsp:forward>
<% } else { %>
		<jsp:forward page="test1.jsp"></jsp:forward>
<% }%>