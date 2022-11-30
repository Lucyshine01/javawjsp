package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdMemDelCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pag = Integer.parseInt(request.getParameter("pag"));
		AdminDAO dao = new AdminDAO();
		
		dao.setDelMember(idx);
		
		request.setAttribute("msg", "delMemberOk");
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad?pag="+pag);
	}

}
