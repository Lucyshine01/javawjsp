package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemSearchCommand implements MemberInterface {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String temp = request.getParameter("temp")==null ? "" : request.getParameter("temp");
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		int level = (int)session.getAttribute("sLevel");
		ArrayList<MemberVO> vos;
		if(!mid.equals("")) {
			vos = dao.getMemberSearch(mid,level);
		}
		else {
			vos = dao.getMemberSearch2(temp,level);
		}
		request.setAttribute("vos", vos);
	}
}
