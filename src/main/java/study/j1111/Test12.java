package study.j1111;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test12 extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		if(hobbys == null) {
			System.out.println("취미 없음");
		}
		else {
			System.out.print("취미 : ");
			for(String hobby : hobbys) {
				System.out.print(hobby + " / ");
//				System.err.print(hobby + " / "); //err()빨간글씨
			}
		}
		
		// 웹에 내용을 출력화기위해서는 PrintWriter객체를 통해서 처리한다.
		//PrintWriter 변수명 = response.getWriter();
		PrintWriter out = response.getWriter();
		out.println("<br/>성명 : " + name);
		out.println("<br/>나이 : " + age);
		out.println("<br/>성별 : " + gender);
		if(hobbys == null) {
//			out.println("<br/>취미 없음");
			out.println("<script>");
			out.println("alert('취미를 반드시 선택하셔야합니다!');");
			out.println("history.back();"); // 브라우저 뒤로가기 명령
//			out.println("location.href='"+request.getContextPath()+"/jt12';"); // 브라우저를 새로 불러오기
			out.println("</script>");
		}
		else {
			out.print("<br/>취미 : ");
			for(String hobby : hobbys) {
				out.print(hobby + " / "); 
			}
		}
		request.setAttribute("name", name);
//		out.println("<p><a href='/javawjsp/jt12'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/jt12'>돌아가기</a></p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/1111/NewFile.jsp?name="+name+"'>다음</a></p>");
	}
}
