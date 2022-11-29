package member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemListCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		HttpSession session = request.getSession();
		int level = (int)session.getAttribute("sLevel");
		ArrayList<MemberVO> vos = dao.getMemList(level);
		request.setAttribute("vos", vos);
		
		// 1.페이지(pag)를 결정한다.
		int pag = request.getParameter("pag")==null ? 1 : Integer.parseInt(request.getParameter("pag"));
		
		// 2. 한 페이지의 분량을 결정한다.
		int pageSize = 5;
		
		// 3. 총 레코드 건수를 구한다.
		int totRecCnt = vos.size();
		
		// 4. 총 페이지 건수를 구한다.
		int totPage = (totRecCnt % pageSize)==0 ? totRecCnt / pageSize : (totRecCnt / pageSize)+1;
		
		// 5. 현재페이지의 시작 인덱스번호를 구한다.
		int stratIndexNo = (pag-1) * pageSize;
		
		// 6. 현재 화면에 보여주는 시작번호를 구한다.
		int curScrStartNo = totRecCnt - stratIndexNo;
		
		request.setAttribute("pag", pag);
		request.setAttribute("totPage", totPage);
		request.setAttribute("stratIndexNo", stratIndexNo);
		request.setAttribute("curScrStartNo", curScrStartNo);
		
	}
}
