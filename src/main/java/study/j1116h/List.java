package study.j1116h;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/list")
public class List extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		ProductVO vo = new ProductVO(request.getParameterValues("type"), request.getParameterValues("p_name"),
																 request.getParameterValues("p_price"), request.getParameterValues("p_count"));
		request.setAttribute("vo", vo);
		PrintWriter out = response.getWriter();
		String viewPage = "/study/1116h/main.jsp?page=admin";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
