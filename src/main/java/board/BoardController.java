package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemLogoutCommand;

@WebServlet("*.bo")
public class BoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardInterface command = null;
		String viewPage = "/WEB-INF/board";
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
		
		if(cmd.equals("/boList")) {
			command = new BoListCommand();
			command.execute(request, response);
			viewPage += "/boList.jsp";
		}
		else if(cmd.equals("/boInput")) {
			command = new BoInputCommand();
			command.execute(request, response);
			viewPage += "/boInput.jsp";
		}
		else if(cmd.equals("/boInputOk")) {
			command = new BoInputOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/boContent")) {
			command = new BoContentCommand();
			command.execute(request, response);
			viewPage += "/boContent.jsp";
		}
		else if(cmd.equals("/boGood")) {
			command = new BoGoodCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/boDeleteOk")) {
			command = new BoDeleteOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/boUpdate")) {
			command = new BoUpdateCommand();
			command.execute(request, response);
			viewPage += "/boUpdate.jsp";
		}
		else if(cmd.equals("/boUpdateOk")) {
			command = new BoUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/boSearch")) {
			command = new BoSearchCommand();
			command.execute(request, response);
			viewPage += "/boList.jsp";
		}
		else if(cmd.equals("/boReplyInput")) {
			command = new BoReplyInputCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/boReplyDeleteOk")) {
			command = new BoReplyDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/boReplyViewPage")) {
			command = new BoReplyViewPageCommand();
			command.execute(request, response);
			return;
		}
		
//		else if(cmd.equals("/memLogout")) {
//			command = new MemLogoutCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
