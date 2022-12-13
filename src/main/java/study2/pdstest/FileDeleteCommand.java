package study2.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fName = request.getParameter("file");
		
		String realPath = request.getServletContext().getRealPath("data/pdstest/");
		
		//껍데기 객체를 생성해서 그 즉시 이 껍데기를 삭제할시 원래 파일이 지워짐
		//하지만 해당경로에 파일이 있어야 에러없이 지워짐(없을시 에러발생)
		File file = new File(realPath+fName);
		
		String res = "0";
		
		if(file.exists()) {
			file.delete();
			res = "1";
		}
		
		response.getWriter().write(res);
		return;
	}
}
