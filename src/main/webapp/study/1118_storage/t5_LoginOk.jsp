<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t5_LoginOk.jsp -->
<%
	String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
	
	if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
		session.setAttribute("sMid", mid);
		session.setAttribute("sPwd", pwd);
		
		int visitCnt = 0;
		if(application.getAttribute("aVisitCnt") == null){
			application.setAttribute("aVisitCnt", 1);
		}
		else {
			visitCnt++;
			visitCnt = (int)(application.getAttribute("aVisitCnt")) + visitCnt;
			application.setAttribute("aVisitCnt", visitCnt);
		}
		out.println("<script>");
		out.println("alert('"+mid+"님 로그인 되셨습니다.');");
		out.println("location.href='t5_LoginMember.jsp';");
		out.println("</script>");
	}
	else {
		out.println("<script>");
		out.println("alert('아이디와 비밀번호가 불일치합니다!');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>