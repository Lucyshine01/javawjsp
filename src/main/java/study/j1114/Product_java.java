package study.j1114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/product_java")
public class Product_java extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String[] type = request.getParameterValues("type");
		String[] p_name = request.getParameterValues("p_name");
		String[] p_price = request.getParameterValues("p_price");
		String[] p_count = request.getParameterValues("p_count");
		
		int total_price = 0;
		
		out.println("<!DOCTYPE html><html><head><meta charset=\"UTF-8\"><title>product.jsp</title>");
		out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css\">");
		out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js\"></script></head>");
		out.println("<body class=\"container\" style=\"margin-top: 100px;\"><table class=\"table\" style=\"text-align: center;\">");
		out.println("<tr><th>분류</th><th>상품명</th><th>가격</th><th>수량</th></tr>");
		
		for(int i=0; i<type.length; i++) {
			out.println("<tr><td>"+type[i]+"</td><td>"+p_name[i]+"</td><td>"+p_price[i]+"원</td><td>"+p_count[i]+"개</td></tr>");
			total_price += Integer.parseInt(p_price[i]) * Integer.parseInt(p_count[i]);
		}
		out.println("<tr><td></td><td></td><td></td><th>총가격 : "+total_price+"원</th></tr>");
		out.println("</table></body></html>");
	}
}
