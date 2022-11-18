<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>title</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>전체 회원 리스트</h2>
  	<table class="table table-bordered text-center">
  		<tr>
  			<th>번호</th>
  			<td>${vo.idx}</td>
  		</tr>
  			<th>아이디</th>
  			<td>${vo.mid}</td>
  		</tr>
  			<th>비밀번호</th>
  			<td>${vo.pwd}</td>
  		</tr>
  			<th>성명</th>
  			<td>${vo.name}</td>
  		</tr>
  			<th>포인트</th>
  			<td>${vo.point}</td>
  		</tr>
  			<th>최근방문일</th>
  			<td>${vo.lastDate}</td>
  		</tr>
	</table>
	<br/>
	<div><a href="${pageContext.request.contextPath}/study/1120_Database/member.jsp" class="btn btn-danger">돌아가기</a></div>
</div>
<p><br/></p>
</body>
</html>