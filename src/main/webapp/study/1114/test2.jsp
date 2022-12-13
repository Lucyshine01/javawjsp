<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = request.getParameter("mid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	
	mid = mid==null ? "" : mid;
	pwd = pwd==null ? "" : pwd;
	name = name==null ? "" : name;
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test1.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script>
  	let type = document.getElementsByName("t123");
  </script>
  <style></style>
</head>
<!-- 로그인창에서 '아이디/비밀번호/성명'을 입력후
		서버로 전송후, 관리자 인증이 되면 인증성공창에서 입력된 '아이디/성명'을 모두 출력하시오.
 -->
<body>
<p><br/></p>
<div class="container" style="border: 2px solid #ddd; border-radius: 10px; width: 600px;">
	<form name="myform" method="post" action="<%=request.getContextPath()%>/1114_Test2">
		<div style="text-align: center"><h2>로 그 인</h2></div>
		<p>
			아이디 : <input type="text" value="<%=mid%>" name="mid" id="mid" autofocus required class="form-control" >
		</p>
		<p>
			비밀번호 : <input type="password" value="<%=pwd%>" name="pwd" id="pwd" required class="form-control" >
		</p>
		<p>
			성명 : <input type="text" value="<%=name%>" name="name" id="name" required class="form-control" >
		</p>
		<p style="display: grid; grid-template-columns: 1fr 1fr;">
			<input type="submit" value="전송" class="btn btn-success form-control mr-2"/>
			<input type="reset" value="다시입력" class="btn btn-warning form-control ml-2"/>
		</p>
		<input type="hidden" name="hostIp" value="<%=request.getRemoteAddr()%>"/>
	</form>
</div>
<p><br/></p>
</body>
</html>