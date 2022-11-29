package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemPwdCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		MemberVO vo = dao.getLoginCheck(mid);
		
		
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		if(!pwd.equals(vo.getPwd())) {
			request.setAttribute("msg", "passwordNo");
			request.setAttribute("url", request.getContextPath()+"/memPwdCheck.mem");
			return;
		}
		else {
			request.setAttribute("msg", "passwordYes");
			request.setAttribute("url", request.getContextPath()+"/memUpdate.mem");
		}
		

	}

}
