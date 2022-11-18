package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/MemberDelete")
public class MemberDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		String mid = session.getAttribute("sMid")==null ? "" : (String)session.getAttribute("sMid");
		if(!mid.equals("")) {
			JusorokDAO dao = new JusorokDAO();
			dao.deleteUser(mid);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1120_Database/login.jsp");
			dispatcher.forward(request, response);
		}
		else {
			out.println("<script>");
			out.println("alert('오류 : 삭제실패!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/myinfoupdate.jsp'");
			out.println("</script>");
		}
	}
}
