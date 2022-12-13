<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memNickNameCheck.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
		//닉네임 중복체크
		function nickNameCheck() {
			let nickName = childForm.nickName.value;
			
			if(nickName.trim() == ""){
				alert("닉네임을 입력하세요!");
				childForm.nickName.focus();
			}
			else {
				childForm.submit();
			}
		}
  	
		// 부모창에 닉네임값 보내기
		function sendCheck() {
			opener.window.document.myform.nickName.value = '${nickName}';
			opener.window.document.myform.nickNameCheck.value = 1;
			opener.nickChecksw = 1;
			opener.window.document.getElementById("nickNameCheck_label").style.visibility = "hidden";
			opener.window.document.myform.name.focus();
			window.close();
		}
  </script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h3>닉네임 체크폼</h3>
  <c:if test="${res == 1}">
  	<h4><font color="blue"><b>${nickName}</b></font> 닉네임은 사용 가능합니다.</h4>
	  <p><input type="button" value="창닫기" onclick="sendCheck()" /></p>
  </c:if>
  <c:if test="${res != 1}">
  	<h4><font color="blue"><b>${nickName}</b></font> 닉네임은 이미 사용중인 아이디입니다.</h4>
  	<form name="childForm" method="post" action="${ctp}/memNickNameCheck.mem">
  		<p>
  			<input type="text" name="nickName" />
  			<input type="button" value="닉네임재검색" onclick="nickNameCheck()" />
  		</p>
  	</form>
  </c:if>
</div>
<p><br/></p>
</body>
</html>