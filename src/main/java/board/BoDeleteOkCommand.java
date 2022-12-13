package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoDeleteOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		int sLevel = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		if(sLevel != 0) {
			if(!sMid.equals(mid)) {
				request.setAttribute("msg", "userCheckNo");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		BoardDAO dao = new BoardDAO();
		
		int res = dao.setBoDeleteOK(idx);
		if(res == 1) {
			request.setAttribute("msg", "boDeleteOk");
			request.setAttribute("url", request.getContextPath()+"/boList.bo?pageSize="+pageSize+"&pag="+pag);
		}
		else {
			request.setAttribute("msg", "boDeleteNo");
			request.setAttribute("url", request.getContextPath()+"/boContent.bo?pageSize="+pageSize+"&pag="+pag);
		}
		
	}

}
