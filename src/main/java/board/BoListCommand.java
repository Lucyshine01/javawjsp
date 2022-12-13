package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoListCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardDAO dao = new BoardDAO();
		
		// 1.페이징처리 준비
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		if(20 < pageSize) pageSize = 20;
		else if(15 < pageSize && pageSize < 20) pageSize = 15;
		else if(10 < pageSize && pageSize < 15) pageSize = 10;
		else if(5 < pageSize && pageSize < 10) pageSize = 5;
		else if(pageSize < 5) pageSize = 5;
		int totRecCnt = dao.totRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		int stratIndexNo = (pag-1) * pageSize;
		int curScrStartNo = totRecCnt - stratIndexNo;
		
		// 블록페이징처리.....(3단계) -> 블록의 시작번호를 0번부터 처리했다.
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage-1) / blockSize;
		
		ArrayList<BoardVO> vos = dao.getBoList(stratIndexNo, pageSize);
		
		request.setAttribute("vos", vos);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("stratIndexNo", stratIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
		
	}
}
