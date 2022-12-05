package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
//		dao.setReadNumPlus(idx);
		HttpSession session = request.getSession();
		if(session.getAttribute("sRead") == null) {
			session.setAttribute("sRead", "board"+idx+"/");
			dao.setReadNumPlus(idx);
		}
		else {
			String sRe = (String)session.getAttribute("sRead");
			if(sRe.length() > 1000) session.setAttribute("sRead","");
			if(sRe.contains("board"+idx)) {}
			else {
				sRe = sRe + "board" + idx + "/";
				session.setAttribute("sRead",sRe);
				dao.setReadNumPlus(idx);
			}
		}
		
		BoardVO vo = dao.getBoContentSearch(idx);
		
		// 선생님 방법
//		// 해당글에 좋아요 버튼을 클릭하였었다면 '좋아요세션'에 아이디를 저장시켜두었기에 찾아서 있다면 sSw값을 1로 보내어 하트색을 빨강색으로 변경유지하게한다.
//		ArrayList<String> goodIdx = (ArrayList) session.getAttribute("sGoodIdx");
//		if(goodIdx == null) {
//			goodIdx = new ArrayList<String>();
//		}
//		String imsiGoodIdx = "boardGood" + idx;
//		if(goodIdx.contains(imsiGoodIdx)) {
//			session.setAttribute("sSw", "1");		// 로그인 사용자가 이미 좋아요를 클릭한 게시글이라면 빨강색으로 표시가히위해 sSW에 1을 전송하고 있다.
//		}
//		else {
//			session.setAttribute("sSw", "0");
//		}
		
		
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
