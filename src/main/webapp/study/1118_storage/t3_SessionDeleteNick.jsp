<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	session.removeAttribute("sNickName");
%>	
<script>
	alert("${sName}님 닉네임 세션 삭제 완료");
	location.href = "t3_SessionMain.jsp"
</script>