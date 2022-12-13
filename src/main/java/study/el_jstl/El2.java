package study.el_jstl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/el_jstl/El2")
public class El2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		String[] hobbys = requset.getParameterValues("hobby");
		
		
		requset.setAttribute("hobbys", hobbys);
		if(hobbys != null) {
			RequestDispatcher dispatcher = requset.getRequestDispatcher("/study/1121_EL_JSTL/el2.jsp");
			dispatcher.forward(requset, response);
		}
	}
}
