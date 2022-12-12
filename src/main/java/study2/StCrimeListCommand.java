package study2;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.api.CrimeDAO;
import study2.api.CrimeVO;

public class StCrimeListCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CrimeDAO dao = new CrimeDAO();
		ArrayList<CrimeVO> vos = dao.getCrimeList();
		
		request.setAttribute("vos", vos);
		request.setAttribute("crimeCount", vos.size());
		
	}

}
