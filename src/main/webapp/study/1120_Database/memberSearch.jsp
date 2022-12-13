<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>memberSearch</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style>
  	input[type="text"]{
  		margin-left: 10px;
  		padding: 3px;
  	}
  </style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2>회원 조회</h2>
  <hr/>
  <form name="searchform" method="post" action="${pageContext.request.contextPath}/database/SearchMid">
  <div class="row" style="font-size: 1.05em">
		<div class="col-3">회원번호 <input type="text" name="idx" size="6" /></div>
  	<div class="col-3" style="border-left: 1px solid #ccc;">아이디 <input type="text" name="mid" size="6" /></div>
  	<div class="col-3" style="border-left: 1px solid #ccc;">성명 <input type="text" name="name" size="6" /></div>
		<div class="col-3" style="border-left: 1px solid #ccc;">
			<input type="submit" value="검 색" class="btn btn-success" style="padding: 10px 50px"/>
		</div>
	</div>
	</form>
  <hr/>
  	<table class="table table-bordered text-center" style="margin: 30px auto;">
  		<thead class="table-dark">
	  		<tr>
	  			<th>회원번호</th><th>아이디</th><th>비밀번호</th><th>성명</th><th>포인트</th><th>최종 방문일</th>
	  		</tr>
  		</thead>
			<c:if test="${vos != null}">
				<c:forEach var="vo" items="${vos}" varStatus="st">
				<tr>
					<td>${vo.idx}</td><td>${vo.mid}</td><td>${vo.pwd}</td>
					<td>${vo.name}</td><td>${vo.point}</td><td>${vo.lastDate}</td>
				</tr>
				</c:forEach>
			</c:if>
		</table>
	<br/>
	<div><a href="${pageContext.request.contextPath}/study/1120_Database/member.jsp" class="btn btn-danger">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>
