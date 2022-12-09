package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemLogoutCommand;
import pds.PdsListCommand;

@WebServlet("*.sc")
public class SchduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SchduleInterface command = null;
		String viewPage = "/WEB-INF/schedule";
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
		
		if(cmd.equals("/schedule")) {
			command = new SchduleCommand();
			command.execute(request, response);
			viewPage += "/schedule.jsp";
		}
		else if(cmd.equals("/scMenu")) {
			command = new ScMenuCommand();
			command.execute(request, response);
			viewPage += "/scMenu.jsp";
		}
		else if(cmd.equals("/scheduleInputOk")) {
			command = new ScheduleInputOkCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/scUpdateOk")) {
			command = new ScUpdateOkCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/scheduleDeleteOk")) {
			command = new ScheduleDeleteOkCommand();
			command.execute(request, response);
			return;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
