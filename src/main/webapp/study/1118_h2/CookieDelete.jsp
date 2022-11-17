<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	int sw = 0;
	if(cookies != null){
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")){
				System.out.println(cookies[i]);
				System.out.println(cookies[i].getName());
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				sw = 1;
			}
		}
		if(sw == 1) {
			out.println("<script>");
			out.println("alert('"+session.getAttribute("sMid")+"님의 쿠키가 삭제되었습니다.');");
			out.println("location.href = '"+request.getContextPath()+"/study/1118_h2/LoginMember.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('"+session.getAttribute("sMid")+"님의 쿠키가 존재하지 않습니다!');");
			out.println("location.href = '"+request.getContextPath()+"/study/1118_h2/LoginMember.jsp';");
			out.println("</script>");
		}
	}
%>