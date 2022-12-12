package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class UpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String fName = request.getParameter("fName")==null ? "" : request.getParameter("fName");
//		System.out.println("pdstest에서 넘어온 파일명?" + fName);
		
		// COS라이브러리에서 제공해주는 객체... MultypartRequest() / DefaultFileRenamePolicy() - 중복을 알아서 뒤에 (0),(1) 이런식으로 숫자를 붙여서 방지해줌
		// MultipartRequest(저장소명(request),"서버에 저장될 파일의 경로","서버에 저장될 파일의 최대용량","코드변환방식",기타옵션(중복방지를 위한 클래스))
		// 실제경로를 찾기 .metadata 폴더안에 진짜 시버파일위치를 보여줌
		
		// 정석
//		ServletContext application = request.getServletContext();
//		String realPath = application.getRealPath(null);
		
		// 이렇게 쓰는것도 가능하지만 왠만하면 밑에 방법으로 사용
//		String realPath = request.getRealPath("/");
		
		// 한줄로 줄임
		String realPath = request.getServletContext().getRealPath("/") + "data/pdstest";
		System.out.println("realPath : " + realPath);
		
		int maxSize = 1024 * 1024 * 10;	// 서버에 저장할 최대용량을 10MByte로 한다.(1회 저장)
		String encoding = "UTF-8";
		
		// 파일 업로드..처리...끝
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		// 뷰에서 enctype="multipart/form-data"로 폼내용을 변경하여 문자열형으로 값이 오지않음
		// 업로드된 파일의 정보를 추출해보자...
		String fName = request.getParameter("fName");
		
		// 업로드 시킬때의 업로드 파일명..
		String originalFileName = multipartRequest.getOriginalFileName("fName");
		// 실제 서버에 저장된 파일명...
		String filesystemName = multipartRequest.getFilesystemName("fName");
		
		System.out.println("원본 파일명 : " + fName); // (X)업로드 시킬때의 업로드 파일명이다.
		System.out.println("원본 파일명 : " + originalFileName); // (O)업로드 시킬때의 업로드 파일명이다.
		System.out.println("서버에 저장되는 실제파일명 : " + filesystemName);
		System.out.println("파일이 저장될 서버의 실제경로명(home띠렉토리) : " + realPath);
		
		if(filesystemName == null) {
			request.setAttribute("msg","upLoad1No");
		}
		else {
			request.setAttribute("msg","upLoad1Ok");
		}
		
		request.setAttribute("url", request.getContextPath()+"/pdstest/upLoad1.st");
	}

}
