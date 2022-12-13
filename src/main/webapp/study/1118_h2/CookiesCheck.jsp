<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t1_CookesCheck.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style>
  	
 	</style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2 class="mb-2">쿠키 확인</h2>
  <hr/>
<%
	Cookie[] cookies = request.getCookies();
	
	out.println("<table class='table table-hover'>");
	out.println("<thead class='table-dark'><tr><th>번호</th><th>저장된 쿠기명</th><th>저장된 쿠기값</th></tr></thead>");
	for(int i=0; i<cookies.length; i++) {
		out.println("<tr class='table-Light'>");
		String cookName = cookies[i].getName(); // 쿠키명(저장시켜놓은 쿠키변수명) 가져오기
		String cookValue = cookies[i].getValue(); // 쿠기값(저장시켜놓은 쿠기값) 가져오기
		out.println("<td>"+(i+1)+"</td>");
		out.println("<td>"+cookName+"</td>");
		out.println("<td>"+cookValue+"</td>");
		out.println("</tr>");
	}
	out.println("</table>");
%>
	<hr/>
	<div>
		<a href="LoginMember.jsp" class="btn btn-secondary form-control">돌아가기</a>
	</div>
</div>
<p><br/></p>
</body>
</html>