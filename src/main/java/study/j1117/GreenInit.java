package study.j1117;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 어노테이션으로 초기값 정해두기(ex 아이디,성명같은거 입력받아서 초기값으로 넣기)
@WebServlet(urlPatterns = "/Green", initParams = {@WebInitParam(name="mid", value = "admin"), @WebInitParam(name="pwd", value = "1234"),@WebInitParam(name="className", value = "총무과")})
public class GreenInit extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		// web.xml에 설정해둔 변수/값을 가져온다.
		String mid = getInitParameter("mid");
		String pwd = getInitParameter("pwd");
		String className = getInitParameter("className");
		
		System.out.println("아이디 : " + mid);
		System.out.println("비밀번호 : " + pwd);
		System.out.println("부서명 : " + className);
		
		request.setAttribute("mid", mid);
		request.setAttribute("pwd", pwd);
		request.setAttribute("className", className);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/study/1117/init/green.jsp");
		dispatcher.forward(request, response);
	}
}
