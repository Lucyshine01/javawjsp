<%@ page import="study.j1116.Test2VO"%><!-- java파일 임포트하기 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	// 가져온 모델을 Test2VO로 타입변환시켜주어 vo변수에 담기
	Test2VO vo = (Test2VO)request.getAttribute("vo");
%>
<!-- 서버코드단과 프론트코드단과 딱 분리한 패턴을 MVC패턴1이라고 한다 -->
<!-- 프론트 서비스 VO 백단위 등으로 각각 나눠숴 컨트롤러로 조종하는 것을 MVC패턴2라고 한다 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test2Ok4_2.jsp</title>
  <%@ include file="../../include/bs4.jsp"%>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>이곳은 test2Ok4_2.jsp입니다</h2>
  <p>jsp에서의 vo : ${vo}</p>
  <p>학번 : ${vo.hakbun}</p>
  <p>성명 : ${vo.name}</p>
  <p>국어 : ${vo.kor}</p>
  <p>영어 : ${vo.eng}</p>
  <p>수학 : ${vo.mat}</p>
  <p>사회 : ${vo.soc}</p>
  <p>과학 : ${vo.sci}</p>
  <p>총점 : ${vo.tot}</p>
  <p>평균 : ${vo.avg}</p>
  <p>학점 : ${vo.grade}</p>
	<p><br/></p>
	<%-- <p><a href="<%=request.getContextPath()%>/study/1116/test2.jsp" class="btn btn-success">돌아가기</a></p> --%>
	<p><a href="${pageContext.request.contextPath}/study/1116/test2.jsp" class="btn btn-success">돌아가기</a></p>
</div>
</body>
</html>