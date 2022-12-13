package study.j1118h2;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/j1118h2/LoginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		PrintWriter out = response.getWriter();
		
		if((mid.equals("admin") && pwd.equals("1234")) || (mid.equals("hkd1234") && pwd.equals("1234"))) {
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			
			String save = request.getParameter("save") == null ? "" : request.getParameter("save");
			if(save.equals("save")) session.setAttribute("sIdSave", "save");
				
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study/1118_h2/LoginMember.jsp';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('아이디와 비밀번호가 불일치합니다!');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
