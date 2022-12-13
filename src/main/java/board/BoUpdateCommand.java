package board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoUpdateCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String sMid = session.getAttribute("sMid")==null ? "" : (String) session.getAttribute("sMid");
		int sLevel = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
				
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.getBoContentSearch(idx);
		if(sLevel != 0) {
			if(!sMid.equals(vo.getMid())) {
				request.setAttribute("msg", "userCheckNo");
				request.setAttribute("url", request.getContextPath()+"/");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/include/message.jsp");
				dispatcher.forward(request, response);
			}
		}
		
		request.setAttribute("vo", vo);
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
	}

}
