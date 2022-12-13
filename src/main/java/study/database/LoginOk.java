package study.database;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/database/LoginOk")
public class LoginOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		HttpSession session = request.getSession();
		ServletContext apContext = request.getServletContext();
		PrintWriter out = response.getWriter();
		JusorokDAO dao = new JusorokDAO();
		JusorokVO vo = dao.loginCheck(mid,pwd);
		
		if(vo.getName() != null) {
			// 회원 인증 후 처리
			// (1:자주사용하는 자룔르 세션에 담는다.)
			// (2:방문포인트를 10점씩 부가한다.(단, 1일 방문포인트를 50점까지만 허용함))
			// (3:최종방문날짜를 현재 날짜시간으로 변경한다.)
			
			//1. 세션처리
			session.setAttribute("sMid", vo.getMid());
			session.setAttribute("sName", vo.getName());
			session.setAttribute("sLastDate", vo.getLastDate().substring(0, 19));
			
			// 2.최종 방문날짜 갱신
			dao.setVisitUpdate(vo.getMid());
			
			// 3.방문포인트 증가하기(10점씩, 1일 50점까지...)
			dao.setPointUpdate(vo.getMid(), vo.getLastDate());
			
			out.println("<script>");
			out.println("alert('"+vo.getName()+"님 로그인 되었습니다.');");
			out.println("location.href='"+request.getContextPath()+"/database/MemberMain'");
			out.println("</script>");
			
//			response.sendRedirect(request.getContextPath()+"/database/MemberMain");
		}
		else {
			// 회원 인증 실패시 처리
			out.println("<script>");
			out.println("alert('로그인 실패!');");
			out.println("location.href='"+request.getContextPath()+"/study/1120_Database/login.jsp'");
			out.println("</script>");			
		}
	}
}
