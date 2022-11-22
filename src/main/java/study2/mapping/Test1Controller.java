package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/mapping/Test1")
public class Test1Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String back = (String)request.getAttribute("back")==null ? "" : (String)request.getAttribute("back");
//		if(back.equals("true")) {
//			System.out.println("/mapping/Test1 서블릿에 다시오셨습니다.");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");
//			dispatcher.forward(request, response);
//		}
		System.out.println("/mapping/Test1 서블릿입니다.");
		Test2Ok ok = new Test2Ok();
		Test2OkOk ok2 = new Test2OkOk();
		ok.msg();
		ok2.msg();
		System.out.println("/mapping/Test1 서블릿에 다시오셨습니다.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");
		dispatcher.forward(request, response);
	}
}
