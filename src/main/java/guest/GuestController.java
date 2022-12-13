package guest;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.gu")
public class GuestController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestInterface command = null;
		String viewPage = "/WEB-INF/guest";
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(cmd.equals("/guList")) {
			command = new GuListCommand();
			command.excute(request, response);
			viewPage += "/guList.jsp";
		}
		else if(cmd.equals("/guInput")) {
			viewPage += "/guInput.jsp";
		}
		else if(cmd.equals("/guInputOk")){
			command = new GuInputOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/adminLogin")) {
			viewPage += "/adminLogin.jsp";
		}
		else if(cmd.equals("/admingLoginOk")){
			command = new AdmingLoginOkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/adminLogout")){
			command = new AdmingLogoutCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/guDelete")){
			command = new GuDeleteCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
