<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boContent.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict'
  	function goodCheck() {
			$.ajax({
				type: "post",
				url: "${ctp}/boGood.bo",
				// 값에 숫자는 그냥 써도 되지만 문자는 ""사이에 넣어줘야함
				data: {idx: ${vo.idx}},
				success: function(res){
					location.reload();
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>글 내 용 보 기</h2>
  <br/>
  <table class="table table-borderless">
  	<tr>
  		<th class="text-right">hostIp : ${vo.hostIp}</th>
  	</tr>
  </table>
  <table class="table table-bordered">
  	<tr>
  		<th>글쓴이</th>
  		<td>${vo.nickName}</td>
  		<th>날짜</th>
  		<td>${vo.wDate}</td>
  	</tr>
  	<tr>
  		<th>제목</th>
  		<td colspan="3">${vo.title}</td>
  	</tr>
  	<tr>
  		<th>이메일</th>
  		<td>${vo.email}</td>
  		<th>조회수</th>
  		<td>${vo.readNum}</td>
  	</tr>
  	<tr>
  		<th>홈페이지</th>
  		<td>${vo.homePage}</td>
  		<th>좋아요</th>
  		<td><a href="javascript:goodCheck()">❤</a> 토글처리 ${vo.good} , 👍계속증가 👎계속감소<td>
  	</tr>
  	<tr>
  		<th>글내용</th>
  		<td colspan="3" style="height: 250px">${vo.content}</td>
  	</tr>
  	<tr>
  		<td colspan="4" class="text-center">
  			<input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pageSize=${pageSize}&pag=${pag}';" class="btn btn-secondary"/>
  		</td>
  	</tr>
  </table>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>