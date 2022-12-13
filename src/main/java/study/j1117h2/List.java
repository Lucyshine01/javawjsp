package study.j1117h2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/list2")
public class List extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductVO vo = new ProductVO();
		vo.setType(request.getParameterValues("type"));
		vo.setP_name(request.getParameterValues("p_name"));
		vo.setP_price(request.getParameterValues("p_price"));
		vo.setP_count(request.getParameterValues("p_count"));
		vo.setId(request.getParameter("id"));
		request.setAttribute("vo", vo);
		String viewPage = "/study/1117h2/main.jsp";
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
