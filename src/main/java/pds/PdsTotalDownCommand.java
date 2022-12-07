package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao = new PdsDAO();
		
		PdsVO vo = dao.getIdxSearch(idx);
		
		String[] fNames = vo.getfName().split("/");
		String[] fSNames = vo.getfSName().split("/");
		
		// input - 읽어옴 output - 무언가 변환시켜서 내보냄
		// 파일 압축에 필요한 객체들을 선언한다.
		FileInputStream fis = null;
		FileOutputStream fos = null;
		ZipOutputStream zos = null;
		ServletOutputStream sos = null;	// 클라이언트에 전송하기위해 필요함.
		
		// 파일명을 원본명으로 가져올때 기존 데이터를 덮어씌울수 있음으로 temp폴더에 복사하며 가져온다.
		// zip파일 압축용 폴더(temp) 패스를 하나더 만든다.
		String realPath = request.getServletContext().getRealPath("/data/pds/");
		String zipPath = request.getServletContext().getRealPath("/data/pds/temp/");
		String zipName = vo.getTitle() + ".zip";
		
		
		// zip으로 묶는 객체(경로를 맞춰둔 껍데기 생성)
		fos = new FileOutputStream(zipPath + zipName);
		zos = new ZipOutputStream(fos);
		
		byte[] b = new byte[2048]; // 2kbyte
		int data = 0;
		
		for(int i=0; i<fNames.length; i++) {
			// 원본 파일명으로 덮어줄 껍데기
			//File copyAndRename = new File(realPath + fNames[i]);
			// 실제 파일을 읽어올 껍데기
			File file = new File(realPath + fSNames[i]);
			
			// 원본 파일명으로 바꾸며 복사(그 껍데기에 있는 경로+파일명으로 복사)
			// 중요(괄호안에 있는 내용이 왼쪽에 덮어짐)
			//copyAndRename.renameTo(file);		// _a_.renameTo(_b_) : b파일을 a파일로 이름을 바꿔서 이동처리한다.
			
			// 복사된 파일을 다시 읽는다
			fis = new FileInputStream(file);
			
			// zip파일 안에 데이터를 넣을 껍데기를 생성
			zos.putNextEntry(new ZipEntry(fNames[i]));
			
			//data가 다옮겨지면 .read에서 -1이 됨
			while((data = fis.read(b, 0, b.length)) != -1) {
				//byte[] b에 있는 데이터를 zos안에 계속 넣는다.
				zos.write(b, 0, data);
			}
			// 찌꺼기가 남을수 있으니 모두 보내는 명령어
			zos.flush();
			
			// .closeEntry() : zip안에 넣었던 껍데기의 입구를 닫음 / .close() : zip 전체 껍데기를 닫아버림
			zos.closeEntry();
			fis.close();
		}
		
		zos.close();
		
		// 서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 압축되어 있는 파일을 삭제한다.
		// 전송프로토콜인 http헤더에 필요한 정보를 알려준다.
		String mimeType = request.getServletContext().getMimeType(zipName.toString());
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
			downLoadName = new String(zipName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(zipName.getBytes("EUC-KR"), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다.
		// Content-Disposition : 헤더의 예약어
		// attachment : 첨부한다.(예약어)
		// filename= 뒤에 있는 내용이 파일다운로드 제목이 됌
		// 헤더정보를 가지고 서버의 zip파일을 클라이언트에 전송처리한다.
		response.setHeader("Content-Disposition", "attachment;filename="+downLoadName);
		
		
		// Java로 실제파일을 클라이언트로 다운처리 시켜준다.
		fis = new FileInputStream(zipPath + zipName);
		sos = response.getOutputStream();
		
		while((data = fis.read(b, 0, b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		
		sos.close();
		fis.close();
		// 이곳까지가 클라이언트로 전송완료됨...
		
		// 서버에 존재하는 zip파일을 삭제처리한다.
		new File(zipPath + zipName).delete();
		
		// 다운로드 횟수를 증가처리한다.
		dao.setPdsDownNum(idx);
		
	}

}
