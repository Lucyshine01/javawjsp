<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();

	if(cookies != null){
		for(int i=0; i<cookies.length; i++) {
			// 쿠키의 만료시간을 0을 줌으로써 소멸(삭제,제거)시킨다
			cookies[i].setMaxAge(0);
			// 클라이언트에 저장된 쿠기에 현재 남은시간이 0 남은 쿠기를
			// 덮어씌움으로써 클라이언트측에서 쿠기가 자동 삭제되도록 처리
			response.addCookie(cookies[i]);
		}
	}
%>
<script>
	alert("쿠키가 삭제되었습니다.");
	location.href = "t1_CookiesMain.jsp";
</script>