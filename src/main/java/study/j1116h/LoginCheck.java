package study.j1116h;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/main/check")
public class LoginCheck extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String id = request.getParameter("id")==null ? "" : request.getParameter("id");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		ProductVO vo = new ProductVO(request.getParameterValues("type"), request.getParameterValues("p_name"),
																 request.getParameterValues("p_price"), request.getParameterValues("p_count"));
		request.setAttribute("vo", vo);
		PrintWriter out = response.getWriter();
		if(id.equals("admin") &&pwd.equals("1234")) {
			String viewPage = "/study/1116h/product.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
		else {
//			out.println("<script>alert('관리자 로그인 실패!!!');</script>");
			request.setAttribute("fail", "fail");
			String viewPage = "/study/1116h/main.jsp";
			request.getRequestDispatcher(viewPage).forward(request, response);
		}
	}
}
