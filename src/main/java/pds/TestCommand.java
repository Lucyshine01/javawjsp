package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TestCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realpath = request.getServletContext().getRealPath("/data/pds/temp/");
		String name = "qwer.png";
		String cName = "rename.png";
		File file = new File(realpath + name);
		File fileRename = new File(realpath + cName);
		
		//file.renameTo(fileRename);
		
		FileInputStream fis = new FileInputStream(file);
		FileOutputStream fos = new FileOutputStream(fileRename);
		
		byte[] b = new byte[2048];
		int data = 0;
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			fos.write(b, 0, data);
		}
		fos.flush();
		fis.close();
		fos.close();
		
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream"); // 2진 바이너리형식
		}
		
		String downLoadName = "";
		// 헤더에 있는 브라우저 정보를 받아오기, MSIE : 마이크로소프트 IE
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			// 8859_1 : 윈도우의 한글코드 변환방식
			downLoadName = new String(cName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(cName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다.
		// Content-Disposition : 헤더의 예약어
		// attachment : 첨부한다.(예약어)
		// filename= 뒤에 있는 내용이 파일다운로드 제목이 됌
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		fis = new FileInputStream(file);
		ServletOutputStream sos = response.getOutputStream();
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b,0,data);
		}
		
		sos.flush();
		fis.close();
		sos.close();
		
	}

}
