package member;

import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemFindMidOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		String mid = dao.getMemberMid(email);
		
		if(mid.equals("")) {
			response.getWriter().write("0");
			return;
		}
		
		int midLength = mid.length();
		char[] midChar = mid.toCharArray();
		mid = "";
		for(int i=0; i<midLength; i++) {
			if(2 < i && i <= 5) midChar[i] = '*';
			if(8 < i && i <= 11) midChar[i] = '*';
			mid += midChar[i];
		}
		
		response.getWriter().write(mid);
		return;
	}

}
