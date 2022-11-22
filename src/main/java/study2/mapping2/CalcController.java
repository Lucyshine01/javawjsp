package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.calc")
public class CalcController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MappingInterface command = null;
		
		
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/study2/mapping2/";
		
		if(cmd.equals("/Calc")) {
			viewPage += "calc.jsp";
		}
		else if(cmd.equals("/CalcOk")) {
			command = new CalcOkCommand();
			command.excute(request, response);
			viewPage += "calcOk.jsp";
		}
		else if(cmd.equals("/JuList")) {
			command = new JuListCommand();
			command.excute(request, response);
			viewPage += "juList.jsp";
		}
		else {
			viewPage += "errorPage.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
		
	}
}
