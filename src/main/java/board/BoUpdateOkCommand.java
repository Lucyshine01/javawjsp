package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;import org.apache.jasper.compiler.TldCache;

public class BoUpdateOkCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		String sMid = (String) session.getAttribute("sMid");
		int sLevel = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		BoardVO vo = dao.getBoContentSearch(idx);
		if(sLevel != 0) {
			if(!sMid.equals(vo.getMid())) {
				request.setAttribute("msg", "userCheckNo");
				request.setAttribute("url", request.getContextPath()+"/");
				return;
			}
		}
		
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		vo = new BoardVO();
		vo.setIdx(idx);
		vo.setTitle(title);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		int res = dao.setBoUpdate(vo);
		if(res == 1) {
			request.setAttribute("msg", "boUpdateOk");
		}
		else {
			request.setAttribute("msg", "boUpdateNo");
		}
		request.setAttribute("url", request.getContextPath()+"/boContent.bo?idx="+idx+"&pageSize="+pageSize+"&pag="+pag);
	}

}
