<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	if((String)session.getAttribute("sIdSave") != null){
		Cookie cookieMid = new Cookie("cMid",(String)session.getAttribute("sMid"));
		cookieMid.setMaxAge(60*5);
		response.addCookie(cookieMid);
		session.removeAttribute("sIdSave");
	}
	
	pageContext.setAttribute("sesId", session.getId());
	
	//Application속성으로 세션값을 모은 ArrayList선언
	ArrayList<String> sessionValues = (ArrayList)application.getAttribute("sSessionVal");

	//들어온 세션값이 새로운 세션일 경우 방문자수 +1 처리
	String val = (String)application.getAttribute("aVisitCnt");
	out : if(sessionValues != null){
		for(int i=0; i<sessionValues.size(); i++) {
			if(sessionValues.get(i).equals(session.getId())) break out;
		}
		int val_int = Integer.parseInt(val);
		String plus = String.valueOf(val_int + 1);
		application.setAttribute("aVisitCnt", plus);
	}
	else {
		application.setAttribute("aVisitCnt", "1");
	}

	// Application속성으로 ArrayList에 세션값 처리(중복 불가 처리)
	int sw = 0;
	if(sessionValues == null) {
		ArrayList<String> newList = new ArrayList<String>();
		newList.add(session.getId());
		application.setAttribute("sSessionVal", newList);
	}
	else {
		for(int i=0; i<sessionValues.size(); i++) {
			if(sessionValues.get(i).equals(session.getId())) {
				sw = 1;
			}
		}
		if(sw == 0) {
			sessionValues.add(session.getId());
			application.setAttribute("sSessionVal", sessionValues);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>t2_LoginMember.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>회원 전용방</h2>
  <p><font color="blue">${sMid}님</font> 로그인 중이십니다.</p>
  <hr/>
  <p><img src="${pageContext.request.contextPath}/images/ecat.png" width="300px"/></p>
  <div><h3>방문자 수 : <font color="red">${aVisitCnt}</font></h3></div>
  <div>현재 세션 : [${sesId}</div>
  <hr/>
  <p><a href="CookiesCheck.jsp" class="btn btn-success form-control">쿠키보기</a></p>
  <p><a href="CookieDelete.jsp" class="btn btn-success form-control">쿠키의 아이디 삭제</a></p>
  <p><a href="${pageContext.request.contextPath}/j1118h2/Logout" class="btn btn-success form-control">로그아웃</a></p>
  <hr/>
</div>
<p><br/></p>
</body>
</html>