package board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoSearchCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")==null ? "" : request.getParameter("search");
		String searchString = request.getParameter("searchString")==null ? "" : request.getParameter("searchString");
		BoardDAO dao = new BoardDAO();
		System.out.println(search);
		System.out.println(searchString);
		
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		if(20 < pageSize) pageSize = 20;
		else if(15 < pageSize && pageSize < 20) pageSize = 15;
		else if(10 < pageSize && pageSize < 15) pageSize = 10;
		else if(5 < pageSize && pageSize < 10) pageSize = 5;
		else if(pageSize < 5) pageSize = 5;
		int totRecCnt = dao.totRecCnt_search(search,searchString);;
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		int stratIndexNo = (pag-1) * pageSize;
		int curScrStartNo = totRecCnt - stratIndexNo;
		
		System.out.println("next");
		
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
		
		ArrayList<BoardVO> vos = dao.getBoContentSearch(search,searchString,stratIndexNo,pageSize);
		
		String searchTitle = "";
		if(search.equals("title")) searchTitle = "??????";
		else if(search.equals("nickName")) searchTitle = "?????????";
		else if(search.equals("content")) searchTitle = "??????";
		else searchTitle = "??????,??????";
		
		request.setAttribute("searchCount", totRecCnt);
		request.setAttribute("vos", vos);
		request.setAttribute("searchTitle", searchTitle);
		request.setAttribute("search", search);
		request.setAttribute("searchString", searchString);
		
		
		/*
		// 1.??????????????? ??????
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		int pageSize = request.getParameter("pageSize")==null? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecCnt = dao.totRecCnt();
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		int stratIndexNo = (pag-1) * pageSize;
		int curScrStartNo = totRecCnt - stratIndexNo;
			
		// ?????????????????????.....(3??????) -> ????????? ??????????????? 0????????? ????????????.
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
		*/
		
	}
}
