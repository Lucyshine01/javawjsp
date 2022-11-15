<%@page import="j1116h.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	ProductVO vo = (ProductVO)request.getAttribute("vo");
	System.out.println("메인 페이지 : vo = "+vo);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
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
		<div style="width:150px; float: right;"><input type="button" value="관리자 로그인" class="btn btn-primary" onclick="plus_loginbox();"/></div>
	</div>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/main/check">
		<div id="idbox" style="width:500px; text-align: left; margin:0 auto; font-size:1.2em;">
		</div>
	</form>
	<div style="margin-top: 100px">
		<h3>상품 목록</h3>
		<table class="table" align="center">
			<tr><th>분류</th><th>상품명</th><th>상품가격(정가)</th><th>재고 수</th></tr>
			<%
				if(vo != null){
					if(vo.getType() != null){
						for(int i=0; i<vo.getType().length; i++){
							out.println("<input type='hidden' name='type' value='"+vo.getType()[i]+"'/>");
							out.println("<tr><td>"+vo.getType()[i]+"</td><td>"+vo.getP_name()[i]+"</td><td>"+vo.getP_price()[i]+"원</td><td>"+vo.getP_count()[i]+"개</td></tr>");
						}
					}
					else {
						out.println("<tr><td>상품 없음!</td><td></td><td></td><td></td></tr>");
					}
				}
				else {
					out.println("<tr><td>상품 없음!</td><td></td><td></td><td></td></tr>");
				}
			%>
		</table>
	</div>
</div>
</body>
</html>