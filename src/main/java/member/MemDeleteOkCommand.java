package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemDeleteOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd");
		
		MemberDAO dao = new MemberDAO();
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		MemberVO vo = dao.getLoginCheck(mid);
		if(!pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "memberDelNo");
			request.setAttribute("url", request.getContextPath()+"/");
			return;
		}
		else {
			dao.setMemberDel(mid);
			request.setAttribute("msg", "memberDelOk");
			request.setAttribute("url", request.getContextPath()+"/memLogout.mem");
		}
	}
}
