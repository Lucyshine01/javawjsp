<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
		
		String save = request.getParameter("save");
		if(save.equals("save")){
			Cookie cookieMid = new Cookie("cMid",mid);
			cookieMid.setMaxAge(60*5); // 쿠기의 만료시간을 5분으로 설정.
			response.addCookie(cookieMid);
		}
		
		out.println("<script>");
		out.println("alert('"+mid+"님 로그인 되셨습니다.');");
		out.println("location.href='t2_LoginMember.jsp?mid="+mid+"';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('아이디와 비밀번호가 불일치합니다!');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>