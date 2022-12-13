package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/MemberUpdate")
public class MemberUpdate extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		
		if(mid.equals("") || pwd.equals("") || name.equals("")) {
			out.println("<script>");
			out.println("alert('입력란을 비우고 수정하실수 없습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/myinfoupdate.jsp'");
			out.println("</script>");
		}
		else {
			JusorokDAO dao = new JusorokDAO();
			dao.updateUder(mid,pwd,name,(String)session.getAttribute("sMid"));
			session.setAttribute("sMid", mid);
			session.setAttribute("sPwd", pwd);
			session.setAttribute("sName", name);
			out.println("<script>");
			out.println("alert('수정완료!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/member.jsp'");
			out.println("</script>");
		}
	}
}
