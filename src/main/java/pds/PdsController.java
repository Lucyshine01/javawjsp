package pds;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemLogoutCommand;

@WebServlet("*.pds")
public class PdsController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PdsInterface command = null;
		String viewPage = "/WEB-INF/pds";
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
		
		// 세견이 끊겼다면 작업의 진행을 중지시키고 홈으로 전송시켜준다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
		if (level >= 5) {
			request.setAttribute("msg", "sessionOver");
			request.setAttribute("url", request.getContextPath()+"/");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/include/message.jsp");
			dispatcher.forward(request, response);
		}
		
		if(cmd.equals("/pdsList")) {
			command = new PdsListCommand();
			command.execute(request, response);
			viewPage += "/pdsList.jsp";
		}
		else if(cmd.equals("/pdsInput")) {
			command = new PdsInputCommand();
			command.execute(request, response);
			viewPage += "/pdsInput.jsp";
		}
		else if(cmd.equals("/pdsInputOk")) {
			command = new PdsInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/pdsDelete")) {
			command = new PdsDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/pdsContent")) {
			command = new PdsContentCommand();
			command.execute(request, response);
			viewPage += "/pdsContent.jsp";
		}
		else if(cmd.equals("/pdsDownNum")) {
			command = new PdsDownNumCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/pdsPwdCheck")) {
			command = new PdsPwdCheckCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/pdsTotalDown")) {
			command = new PdsTotalDownCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/pdsSearch")) {
			command = new PdsSearchCommand();
			command.execute(request, response);
			viewPage += "/pdsList.jsp";
		}
		else if(cmd.equals("/test")) {
			command = new TestCommand();
			command.execute(request, response);
			return;
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
