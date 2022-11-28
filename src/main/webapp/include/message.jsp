<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>message.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <!-- 순서 서버 언어 => 뷰 언어 -->
  <script>
  	'use strict'
  	 
  	let msg = "${msg}";
  	let url = "${url}";
  	let val = "${val}"
  	
  	if(msg == "guInputOk") msg = "방명록에 글이 등록되었습니다.";
  	else if(msg == "guInputNo") msg = "방명록에 글등록이 실패하였습니다!";
  	else if(msg == "adminLoginOk") msg = "관리자 인증 성공!";
  	else if(msg == "adminLoginNo") msg = "관리자 인증 실패";
  	else if(msg == "adminLogoutOk") msg = "관리자님 로그아웃 되셨습니다.";
  	else if(msg == "guDeleteOk") msg = "해당 방명록 글이 삭제되었습니다.";
  	else if(msg == "guDeleteNo") msg = "방명록 글삭제가 완료되지못했습니다!";
  	else if(msg == "loginOk") msg = val + "님 로그인되셨습니다.";
  	else if(msg == "loginNo") msg = "아이디 혹은 비밀번호가 불일치합니다.";
  	else if(msg == "memLogoutOk") msg = val + "님 로그아웃 되었습니다.";
  	
  	
		alert(msg);
		if(url != "") location.href = url;
		
		/* 
		$(function(){
			let msg = $("#msg").val();
			let url = $("#url").val();
			
			if(msg == "guInputOk") msg = "방명록에 글이 등록되었습니다.";
	  	else if(msg == "guInputNo") msg = "방명록에 글등록이 실패하였습니다!";
		  	
			alert(msg);
			if(url != "") location.href = url;
		});
		 */
  </script>
  <style></style>
</head>
<body>
	<input type="hidden" id="msg" value="${msg}" />
	<input type="hidden" id="url" value="${url}" />
</body>
</html>