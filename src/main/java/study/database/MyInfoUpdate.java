package study.database;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/MyInfoUpdate")
public class MyInfoUpdate extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		JusorokDAO dao = new JusorokDAO();
		String mid = (String)session.getAttribute("sMid");
		
		JusorokVO vo = dao.getMemberSearch(mid);
		
		request.setAttribute("vo", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1120_Database/myinfoupdate.jsp");
		dispatcher.forward(request, response);
	}
}
