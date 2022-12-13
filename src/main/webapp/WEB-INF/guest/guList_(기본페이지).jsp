<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%-- <% 
	if(request.getRemoteAddr().equals("192.168.50.191")){
		out.println("<script>");
		out.println("alert('당신은 밴됬습니다~ 뿌우~')");
		out.println("location.href='/javawjsp/'");
		out.println("</script>");
	}
%> --%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>guList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	function delCheck(idx) {
			let ans = confirm("정말로 삭제하시겠습니까?");
			if(ans) location.href="${ctp}/guDelete.gu?idx="+idx;
		}
  	
  	//이미지 크기제한
  	$(function(){
  		$("img").each(function () {
				let maxWidth = 960;
				let width = $(this).width();
				if(maxWidth < width){
					$(this).css("width", maxWidth);
				}
			})
  	});
  	
  </script>
  <style>
  	th {
  		text-align: center;
  		background-color: #ccc;
  	}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>방 명 록 리 스 트</h2>
  <br/>
  <table class="table">
  	<tr>
  		<td>
				<c:if test="${sAMid eq 'admin'}">
					<a href="${ctp}/adminLogout.gu" class="btn btn-sm btn-danger">관리자 로그아웃</a>
				</c:if>
				<c:if test="${sAMid ne 'admin'}">
					<a href="${ctp}/adminLogin.gu" class="btn btn-sm btn-secondary">관리자</a>
				</c:if>
			</td>
  		<td style="text-align: right;"><a href="${ctp}/guest/guInput.gu" class="btn btn-sm btn-secondary">글쓰기</a></td>
  	</tr>
  </table>
  <table class="table table-borderless m-0 p-0">
  	<tr>
  		<td class="text-right">
  			<!-- 첫페이지 / 이전페이지 / (현페이지번호/총페이지수) / 다음페이지 / 마지막페이지 -->
  			<c:if test="${pag > 1}">
  				<a href="${ctp}/guList.gu?pag=1">[첫페이지]</a>
  				<a href="${ctp}/guList.gu?pag=${pag-1}">[이전페이지]</a>
  			</c:if>
  			${pag}/${totPage}
  			<c:if test="${pag < totPage}">
  				<a href="${ctp}/guList.gu?pag=${pag+1}">[다음페이지]</a>
  				<a href="${ctp}/guList.gu?pag=${totPage}">[마지막페이지]</a>
  			</c:if>
  		</td>
  	</tr>
  </table>
  
  <div class="text-center">
		<c:forEach begin="1" end="${totPage}" varStatus="st">
			<c:if test="${pag eq st.count}">
				<a href="${ctp}/guList.gu?pag=${st.count}" class="btn btn-warning" style="width: 40px">${st.count}</a>
			</c:if>
			<c:if test="${pag ne st.count}">
				<a href="${ctp}/guList.gu?pag=${st.count}" class="btn btn-primary" style="width: 40px">${st.count}</a>
			</c:if>
		</c:forEach> 
	</div>
	
  <%-- 
  <c:set var="pum" value="${(pageNum * 5) - 1}"/>
  <c:set var="maxpum" value="${pum + 4}"/>
  <c:if test="${pum < maxpum}">
  	<c:set var="pum" value="${pum +1}"/>
  </c:if>
   --%>
<%-- <%
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		request.setAttribute("pageNum", 1);
	}
	else {
		request.setAttribute("pageNum", Integer.parseInt(pageNum));
	}
%> --%>
<%-- 	<c:set var="bg" value="${(pageNum-1)*5}"/>
	<c:set var="ag" value="${(pageNum-1)*5+4}"/> --%>
<%-- 		<c:if test="${bg < st.index <= ag}"> --%>

  <c:set var="cSSNo" value="${curScrStartNo}"/>
  <c:set var="curScrStartNo" value="${curScrStartNo}"/>
  <c:forEach var="vo" items="${vos}" varStatus="st">
	  <table class="table">
	  	<tr>
	  		<td>방문번호 : ${curScrStartNo}
				<c:if test="${sAMid eq 'admin'}">
					<a href="javascript:delCheck(${vo.idx})" class="btn btn-sm btn-danger">삭제</a>
				</c:if>
				</td>
	  		<td style="text-align: right;">방문IP : ${vo.hostIp}</td>
	  	</tr>
	  </table>
	  <table class="table table-bordered mb-0">
	  	<tr>
	  		<th style="width: 20%;">성명</th>
	  		<td style="width: 30%;">${vo.name}</td>
	  		<th style="width: 20%;">방문날짜</th>
	  		<td style="width: 30%;">${fn:substring(vo.visitDate,0,16)}</td>
	  	</tr>
	  	<tr>
	  		<th>전자우편</th>
	  		<td colspan="3">${vo.email}</td>
	  	</tr>
	  	<tr>
	  		<th>홈페이지</th>
	  		<td colspan="3">
	  			<c:if test="${fn:length(vo.homePage) <= 8}">없음</c:if>
	  			<c:if test="${fn:length(vo.homePage) > 8}">
	  				<a href="${vo.homePage}" target="_blank">${vo.homePage}</a>
	  			</c:if>
	  		</td>
	  	</tr>
	  	<tr>
	  		<th>방문소감</th>
	  		<td colspan="3">${fn:replace(vo.content, newLine, '<br/>')}</td>
	  	</tr>
	  </table>
  	<br/>
  	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
  </c:forEach>
</div>
<%-- 		</c:if> --%> 

<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>