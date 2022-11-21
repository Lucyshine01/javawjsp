<%@ page import="java.util.ArrayList"%>
<%-- <%@ page import="study.database.*"%> --%>
<%@ page import="study.database.JusorokVO"%>
<%@ page import="study.database.JusorokDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jstl.3.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<%
	JusorokDAO dao = new JusorokDAO();
	ArrayList<JusorokVO> vos = dao.getMemberList();
	pageContext.setAttribute("vos", vos);
%>
<c:set var="cnt" value="0"/>
<div class="container">
  <h2>회원 전체 리스트</h2>
  <table class="table table-hover">
  	<tr>
  		<th>번호</th>
  		<th>아이디</th>
  		<th>비밀번호</th>
  		<th>성명</th>
  		<th>포인트</th>
  		<th>최종 방문일</th>
  	</tr>
  	<c:set var="cnt0" value="0"/>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  	<input type="hidden" value="${cnt = cnt+1}" />
  		<tr>
  			<td>${vo.idx}</td>
  			<td>${vo.mid}</td>
  			<td>${vo.pwd}</td>
  			<td>${vo.name}</td>
  			<td>${vo.point} pt</td>
  			<td>${vo.lastDate}</td>
  		</tr>
  	</c:forEach>
  	<tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <p>전체 출력 건수 : <font color="red"><b>${cnt} 건</b></font></p>
  <input type="hidden" value="${cnt = 0}" />
  <hr/>
  <pre>
  	<h4>등록된 회원중 홀수번째 가입한 회원만 출력하시오?2</h4>
  </pre>
  <table class="table table-hover">
  	<tr>
  		<th>번호</th>
  		<th>아이디</th>
  		<th>비밀번호</th>
  		<th>성명</th>
  		<th>포인트</th>
  		<th>최종 방문일</th>
  	</tr>
  	<%-- <c:forEach var="vo" items="${vos}" begin="1" step="2" varStatus="st"> --%>
  	<c:forEach var="vo" items="${vos}" varStatus="st">
  		<c:if test="${vo.idx % 2 == 1}">
	  		<tr>
	  			<td>${vo.idx}</td>
	  			<td>${vo.mid}</td>
	  			<td>${vo.pwd}</td>
	  			<td>${vo.name}</td>
	  			<td>${vo.point} pt</td>
	  			<td>${vo.lastDate}</td>
	  		</tr>
  		</c:if>
  	</c:forEach>
  	<tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <pre>
  	<h4>등록된 회원중 홀수번째 가입한 회원만 출력하시오?3</h4>
  </pre>
  <table class="table table-hover">
  	<tr>
  		<th>번호</th>
  		<th>아이디</th>
  		<th>비밀번호</th>
  		<th>성명</th>
  		<th>포인트</th>
  		<th>최종 방문일</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" begin="1" step="2" varStatus="st">
  		<c:if test="${vo.idx % 2 == 1}">
	  		<tr>
	  			<td>${vo.idx}</td>
	  			<td>${vo.mid}</td>
	  			<td>${vo.pwd}</td>
	  			<td>${vo.name}</td>
	  			<td>${vo.point} pt</td>
	  			<td>${vo.lastDate}</td>
	  		</tr>
 	 			<c:set var="cnt" value="${st.count}"/>
  		</c:if>
  	</c:forEach>
  	<tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <p>전체 출력 건수 : <font color="red"><b>${cnt} 건</b></font></p>
  </table>
  <pre>
  	<h4>등록된 회원중 홀수번째 가입한 회원만 출력하시오?4</h4>
  </pre>
  <table class="table table-hover">
  	<tr>
  		<th>번호</th>
  		<th>아이디</th>
  		<th>비밀번호</th>
  		<th>성명</th>
  		<th>포인트</th>
  		<th>최종 방문일</th>
  	</tr>
  	<c:set var="cnt2" value="0"/>
  	<c:forEach var="vo" items="${vos}" begin="1" step="2" varStatus="st">
  		<c:if test="${vo.idx % 2 == 1}">
	  		<tr>
	  			<td>${vo.idx}</td>
	  			<td>${vo.mid}</td>
	  			<td>${vo.pwd}</td>
	  			<td>${vo.name}</td>
	  			<td>${vo.point} pt</td>
	  			<td>${vo.lastDate}</td>
	  		</tr>
  		</c:if>
  		<c:set var="cnt2" value="${cnt2+1}"/>
  	</c:forEach>
  	<tr><td colspan="6" class="m-0 p-0"></td></tr>
  </table>
  <p>전체 출력 건수 : <font color="blue"><b>${cnt2} 건</b></font></p>
</div>
<p><br/></p>
</body>
</html>