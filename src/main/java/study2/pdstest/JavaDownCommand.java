package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class JavaDownCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 자바코드 형식으로 파일 다운로드
		// 뷰에서 download="" 태그를 사용 안한 옛날 방식
		
		String realPath = request.getServletContext().getRealPath("/data/pdstest/");
		
		String fName = request.getParameter("file");
		
		File file = new File(realPath + fName);
		
		// 프로토콜형식에 맞도록 헤더에 정보를 제공해 준다.
		// mimeType : 윈도우의 파일형식(예:텍스트파일? 바이너리?....등등...)
		// --> 2진 바이너리형식으로 전송해야 한다.
		String mimeType = request.getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream"); // 2진 바이너리형식
		}
		
		// 사용하는 브라우저에 대한 정보 :
		// 만약에 인터넷익스플로러(IE)인 경우는 'euc-kr'
		// 나머지 브라우저는 'utf-8'을 사용한다.
		String downLoadName = "";
		// 헤더에 있는 브라우저 정보를 받아오기, MSIE : 마이크로소프트 IE
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			// 8859_1 : 윈도우의 한글코드 변환방식
			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다.
		// Content-Disposition : 헤더의 예약어
		// attachment : 첨부한다.(예약어)
		// filename= 뒤에 있는 내용이 파일다운로드 제목이 됌
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		
		// Java에 의해서 실제로 파일을 다운(업)로드 처리시켜준다.(FileInputStream/FileOutputStream/ServletOutputStream)
		// 서버에서 클라를 향해 통로를 만듬(보낼 준비 완료)
		// 저장하는 곳
		FileInputStream fis = new FileInputStream(file); // 껍데기의 헤더에 있는 경로로 실제 데이터를 읽음
		// 내보내는 곳
		//FileOutputStream fos = new FileOutputStream(nfile);
		ServletOutputStream sos = response.getOutputStream();
		
		
		// 전송할 객체를 생성후 실제로 파일을 객체에 담아서 처리시켜준다.
		byte[] b = new byte[2048]; // 2kb씩 담아서 보내겠다는 의미(byte단위)
		int data = 0;
		
		//.read : (b의 0부터 2048)까지의 데이터를 data에 넣는다
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		// 남아 있는 객체까지 모두 담아서 넘김
		sos.flush();
		
		// 여기까지 수행하면 파일 당누로드 처리가 완료된다.
		
		// 가비지 컬렉터가 IOE관련 내용을 지울수 없어서 직접지워줘야한다.
		sos.close();
		fis.close();
		
	}

}
