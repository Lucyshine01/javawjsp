<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String imsiName = (String)session.getAttribute("sName");
	session.invalidate(); // 현재 저장된 모든 세션 삭제
	pageContext.setAttribute("imsiName", imsiName);
%>
<script>
	alert("${imsiName}님 세션 전체삭제 완료");
	location.href = "t3_SessionMain.jsp"
</script>