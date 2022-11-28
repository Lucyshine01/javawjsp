package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 과제 : 메인 메뉴에 있는 위에 4개 + 방명록에 올린 글수 아이디,닉네임으로 몇개인지 확인
		
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO memDao = new MemberDAO();
		
		MemberVO vo = memDao.getLoginCheck(mid);
		
		// 레벨을 문자로 처리해서 넘겨준다.
		String strLevel = "";
		if(vo.getLevel() == 0) strLevel = "관리자";
		else if(vo.getLevel() == 1) strLevel = "준회원";
		else if(vo.getLevel() == 2) strLevel = "정회원";
		else if(vo.getLevel() == 3) strLevel = "우수회원";
		else if(vo.getLevel() == 4) strLevel = "운영자";
		
		request.setAttribute("point", vo.getPoint());
		request.setAttribute("lastDate", vo.getLastDate().substring(0,10));
		request.setAttribute("visitCnt", vo.getVisitCnt());
		request.setAttribute("todayCnt", vo.getTodayCnt());
		request.setAttribute("strLevel", strLevel);
		
		// 사용자가 방명록에서 글쓴 횟수 가져오기.....
		
		
	}

}
