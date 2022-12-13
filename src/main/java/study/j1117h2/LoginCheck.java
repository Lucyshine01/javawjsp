package study.j1117h2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/check2")
public class LoginCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		ProductVO vo = new ProductVO();
		vo.setType(request.getParameterValues("type"));
		vo.setP_name(request.getParameterValues("p_name"));
		vo.setP_price(request.getParameterValues("p_price"));
		vo.setP_count(request.getParameterValues("p_count"));
		vo.setId(request.getParameter("id"));
		String id = vo.getId();
		request.setAttribute("vo", vo);
		if(id.equals("admin") &&pwd.equals("1234")) {
			String viewPage = "/study/1117h2/product.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
		else if(id == null) {
			String viewPage = "/study/1117h2/main.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
		else {
			request.setAttribute("fail", "fail");
			String viewPage = "/study/1117h2/main.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}
