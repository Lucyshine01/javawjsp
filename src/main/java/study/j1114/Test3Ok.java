package study.j1114;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/j1114_test3Ok")
public class Test3Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String[] products = request.getParameterValues("product");
		
		String strProduct = "";
//		for(String product : products) {
//			if(product.trim() != "") {
//				strProduct += product.trim() + " / ";
//			}
//		}
		
		int sw = 0;
		
		for(int i=0; i<products.length; i++) {
			if(products[i].trim() != "") {
				strProduct += products[i].trim() + " / ";
				sw = 1;
			}
		}
		
		PrintWriter out = response.getWriter();
		
		if(!strProduct.equals("")) {
			strProduct = strProduct.substring(0,strProduct.length()-3);
		}
		else {
			out.println("<script>");
			out.println("alert('등록된 상품이 없습니다!');");
			out.println("history.back();");
			out.println("</script>");
		}
//		else {
//			strProduct = "등록한 상품이 없습니다!";
//		}
		
		
		out.println("<script>");
		out.println("alert('상품 등록 완료!');");
		out.println("</script>");
		out.println("<p>등록하신 상품은?</p>");
		out.println("<p>"+strProduct+"</p>");
		out.println("<a href='"+request.getContextPath()+"/study/1114/test3.jsp'>돌아가기</a>");
	}
}
