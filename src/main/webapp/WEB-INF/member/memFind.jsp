<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<c:set var="flag" value="${param.flag}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memFind.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function midCheck() {
			let email = myform.email1.value + '@' + myform.email2.value;
			
			if(email.trim() == ""){
				alert("입력란을 채우고 입력해주세요!");
				return;
			}
			
  		$.ajax({
  			type: "post",
  			url: "${ctp}/memFindMidOk.mem",
  			data: {email: email},
  			success: function(res) {
  				if(res == "0") {
  					alert("존재하지 않는 이메일입니다.");
  					return;
  				}
  				var midWin = window.open("midCheck","midWin","width=580px,height=250px");
  				midWin.document.write("<p><br/></p><h2>아이디는 "+res+"입니다.</h2>");
				},
  			error: function() {
					alert("전송 오류");
				}
  		});
		}
  	
  	function pwdCheck() {
  		let email = myform.email1.value + '@' + myform.email2.value;
  		let mid = myform.mid.value;
  		if(email.trim() == "" || mid.trim() == ""){
				alert("입력란을 채우고 입력해주세요!");
				return;
			}
  		$.ajax({
  			type: "post",
  			url: "${ctp}/memFindPwdOk.mem",
  			data: {email: email,mid: mid},
  			success: function(res) {
  				if(res == "0") {
  					alert("정보와 일치하는 계정이 없습니다!");
  					return;
  				}
  				var pwdWin = window.open("pwdCheck","pwdWin","width=580px,height=250px");
  				pwdWin.document.write("<p><br/></p><h2>재설정된 비밀번호는 "+res+"입니다.<br/>지급받으신 비밀번호를 로그인후 변경해주세요.</h2>");
  				location.href = "${ctp}/memLogin.mem";
				},
  			error: function() {
  				alert("전송 오류");
				}
  		});
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="container" style="padding: 30px">
				<div class="text-center mb-4 form-group">
			  	<input type="button" value="아이디 찾기" onclick="location.href='${ctp}/memFindMid.mem'" class="btn btn-outline-secondary" style="width: 45%"/>
			  	<input type="button" value="비밀번호 찾기" onclick="location.href='${ctp}/memFindPwd.mem'" class="btn btn-outline-secondary" style="width: 45%" />
		  	</div>
		  	<c:if test="${flag == 'mid'}">
			  	<form name="myform" class="was-validated">
				  	<h2>회원 찾기</h2>
				  	<p>회원 이메일을 입력해 주세요.</p>
				  	<div class="form-group mb-3">
				      <div class="input-group">
					      <input type="text" class="form-control" name="email1" id="email1"  placeholder="example" required autofocus/>
					      <div class="input-group-append">
					      	<span class="input-group-text">@</span>
					      </div>
					      <input type="text" class="form-control" name="email2" id="email2"  placeholder="example.com" required/>
					      <div class="valid-feedback"></div>
					      <div class="invalid-feedback">이메일을 입력해주세요.</div>
				      </div>
				    </div>
				    <div class="form-group text-right">
						  <button type="button" onclick="midCheck()" class="btn btn-primary">전송</button>
						  <button type="reset" class="btn btn-primary">다시입력</button>
						  <button type="button" onclick="location.href='${ctp}/';" class="btn btn-primary">돌아가기</button>
				    </div>
				  </form>
		  	</c:if>
		  	<c:if test="${flag == 'pwd'}">
			  	<form name="myform" class="was-validated">
				  	<h2>회원 찾기</h2>
				  	<p>회원 아이디와 이메일를 입력해 주세요.</p>
				  	<div class="form-group mb-3">
				      <input type="text" class="form-control" name="mid" id="mid"  placeholder="아이디를 입력해주세요" required autofocus/>
				      <div class="valid-feedback"></div>
				      <div class="invalid-feedback">아이디를 입력해주세요.</div>
				    </div>
				  	<div class="form-group mb-3">
				      <div class="input-group">
					      <input type="text" class="form-control" name="email1" id="email1"  placeholder="example" required/>
					      <div class="input-group-append">
					      	<span class="input-group-text">@</span>
					      </div>
					      <input type="text" class="form-control" name="email2" id="email2"  placeholder="example.com" required/>
					      <div class="valid-feedback"></div>
					      <div class="invalid-feedback">이메일을 입력해주세요.</div>
				      </div>
				    </div>
				    <div class="form-group text-right">
						  <button type="button" onclick="pwdCheck()" class="btn btn-primary">전송</button>
						  <button type="reset" class="btn btn-primary">다시입력</button>
						  <button type="button" onclick="location.href='${ctp}/';" class="btn btn-primary">돌아가기</button>
				    </div>
				  </form>
		  	</c:if>
		  </div>
  	</div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>