package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;
import study2.ajax.UserDAO;
import study2.ajax.UserVO;

public class UserUpdateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldMid = request.getParameter("oldMid")==null ? "" : request.getParameter("oldMid");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		int age = request.getParameter("age")==null ? 0 : Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		UserDAO dao = new UserDAO();
		
		UserVO vo = dao.getUserSearch(oldMid);
		if(vo.getMid() == null) {
			response.getWriter().write("0");
			return;
		}
		
		vo = dao.getUserSearch(mid);
		if(vo.getMid() != null && !mid.equals(oldMid)) response.getWriter().write("2");
		else {
			int res = dao.setUserUpdate(mid,name,age,address,oldMid);
			if(res != 1) {
				response.getWriter().write("3");
				return;
			}
			response.getWriter().write("1");
			return;
		}
	}
}
