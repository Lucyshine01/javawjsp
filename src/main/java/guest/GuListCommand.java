package guest;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuListCommand implements GuestInterface {
	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GuestDAO dao = new GuestDAO();
		ArrayList<GuestVO> vos = dao.getGuestList();
		request.setAttribute("vos", vos);
	}
}
