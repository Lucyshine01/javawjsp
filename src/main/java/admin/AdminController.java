package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemInforCommand;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "/WEB-INF/admin";
		
		String uri = request.getRequestURI();
		String cmd = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		
		if(cmd.equals("/adMain")) {
			viewPage += "/adMain.jsp";
		}
		else if(cmd.equals("/adLeft")) {
			viewPage += "/adLeft.jsp";
		}
		else if(cmd.equals("/adContent")) {
			command = new AdContentCommand();
			command.execute(request, response);
			viewPage += "/adContent.jsp";
		}
		else if(cmd.equals("/adMemList")) {
			command = new AdMemListCommand();
			command.execute(request, response);
			viewPage += "/member/adMemList.jsp";
		}
		else if(cmd.equals("/adMemInfor")) {
			command = new MemInforCommand();
			command.execute(request, response);
			viewPage += "/member/adMemInfor.jsp";
		}
		else if(cmd.equals("/adMemberSearch")) {
			command = new AdMemberSearchCommand();
			command.execute(request, response);
			viewPage += "/member/adMemList.jsp";
		}
		else if(cmd.equals("/adMemberLevel")) {
			command = new AdMemberLevelCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(cmd.equals("/adMemDel")) {
			command = new AdMemDelCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
//		else if(cmd.equals("/memUpdateOk")) {
//			command = new MemUpdateOkCommand();
//			command.execute(request, response);
//			viewPage = "/include/message.jsp";
//		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
