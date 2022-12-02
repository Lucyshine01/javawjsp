package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoContentCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pag", pag);
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		
		BoardDAO dao = new BoardDAO();
		
		// 조회수 증가하기
		dao.setReadNumPlus(idx);
		BoardVO vo = dao.getBoContentSearch(idx);
		
		
		
		
		// 이전글과 다음글 처리
		BoardVO preVo = dao.getPreNextSearch("pre", idx);
		BoardVO nextVo = dao.getPreNextSearch("next", idx);
		
		request.setAttribute("vo", vo);
		request.setAttribute("preVo", preVo);
		request.setAttribute("nextVo", nextVo);

		
		// search로 뒤로가기
		String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		request.setAttribute("flag", flag);
		
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		// 댓글 가져오기
		ArrayList<BoardReplyVO> replyVos = dao.getBoReply(idx);
		request.setAttribute("replyVos", replyVos);
		
	}

}
