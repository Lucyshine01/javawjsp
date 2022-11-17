<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="vo" class="study.j1117h2.ProductVO"/>
<jsp:setProperty property="*" name="vo"/>
<jsp:include page="../../include/bs4.jsp"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
  <style>
  	.container{
  		width:1000px;
  	}
  </style>
  <script>
  	'use strict';
  	function plus_loginbox() {
  		document.getElementById("idbox").innerHTML = '아이디 : <input type="text" name="id" id="id" class="form-control mt-2 mb-2"/>';
  		document.getElementById("idbox").innerHTML += '비밀번호 : <input type="password" name="pwd" id="pwd" class="form-control mt-2 mb-2"/>';
  		document.getElementById("idbox").innerHTML += '<input type="button" value="로 그 인" class="btn btn-success form-control mt-2 mb-2" onclick="myform.submit();"/>';
  		document.getElementById("idbox").innerHTML += '<input type="button" value="돌 아 가 기" class="btn btn-danger form-control mt-2 mb-2" onclick="del_loginbox();"/>';
		}
  	function del_loginbox() {
  		document.getElementById("idbox").innerHTML = "";
		}
  </script>
</head>
<body>
<div class="container text-center">
	<div style="margin: 100px auto"></div>
	<div style="margin-bottom: 100px;">
		<h2>메인 화면</h2>
		<c:choose>
			<c:when test="${vo.id == 'admin'}">
				<div style='width:150px; float: right;'>
					<div style="m-3">${vo.id}님 어서오세요</div>
					<input type='button' value='관리자 페이지' class='btn btn-warning' onclick='voform.submit();'/>
				</div>
			</c:when>
			<c:otherwise>
				<div style='width:150px; float: right;'>
					<input type='button' value='관리자 로그인' class='btn btn-primary' onclick='plus_loginbox();'/>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<form name="myform" method="post" action="${pageContext.request.contextPath}//main/check2">
		<div id="idbox" style="width:500px; text-align: left; margin:0 auto; font-size:1.2em;">
		</div>
		<c:choose>
			<c:when test="${!empty fail}">
				<script>
					alert("관리자 로그인 실패!!!");
					document.getElementById("idbox").innerHTML = '아이디 : <input type="text" name="id" id="id" class="form-control mt-2 mb-2"/>';
		  		document.getElementById("idbox").innerHTML += '비밀번호 : <input type="password" name="pwd" id="pwd" class="form-control mt-2 mb-2"/>';
		  		document.getElementById("idbox").innerHTML += '<input type="button" value="로 그 인" class="btn btn-success form-control mt-2 mb-2" onclick="myform.submit();"/>';
		  		document.getElementById("idbox").innerHTML += '<input type="button" value="돌 아 가 기" class="btn btn-danger form-control mt-2 mb-2" onclick="del_loginbox();"/>';
				</script>
	  	</c:when>
	  	<c:when test="${vo.id != 'admin'}">
	  		<script>alert("관리자 아이디는 admin  비밀번호는 1234 입니다");</script>
	  	</c:when>
  	</c:choose>
	</form>
	<form name="voform" method="post" action="${pageContext.request.contextPath}//main/admin">
	<div style="margin-top: 100px">
		<h3>상품 목록</h3>
		<table class="table" align="center">
			<tr><th>분류</th><th>상품명</th><th>상품가격(정가)</th><th>재고 수</th></tr>
			<c:choose>
				<c:when test="${!empty vo}">
					<c:choose>
						<c:when test="${!empty vo.type}">
							<c:forEach var="i" items="${vo.type}" varStatus="status">
								<input type='hidden' name='type' value='${vo.type[status.index]}'/>
								<input type='hidden' name='p_name' value='${vo.p_name[status.index]}'/>
								<input type='hidden' name='p_price' value='${vo.p_price[status.index]}'/>
								<input type='hidden' name='p_count' value='${vo.p_count[status.index]}'/>
								<tr>
									<td>${vo.type[status.index]}</td>
									<td>${vo.p_name[status.index]}</td>
									<td>${vo.p_price[status.index]}원</td>
									<td>${vo.p_count[status.index]}개</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr><td>상품 없음!</td><td></td><td></td><td></td></tr>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<tr><td>상품 없음!</td><td></td><td></td><td></td></tr>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
	</form>
</div>
</body>
</html>