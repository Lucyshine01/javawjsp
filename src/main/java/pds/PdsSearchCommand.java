package pds;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDAO;

public class PdsSearchCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part =request.getParameter("part")==null ? "전체" : request.getParameter("part");
		
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		PdsDAO dao = new PdsDAO();
		
		request.setAttribute("part", part);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 10 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.totRecCnt_search(part,search,searchString);
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		int stratIndexNo = (pag-1) * pageSize;
		int curScrStartNo = totRecCnt - stratIndexNo;
		int blockSize = 3;
		int curBlock = (pag - 1) / blockSize;
		int lastBlock = (totPage-1) / blockSize;
		
		request.setAttribute("pag", pag);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		request.setAttribute("totPage", totPage);
		request.setAttribute("stratIndexNo", stratIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
		ArrayList<PdsVO> vos = dao.searchPds(part,search,searchString,stratIndexNo,pageSize);
		request.setAttribute("vos", vos);
		
	}

}
