<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null){
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")){
				mid = cookies[i].getValue();
				request.setAttribute("mid", mid);
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
  <script></script>
  <%-- <%
  	String a = request.getParameter("a")==null ? "" : request.getParameter("a");
  	if(a.equals("logout")){
  		out.println("<script>");
  		out.println("alert('로그아웃 되셨습니다.');");
  		out.println("</script>");
  	}
  %> --%>
  <style>
  div.container{
  	width: 600px;
  }
  </style>
</head>
<body>
<p><br/></p>
<div class="container">
  <form name="myform" method="post" action="${pageContext.request.contextPath}/study/storage/T2_LoginOk">
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
  				<div>
  				<input type="radio" name="save" value="save" /> 아이디 저장 &nbsp;
  				<input type="radio" name="save" value="nonesave" /> 저장 안하기
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