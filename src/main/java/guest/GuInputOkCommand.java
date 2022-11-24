package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuInputOkCommand implements GuestInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestVO vo = new GuestVO();
		GuestDAO dao = new GuestDAO();
		
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		// 성명에는 태그사용금지 처리
		name = name.replace("<", "&lt").replace(">", "&gt");
		email = email.replace("<", "&lt").replace(">", "&gt");
		homePage = homePage.replace("<", "&lt").replace(">", "&gt");
		//content = content.replace("<", "&lt").replace(">", "&gt");
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		int res = dao.setGuInput(vo);
		
		if(res == 1) {
			request.setAttribute("msg", "guInputOk");
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		else {
			request.setAttribute("msg", "guInputNo");
			request.setAttribute("url", request.getContextPath()+"/guInput.gu");
		}
		
	}

}
