<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>Format 라이브러리</h2>
  <p>형식문자열을 지정할때 사용(쉼표, 화폐단위, 백분율...)</p>
  <p>사용법 : < fmt : 명령어 value="$ {값}" pattern="표현패턴"></p>
  <p>
  	<h5>formatNumber 형식을 지정한 출력</h5>
  	1-1.천단위마다 콤마표시 : <fmt:formatNumber value="1234567"/><br/>
<%
	int won = 7654321;
	pageContext.setAttribute("won", won);
%>
		1-2. 사용예 : 7654321 => <fmt:formatNumber value="${won}"/><br/>
  	1-3. 사용예 : 1234.567 => <fmt:formatNumber value="1234.567" pattern="#,##0.0"/><br/>
  	2-1.화폐단위 : <fmt:formatNumber value="${won}" type="currency"/><br/>
  	2-2.화폐단위(영문) : <fmt:formatNumber value="${won}" type="currency" currencyCode="USD"/><br/>
  	<c:set var="su1" value="0.9543"/>
  	3.백분율 : <fmt:formatNumber value="${su1}" type="percent"/><br/>
  	<br/>
  	<h5>formatDate 형식을 지정한 출력</h5>
  	<p>자바형식의 날짜를 jstl1변수에 저장 : <c:set var="now" value="<%=new java.util.Date()%>"/></p>
  	<p>
  		오늘 날짜 : ${now}<br/>
  		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/><br/>
  		<fmt:formatDate value="${now}" pattern="hh : mm : ss"/><br/>
  		<fmt:formatDate value="${now}" pattern="yyyy-MM-dd hh : mm : ss"/><br/>
  		<fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/><br/>
  	</p>
  	<hr/>
  	<h3>국가별설정(로케일)</h3>
  	<p>
  		톰캣 서버의 기본 로케일 : <%=response.getLocale() %><br/>
  		톰캣 서버의 기본 로케일(미국식변화) : <fmt:setLocale value="en_US"/><%=response.getLocale() %><br/>
  		<fmt:formatNumber value="${won}" type="currency"/>
  	</p>
  	<h4>기타</h4>
  	<p>지정된 곳으로 이동 : location.href()</p>
  	<%-- c:redirect url="jstl1.jsp"/> --%>
  	<p>절대 경로 : 그림1 <img src="${ctp}/images/1.png" width="200px"/></p>
  	<p>URL 문 : 그림2 <c:url var="img" value="${ctp}/images/2.png"/><br/>
  										<img src="${img2}" width="200px"/>
  	</p>
  </p>
</div>
<p><br/></p>
</body>
</html>