package chat;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/chatInput")
public class ChatInputController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 프론트에서 인코딩해서 보내줄 경우 디코딩을한다.
		String nickName = URLDecoder.decode(request.getParameter("nickName"), "UTF-8");
		String content = URLDecoder.decode(request.getParameter("content"), "UTF-8");
		String avatar = request.getParameter("avatar");
		
		if(nickName == null || nickName.equals("") || content == null || content.equals("")) {
			response.getWriter().write("");
		}
		else {
			response.getWriter().write(new ChatDAO().setChatInput(nickName,content,avatar));
		}
		
	}
}
