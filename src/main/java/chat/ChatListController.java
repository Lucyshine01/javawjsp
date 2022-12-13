package chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/chatList")
public class ChatListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String listType = request.getParameter("listType");
		
		if(listType == null || listType.equals("")) {
			response.getWriter().write("");
			return;
		}
		else if(listType.equals("ten")) {
			response.getWriter().write(getTen());
		}
		else {
			response.getWriter().write(getListIdx(listType));
		}
		
	}
	
	// 2번째 이후부터 메세지 내용을 출력처리
	private String getListIdx(String idx) {
		ChatDAO dao = new ChatDAO();
		ArrayList<ChatVO> vos = dao.getChatList(Integer.parseInt(idx)); // 마지막자료를 기준으로 처리...
		ChatVO vo = new ChatVO();
		System.out.println(vos);
		
		StringBuffer res = new StringBuffer();
		res.append("{\"res\":[");
		for(int i=0; i<vos.size(); i++) {
			vo = vos.get(i);
			res.append("[{\"value\":\""+vo.getIdx()+"\"},");
			res.append("{\"value\":\""+vo.getNickName()+"\"},");
			res.append("{\"value\":\""+vo.getContent()+"\"},");
			res.append("{\"value\":\""+vo.getcDate()+"\"},");
			res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
			if(i != (vos.size()-1)) res.append(",");
		}
		res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		return res.toString();
	}

	// 최초 접속시 최근메세지 10개의 자료만 보여주기위한 처리
	private String getTen() {
		ChatDAO dao = new ChatDAO();
		ArrayList<ChatVO> vos = dao.getChatList(10); // 최초 10개의 메세지 가져오기
		ChatVO vo = new ChatVO();
		System.out.println(vos);
		
		StringBuffer res = new StringBuffer();
		res.append("{\"res\":[");
		for(int i=0; i<vos.size(); i++) {
			vo = vos.get(i);
			res.append("[{\"value\":\""+vo.getIdx()+"\"},");
			res.append("{\"value\":\""+vo.getNickName()+"\"},");
			res.append("{\"value\":\""+vo.getContent()+"\"},");
			res.append("{\"value\":\""+vo.getcDate()+"\"},");
			res.append("{\"value\":\""+vo.getAvatar()+"\"}]");
			if(i != (vos.size()-1)) res.append(",");
		}
		res.append("],\"last\":\""+vos.get(vos.size()-1).getIdx()+"\"}");
		return res.toString();
	}
}
