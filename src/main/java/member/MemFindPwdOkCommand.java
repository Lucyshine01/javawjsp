package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemFindPwdOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		int res = dao.getMemberPwd(mid,email);
		if(res == 0) {
			response.getWriter().write("0");
			return;
		}
		else {
			String pwd = "";
			int ascii;
			for(int i=0; i<10; i++) {
				ascii = (int)(Math.random() * 26 + 97);
				pwd += (char)ascii;
			}
			response.getWriter().write(pwd);
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			dao.setMemUpdatePwdOk(mid, pwd);
			return;
		}
	}
}
