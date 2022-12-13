<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>myinfoupdate.jsp</title>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <script>
  	'use strict'
  	function delete() {
  		if(confirm("정말 삭제하시겠습니까?")){
  			deleteForm.submit;
  		}
  		else{
  			alert("삭제 취소되었습니다");
  		}
		}
  </script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container text-center">
  <h2>개인 정보 수정</h2>
  <form name="updateForm" method="get" action="${pageContext.request.contextPath}/database/MemberUpdate">
  	<table class="table table-bordered text-center" style="width:600px;margin:20px auto;">
  		<tr>
  			<th>번호</th>
  			<td><input type="text" value="${vo.idx}" class="form-control" disabled /></td>
  		</tr>
  			<th>아이디</th>
  			<td><input type="text" name="mid" value="${vo.mid}" class="form-control"/></td>
  		</tr>
  			<th>비밀번호</th>
  			<td><input type="text" name="pwd" value="${vo.pwd}" class="form-control"/></td>
  		</tr>
  			<th>성명</th>
  			<td><input type="text" name="name" value="${vo.name}" class="form-control"/></td>
  		</tr>
  			<th>포인트</th>
  			<td><input type="text" value="${vo.point}" class="form-control" disabled /></td>
  		</tr>
  			<th>최근방문일</th>
  			<td><input type="text" value="${vo.lastDate}" class="form-control" disabled /></td>
  		</tr>
		</table>
	<br/>
	<div><a href="${pageContext.request.contextPath}/study/1120_Database/member.jsp" class="btn btn-primary form-control m-3">돌아가기</a></div>
	<div><input type="submit" value="수정완료" class="btn btn-warning form-control m-3"/></div>
	<div><a href="${pageContext.request.contextPath}/database/MemberDelete" onclick="delete()" class="btn btn-danger form-control m-3">삭제하기</a></div>
	</form>
</div>
<p><br/></p>
</body>
</html>