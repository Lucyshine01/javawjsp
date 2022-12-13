<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelpwd.jsp -->
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cPwd")){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
%>
<script>
	alert("비밀번호 쿠키가 삭제되었습니다.");
	location.href = "t1_CookiesMain.jsp";
</script>