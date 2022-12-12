package study2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.api.CrimeDAO;
import study2.api.CrimeVO;

public class StCrimeSaveCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String police = request.getParameter("police")==null ? "" : request.getParameter("police");
		int year = (request.getParameter("year")==null || request.getParameter("year").equals("")) ? 0 : Integer.parseInt(request.getParameter("year"));
		int burglar = (request.getParameter("burglar")==null || request.getParameter("burglar").equals("")) ? 0 : Integer.parseInt(request.getParameter("burglar"));
		int murder = (request.getParameter("murder")==null || request.getParameter("murder").equals("")) ? 0 : Integer.parseInt(request.getParameter("murder"));
		int theft = (request.getParameter("theft")==null || request.getParameter("theft").equals("")) ? 0 : Integer.parseInt(request.getParameter("theft"));
		int violence = (request.getParameter("violence")==null || request.getParameter("violence").equals("")) ? 0 : Integer.parseInt(request.getParameter("violence"));
		
		CrimeVO vo = new CrimeVO();
		
		vo.setYear(year);
		vo.setPolice(police);
		vo.setBurglar(burglar);
		vo.setMurder(murder);
		vo.setTheft(theft);
		vo.setViolence(violence);
		
		CrimeDAO dao = new CrimeDAO();
		
		dao.setCrimeInputOk(vo);
		
	}

}
