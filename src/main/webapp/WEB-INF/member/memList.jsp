<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>memList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <c:if test="${sLevel != 0}"><h2>전체 회원 리스트</h2></c:if>
  <c:if test="${sLevel == 0}"><h2>전체 회원 리스트(관리자용)</h2></c:if>
  <br/>
  <table class="table table-hover text-center">
  	<tr class="table-dark text-dark">
  		<th>회원번호</th>
  		<th>아이디</th>
  		<th>별명</th>
  		<th>성명</th>
  		<th>성별</th>
  		<th>자기소개</th>
  	</tr>
  	<c:forEach begin="${stratIndexNo}" end="${stratIndexNo+4}" var="vo" items="${vos}" varStatus="st">
  		<tr>
  			<td>${vo.idx}</td>
  			<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}">${vo.mid}</a></td>
  			<td>${vo.nickName}</td>
  			<td>${vo.name}<c:if test="${sLevel == 0 && vo.userInfor == '비공개'}"><font color="red">(비공개)</font></c:if></td>
  			<td>${vo.gender}</td>
  			<td>${vo.content}</td>
  		</tr>
  		<tr><td colspan="5" class="m-0 p-0"></td></tr>
  	</c:forEach>
  </table>
  <div class="text-center">
		<c:forEach begin="1" end="${totPage}" varStatus="st">
			<c:if test="${pag eq st.count}">
				<a href="${ctp}/memList.mem?pag=${st.count}" class="btn btn-warning" style="width: 40px">${st.count}</a>
			</c:if>
			<c:if test="${pag ne st.count}">
				<a href="${ctp}/memList.mem?pag=${st.count}" class="btn btn-primary" style="width: 40px">${st.count}</a>
			</c:if>
		</c:forEach>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>