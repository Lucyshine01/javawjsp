package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoGoodCommand implements BoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		BoardDAO dao = new BoardDAO();
		HttpSession session = request.getSession();
		if(session.getAttribute("sBo")==null) {
			session.setAttribute("sBo", String.valueOf(idx)+"/");
			dao.setBoGood(idx, 0);
		}
		else {
			String sBo = (String) session.getAttribute("sBo");
			String[] BoIdx = sBo.split("/");
			int res=0;
			for(int i=0; i<BoIdx.length; i++)
				if(BoIdx[i].equals(String.valueOf(idx))) res=1;
			if(res == 0) {
				sBo = sBo + idx + "/";
				session.setAttribute("sBo",sBo);
				dao.setBoGood(idx, res);
			}
			else {
				sBo = sBo.replace(idx+"/", "");
				session.setAttribute("sBo",sBo);
				dao.setBoGood(idx, res);
			}
		}
		
//		dao.setBoGood(idx);
		return;
	}

}
