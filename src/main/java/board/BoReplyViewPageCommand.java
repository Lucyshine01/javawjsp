package board;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class BoReplyViewPageCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		int boardIdx = request.getParameter("boardIdx")==null ? 0 : Integer.parseInt(request.getParameter("boardIdx"));
		ArrayList<BoardReplyVO> replyVos = dao.getBoReply(boardIdx);
		
		// 모든 map(vo)를 담아줄 JSONArray 객체 생성
		JSONArray replyArray = new JSONArray();
		for (int i=0; i<replyVos.size(); i++) {
			BoardReplyVO vo = replyVos.get(i);
			HashMap<String, String> map = new HashMap<>();
			map.put("idx", vo.getIdx()+"");
			map.put("boardIdx", vo.getBoardIdx()+"");
			map.put("mid", vo.getMid());
			map.put("nickName", vo.getNickName());
			map.put("wDate", vo.getwDate());
			map.put("hostIp", vo.getHostIp());
			map.put("content", vo.getContent());
			// map(vo)한개에 담아줄 JSON오브젝트 한개 생성
			JSONObject replyInfo = new JSONObject(map);
			//System.out.println("replyInfo : "+replyInfo);
			replyArray.add(replyInfo);
			//System.out.println("replyArray : "+replyArray);
		}
		// ajax에서 사용할 변수명을 정하기위해 JSON오브젝트를 새로 생성해 JSONArray 객체에 변수명을 정해 담아준다
		JSONObject replyTotal = new JSONObject();
		replyTotal.put("reply", replyArray);
		//System.out.println("replyTotal : "+replyTotal);
		//System.out.println("replyTotal.toJSONString : "+replyTotal.toJSONString());
		
		// .toJSONStirng으로 JSON객체를 문자열화해서 올려준다
		String str = replyTotal.toJSONString();
		response.getWriter().write(str);
		
	}

}
