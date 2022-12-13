<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boSearch.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict'
  	function pageCheck() {
			let pageSize = document.getElementById("pageSize").value;
			location.href = "${ctp}/boList.bo?pageSize="+pageSize+"&pag=${pag}";
		}
  	function searchCheck() {
			let searchString = $("#searchString").val();
			
			if(searchString.trim() == ""){
				alert("검색어를 입력해주세요!");
				searchForm.searchString.focus();
			}
			else {
				searchForm.submit();
			}
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2 class="text-center">게 시 판 조 건 검 색 리 스 트</h2>
  <div class="text-center">
  	(<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 ${searchCount}건이 검색되었습니다.)
  </div>
  <br/>
  <table class="table table-borderless">
  	<tr>
  		<c:if test="${sLevel != 1}"><td class="text-left p-0"><a href="${ctp}/boInput.bo?pageSize=${pageSize}&pag=${pag}" class="btn btn-secondary btn-sm">글쓰기</a></td></c:if>
  		<td class="text-right p-0">
  			<select name="pageSize" id="pageSize" onchange="pageCheck()">
  				<option value="5" ${pageSize==5 ? 'selected' : ''}>5건</option>
  				<option value="10" ${pageSize==10 ? 'selected' : ''}>10건</option>
  				<option value="15" ${pageSize==15 ? 'selected' : ''}>15건</option>
  				<option value="20" ${pageSize==20 ? 'selected' : ''}>20건</option>
  			</select>
  		</td>
  	</tr>
  </table>
  <table class="table table-hover text-center">
  	<tr class="table-dark text-dark">
  		<th>글번호</th>
  		<th>글제목</th>
  		<th>글쓴이</th>
  		<th>글쓴날짜</th>
  		<th>조회수</th>
  		<th>좋아요</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}">
  		<tr>
  			<td>${searchCount}</td>
  			<td class="text-left"><a href="${ctp}/boContent.bo?flag=search&search=${search}&searchString=${searchString}&idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}">${vo.title}</a><c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif"/></c:if></td>
  			<td>${vo.nickName}</td>
  			<td>${fn:substring(wDate,0,16)}</td>
  			<td>${vo.readNum}</td>
  			<td>${vo.good}</td>
  		</tr>
  		<c:set var="searchCount" value="${searchCount-1}"/>
  		<tr><td colspan="6" class="m-0 p-0"></td></tr>
  	</c:forEach>
  </table>
	<br/>
	<div>
		<a href="${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}" class="btn btn-secondary">돌아가기</a>
	</div>
	<%-- 
	<!-- 검색기 처리 시작 -->
	<div class="container">
		<form name="searchForm" method="post" action="${ctp}/boSearch.bo">
			<b>검색 : </b>
			<select name="search">
				<option ${search=='title-content' ? 'selected' : '' } selected value="title-content">제목 + 내용</option>
				<option ${search=='title' ? 'selected' : '' } value="title">제목</option>
				<option ${search=='nickName' ? 'selected' : '' } value="nickName">닉네임</option>
				<option ${search=='content' ? 'selected' : '' } value="content">내용</option>
			</select>
			<input type="text" name="searchString" id="searchString"/>
			<input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm" />
			<input type="hidden" name="pag" value="${pag}" />
			<input type="hidden" name="pageSize" value="${pageSize}" />
		</form>
	</div>
	<!-- 검색기 처리 끝 -->
	 --%>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>