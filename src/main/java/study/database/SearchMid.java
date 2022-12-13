package study.database;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/SearchMid")
public class SearchMid extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idx = request.getParameter("idx")==null ? "" : request.getParameter("idx");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		JusorokDAO dao = new JusorokDAO();
		ArrayList<JusorokVO> vos = new ArrayList<>();
		HttpSession session = request.getSession();
		
		PrintWriter out = response.getWriter();
		if(idx.equals("") && mid.equals("") && name.equals("")) {
			out.println("<script>");
			out.println("alert('입력을 마치시고 검색해주세요!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/memberSearch.jsp'");
			out.println("</script>");
		}
		else {
			vos = dao.searchMember(idx,mid,name);
		}
		
		out.println("<script>");
		if(vos.size() != 0) {
			request.setAttribute("vos", vos);
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/memberSearch.jsp'");
		}
		else {
			out.println("alert('검색 결과가 없습니다!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/memberSearch.jsp'");
		}
		out.println("</script>");
	}
}
