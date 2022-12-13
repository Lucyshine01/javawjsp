package study.el_jstl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/el_jstl/el1")
public class El1 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest requset, HttpServletResponse response) throws ServletException, IOException {
		ElJstlVO vo = new ElJstlVO();
		vo.setAtom(requset.getParameter("atom"));
		vo.setName(requset.getParameter("name"));
		vo.setSu1(Integer.parseInt(requset.getParameter("su1")));
		vo.setSu2(Integer.parseInt(requset.getParameter("su2")));
		
		
		requset.setAttribute("vo", vo);
		if(!vo.getAtom().equals("")) {
			RequestDispatcher dispatcher = requset.getRequestDispatcher("/study/1121_EL_JSTL/el1.jsp");
			dispatcher.forward(requset, response);
		}
	}
}
