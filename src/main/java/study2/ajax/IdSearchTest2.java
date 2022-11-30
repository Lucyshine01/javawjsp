package study2.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemberDAO;
import member.MemberVO;

@WebServlet("/idSearchTest2")
public class IdSearchTest2 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
//		HttpSession session = request.getSession();
//		int level = session.getAttribute("sLevel")==null ? 99 : (int)session.getAttribute("sLevel");
//		if (level >= 5) {
//			request.setAttribute("msg", "sessionOver");
//			request.setAttribute("url", request.getContextPath()+"/");
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/include/message.jsp");
//			dispatcher.forward(request, response);
//		}
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getLoginCheck(mid);
		
		String name = "";
		if(vo == null) {
			name = "찾는 자료가 없습니다.";
		}
		else {
			name = vo.getName();
		}
		
		PrintWriter out = response.getWriter();
		
		//헤더에 덮어씌어서 보냄
		response.getWriter().write(name);
		out.print(" - 회원번호 : " + vo.getIdx());
		
	}
}
