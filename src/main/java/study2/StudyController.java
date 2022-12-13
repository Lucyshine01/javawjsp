package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.Calendar.Calendar1Command;
import study2.Calendar.Calendar2Command;
import study2.password.PassOk2Command;
import study2.password.PassOkCommand;
import study2.pdstest.DownLoadCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.JavaDownCommand;
import study2.pdstest.UpLoad1OkCommand;
import study2.pdstest.UpLoad2OkCommand;
import study2.pdstest.UserDelCommand;
import study2.pdstest.UserListCommand;
import study2.pdstest.UserSearchCommand;

@WebServlet("*.st")
public class StudyController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "/WEB-INF/study2";
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
		
		if(cmd.equals("/pass")) {
			viewPage += "/password/pass.jsp";
		}
		else if(cmd.equals("/passOk1")) {
			command = new PassOkCommand();
			command.execute(request, response);
			viewPage += "/password/pass.jsp";
		}
		else if(cmd.equals("/passOk2")) {
			command = new PassOk2Command();
			command.execute(request, response);
			viewPage += "/password/passOk2.jsp";
		}
		else if(cmd.equals("/ajax1")) {
			viewPage += "/ajax/ajax1.jsp";
		}
		else if(cmd.equals("/ajax6")) {
			viewPage += "/ajax/ajax6.jsp";
		}
		else if(cmd.equals("/userList")) {
			command = new UserListCommand();
			command.execute(request, response);
			viewPage += "/ajax/userList.jsp";
		}
		else if(cmd.equals("/userSearch")) {
			command = new UserSearchCommand();
			command.execute(request, response);
			return;
			//viewPage += "/ajax/userList.jsp";
		}
		else if(cmd.equals("/userDel")) {
			command = new UserDelCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/upLoad1")) {
			viewPage += "/pdstest/upLoad1.jsp";
		}
		else if(cmd.equals("/upLoad1Ok")) {
			command = new UpLoad1OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/upLoad2")) {
			viewPage += "/pdstest/upLoad2.jsp";
		}
		else if(cmd.equals("/upLoad3")) {
			viewPage += "/pdstest/upLoad3.jsp";
		}
		else if(cmd.equals("/upLoad2Ok")) {
			command = new UpLoad2OkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/upLoad4")) {
			viewPage += "/pdstest/upLoad4.jsp";
		}
		else if(cmd.equals("/downLoad")) {
			command = new DownLoadCommand();
			command.execute(request, response);
			viewPage += "/pdstest/downLoad.jsp";
		}
		else if(cmd.equals("/fileDelete")) {
			command = new FileDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/javaDown")) {
			command = new JavaDownCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/calendar1")) {
			command = new Calendar1Command();
			command.execute(request, response);
			viewPage += "/calendar/calendar1.jsp";
		}
		else if(cmd.equals("/calendar2")) {
			command = new Calendar2Command();
			command.execute(request, response);
			viewPage += "/calendar/calendar2.jsp";
		}
		else if(cmd.equals("/stApi")) {
			viewPage += "/api/stApi.jsp";
		}
		else if(cmd.equals("/crimeApi")) {
			viewPage += "/api/crimeApi.jsp";
		}
		else if(cmd.equals("/stCrimeSave")) {
			command = new StCrimeSaveCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/stCrimeDelete")) {
			command = new StCrimeDeleteCommand();
			command.execute(request, response);
			return;
		}
		else if(cmd.equals("/stCrimeList")) {
			command = new StCrimeListCommand();
			command.execute(request, response);
			viewPage += "/api/crimeApi.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
