<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid = (String)session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
	if(!mid.equals("")){
		out.println("<script>");
		out.println("location.href='LoginMember.jsp'");
		out.println("</script>");
	}
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")){
				mid = cookies[i].getValue();
				pageContext.setAttribute("mid", mid);
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_Login.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <style>
  div.container{width: 600px;}
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${pageContext.request.contextPath}/j1118h2/LoginOk">
  	<table class="table table-bordered text-center">
  		<tr>
  			<td colspan="2"><font size="5">로 그 인</font></td>
  		</tr>
  		<tr>
  			<th class="bg-primary text-white" style="padding-top: 18px">아이디</th>
  			<td><input type="text" name="mid" value="${mid}" autofocus required class="form-control"/></td>
  		</tr>
  		<tr>
  			<th class="bg-primary text-white" style="padding-top: 18px">비밀번호</th>
  			<td><input type="password" name="pwd" value="" required class="form-control"/></td>
  		</tr>
  		<tr>
  			<td colspan="2">
  				<div style="float: right;">
  				<input type="checkbox" name="save" value="save"/> 아이디 저장
  				</div>
  				<input type="submit" value="로그인" class="btn btn-success form-control m-2"/>
  				<input type="reset" value="다시 입력" class="btn btn-danger form-control m-2"/>
  			</td>
  		</tr>
  	</table>
  </form>
</div>
<p><br/></p>
</body>
</html>