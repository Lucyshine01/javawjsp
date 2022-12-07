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
  	else if(msg == "idCheckNo") msg = "중복된 아이디 입니다.";
  	else if(msg == "nickCheckNo") msg = "중복된 닉네임 입니다.";
  	else if(msg == "memJoinOk") msg = "회원 가입 되셨습니다.";
  	else if(msg == "memJoinNo") msg = "회원 가입에 실패하셨습니다.";
  	else if(msg == "passwordNo") msg = "비밀번호를 확인하세요!";
  	else if(msg == "passwordOk") msg = "비밀번호를 변경하였습니다.";
  	else if(msg == "passwordOkNo") msg = "비밀번호를 변경실패!";
  	else if(msg == "passwordYes") msg = "회원정보 수정창으로 이동합니다.";
  	else if(msg == "memUpdateOk") msg = "회원정보가 변경되었습니다.";
  	else if(msg == "memUpdateNo") msg = "회원정보 변경실패!!";
  	else if(msg == "levelCheckOk") msg = "회원 등급이 변경처리 되었습니다.";
  	else if(msg == "memberDelOk") msg = "정상적으로 회원탈퇴 되셨습니다.";
  	else if(msg == "memberDelNo") msg = "비밀번호가 불일치합니다! 탈퇴실패";
  	else if(msg == "loginNoUserDel") msg = "탈퇴된 계정입니다.\n다른 계정으로 로그인해주세요.";
  	else if(msg == "delMemberOk") msg = "탈퇴처리 되었습니다.";
  	else if(msg == "sessionOver") msg = "세션이 만료되었습니다.";
  	else if(msg == "boInputOk") msg = "게시글이 정상 등록되었습니다.";
  	else if(msg == "boInputNo") msg = "게시글 등록이 처리되지 못했습니다.";
  	else if(msg == "boDeleteOk") msg = "게시글이 삭제 처리되었습니다.";
  	else if(msg == "boDeleteNo") msg = "게시글이 삭제되지 못했습니다.";
  	else if(msg == "userCheckNo") msg = "비정상적인 접근입니다.";
  	else if(msg == "boUpdateOk") msg = "게시글이 수정되었습니다.";
  	else if(msg == "boUpdateNo") msg = "게시글이 수정처리에 실패했습니다.";
  	else if(msg == "upLoad1Ok") msg = "파일이 업로드 되었습니다.";
  	else if(msg == "upLoad1No") msg = "파일업로드가 실패하였습니다.";
  	else if(msg == "pdsInputOk") msg = "자료실에 파일이 업로드 되었습니다.";
  	else if(msg == "pdsInputNo") msg = "파일업로드가 실패하였습니다.";
  	else if(msg == "pdsDeleteOk") msg = "파일 삭제가 완료되었습니다.";
  	else if(msg == "pdsDeleteNo") msg = "파일 삭제처리를 실패했습니다.";
  	
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