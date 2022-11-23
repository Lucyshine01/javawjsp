<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	function fCheck() {
			
  		let name = document.getElementById("name").value;
  		let email = document.getElementById("email").value;
  		
  		let regName = /[a-zA-Z0-9가-힣]{2,20}/g;
  		let regMail = /[a-zA-Z0-9]{4,20}\@[a-zA-Z0-9]{4,20}\.[a-zA-Z]{1,3}/g;
  		
  		if() {
  			
  		}
  		
  		if(!name.match(regName)){
  			alert("이름 틀림!");
  			return false;
  		}
  		else if(!email.match(regMail) && email != ""){
  			alert("이메일 틀림!");
  			return false;
  		}
  		myform.submit;

		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${ctp}/guInputOk.gu" class="was-validated">
  	<h2>방 명 록 글 올 리 기</h2>
  	<br/>
  	<div class="form-group">
      <label for="name">성명</label>
      <input type="text" class="form-control" name="name" id="name" placeholder="이름 입력" required/>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">이름 입력은 필수입니다.</div>
    </div>
  	<div class="form-group">
      <label for="email">E-mail</label>
      <input type="text" class="form-control" name="email" id="email" placeholder="이메일 입력은 선택 사항입니다."/>
    </div>
  	<div class="form-group">
      <label for="homePage">홈페이지</label>
      <input type="text" class="form-control" name="homePage" id="homePage" value="http://" placeholder="홈페이지 입력은 선택 사항입니다."/>
    </div>
  	<div class="form-group">
      <label for="content">방문소감</label>
      <textarea rows="5" class="form-control" name="content" id="content" required></textarea>
      <div class="valid-feedback"></div>
      <div class="invalid-feedback">방문소감 입력은 필수입니다.</div>
    </div>
    <div class="form-group">
		  <button type="button" onclick="fCheck()" class="btn btn-primary">방명록 등록</button>
		  <button type="reset" class="btn btn-primary">방목록 다시입력</button>
		  <button type="button" onclick="location.href='${ctp}/guList.gu';" class="btn btn-primary">돌아가기</button>
    </div>
    <input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>