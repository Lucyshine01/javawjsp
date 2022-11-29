package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mem")
public class MemberController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;
		String viewPage = "/WEB-INF/member";
		
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(cmd.equals("/memLogin")) {
			viewPage += "/memLogin.jsp";
		}
		else if(cmd.equals("/memLoginOk")) {
			command = new MemLoginOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/memLogout")) {
			command = new MemLogoutCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/memMain")) {
			command = new MemMainCommand();
			command.execute(request, response);
			viewPage += "/memMain.jsp";
		}
		else if(cmd.equals("/memIdCheck")) {
			command = new MemIdCheckCommand();
			command.execute(request, response);
			viewPage += "/memIdCheck.jsp";
		}
		else if(cmd.equals("/memNickCheck")) {
			command = new MemNickCheckCommand();
			command.execute(request, response);
			viewPage += "/memNickCheck.jsp";
		}
		else if(cmd.equals("/memJoin")) {
			viewPage += "/memJoin.jsp";
		}
		else if(cmd.equals("/memJoinOk")) {
			command = new MemJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/memList")) {
			command = new MemListCommand();
			command.execute(request, response);
			viewPage += "/memList.jsp";
		}
		else if(cmd.equals("/memInfor")) {
			command = new MemInforCommand();
			command.execute(request, response);
			viewPage += "/memInfor.jsp";
		}
		else if(cmd.equals("/memUpdatePwd")) {
			viewPage += "/memUpdatePwd.jsp";
		}
		else if(cmd.equals("/memUpdatePwdOk")) {
			command = new MemUpdatePwdOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/memPwdCheck")) {
			viewPage += "/memPwdCheck.jsp";
		}
		else if(cmd.equals("/memPwdCheckOk")) {
			command = new MemPwdCheckOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/memUpdate")) {
			command = new MemUpdateCommand();
			command.execute(request, response);
			viewPage += "/memUpdate.jsp";
		}
		else if(cmd.equals("/memUpdateOk")) {
			command = new MemUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
