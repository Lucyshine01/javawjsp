<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>boList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict'
  	let pag = ${pag};
  	let totPage = ${totPage};
  	
		let search = '${search}';
  	if(pag > totPage) {
  		if(search.length > 1){
				location.href = "${ctp}/boSearch.bo?pageSize=${pageSize}&search=${search}&searchString=${searchString}&pag=${totPage}";
			}
			else {
				location.href = "${ctp}/boList.bo?pageSize=${pageSize}&pag=${totPage}";
			}
  	}
  	function pageCheck() {
  		let pageSize = document.getElementById("pageSize").value;
			if(search.length() > 1){
				location.href = "${ctp}/boSearch.bo?pageSize="+pageSize+"&pag=${pag}&search=${search}&searchString=${searchString}";
			}
			else {
				location.href = "${ctp}/boList.bo?pageSize="+pageSize+"&pag=${pag}";
			}
		}
  	function searchCheck() {
			let searchString = $("#searchString").val();
			
			if(searchString.trim() == "") {
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
<c:if test="${search != null}"><c:set var="ctp_boSearch" value="${ctp}/boSearch.bo?pageSize=${pageSize}&search=${search}&searchString=${searchString}"/></c:if>
<c:if test="${search == null}"><c:set var="ctp_boList" value="${ctp}/boList.bo?pageSize=${pageSize}"/></c:if>
<div class="container">
	<!-- search.bo -->
	<c:if test="${search != null}">
		<h2 class="text-center">게 시 판 조 건 검 색 리 스 트</h2>
	  <div class="text-center">
	  	(<font color="blue">${searchTitle}</font>(으)로 <font color="red">${searchString}</font>(을)를 검색한 결과 ${searchCount}건이 검색되었습니다.)
	  </div>
	</c:if>
	<!-- list.bo -->
	<c:if test="${search == null}">
  	<h2 class="text-center">게 시 판 리 스 트</h2>
  </c:if>
  <br/>
  <table class="table table-borderless">
  	<tr>
  		<c:if test="${sLevel != 1 && search == null}"><td class="text-left p-0"><a href="${ctp}/boInput.bo?pageSize=${pageSize}&pag=${pag}" class="btn btn-secondary btn-sm">글쓰기</a></td></c:if>
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
  			<td>${curScrStartNo}</td>
  			<td class="text-left">
  				<c:set var="ctp_content" value="${ctp}/boContent.bo?idx=${vo.idx}&pageSize=${pageSize}&pag=${pag}"/>
  				<a 
  					<c:if test="${search != null}">href="${ctp_content}&flag=search&search=${search}&searchString=${searchString}"</c:if>
	  				<c:if test="${search == null}">href="${ctp_content}"</c:if>>${vo.title}
  				</a>
  				<c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif"/></c:if>
				</td>
  			<%-- <td class="text-left"><a >${vo.title}</a><c:if test="${vo.hour_diff < 24}"><img src="${ctp}/images/new.gif"/></c:if></td> --%>
  			<td>${vo.nickName}</td>
  			<td>
  				<c:if test="${vo.hour_diff < 24}">
  					<c:if test="${vo.hour_diff == 0}">방금 전</c:if>
  					<c:if test="${vo.hour_diff > 0}">${vo.hour_diff}시간 전</c:if>
  				</c:if>
  				<c:if test="${vo.hour_diff >= 24}">
	  				<c:if test="${0 <= vo.day_diff && vo.day_diff <= 10}">${vo.day_diff}일 전</c:if>
	  				<c:if test="${10 < vo.day_diff && vo.day_diff <= 31}">${fn:substring(vo.wDate,0,10)}</c:if>
	  				<c:if test="${31 < vo.day_diff}">${fn:substring(vo.wDate,0,10)}</c:if>
  				</c:if>
  			</td>
  			<td>${vo.readNum}</td>
  			<td>${vo.good}</td>
  		</tr>
  		<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
  		<tr><td colspan="6" class="m-0 p-0"></td></tr>
  	</c:forEach>
  </table>
  <!-- 블록 페이지 시작 -->
  <!-- search.bo -->
  <c:if test="${search != null}">
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boSearch}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boSearch}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp_boSearch}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp_boSearch}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boSearch}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boSearch}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
	</c:if>
	<!-- list.bo -->
  <c:if test="${search == null}">
		<div class="text-center">
		  <ul class="pagination justify-content-center">
		    <c:if test="${pag > 1}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boList}&pag=1">첫페이지</a></li>
		    </c:if>
		    <c:if test="${curBlock > 0}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boList}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
		    </c:if>
		    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
		      <c:if test="${i <= totPage && i == pag}">
		    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp_boList}&pag=${i}">${i}</a></li>
		    	</c:if>
		      <c:if test="${i <= totPage && i != pag}">
		    		<li class="page-item"><a class="page-link text-secondary" href="${ctp_boList}&pag=${i}">${i}</a></li>
		    	</c:if>
		    </c:forEach>
		    <c:if test="${curBlock < lastBlock}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boList}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
		    </c:if>
		    <c:if test="${pag < totPage}">
		      <li class="page-item"><a class="page-link text-secondary" href="${ctp_boList}&pag=${totPage}">마지막페이지</a></li>
		    </c:if>
		  </ul>
		</div>
	</c:if>
	<!-- 블록 페이지 끝 -->
<%-- 	<div class="text-center">
	  <ul class="pagination justify-content-center">
	    <c:if test="${pag > 1}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=1">첫페이지</a></li>
	    </c:if>
	    <c:if test="${curBlock > 0}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
	    </c:if>
	    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
	      <c:if test="${i <= totPage && i == pag}">
	    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
	    	</c:if>
	      <c:if test="${i <= totPage && i != pag}">
	    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=${i}">${i}</a></li>
	    	</c:if>
	    </c:forEach>
	    <c:if test="${curBlock < lastBlock}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
	    </c:if>
	    <c:if test="${pag < totPage}">
	      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pageSize=${pageSize}&pag=${totPage}">마지막페이지</a></li>
	    </c:if>
	  </ul>
	</div> --%>
	<br/>
	<!-- 검색기 처리 시작 -->
	<div class="container">
		<form name="searchForm" method="post" action="${ctp}/boSearch.bo">
			<b>검색 : </b>
			<select name="search">
				<option value="title-content">제목 + 내용</option>
				<option value="title">제목</option>
				<option value="nickName">닉네임</option>
				<option value="content">내용</option>
			</select>
			<input type="text" name="searchString" id="searchString"/>
			<input type="button" value="검색" onclick="searchCheck()" class="btn btn-secondary btn-sm" />
			<input type="hidden" name="pag" value="${pag}" />
			<input type="hidden" name="pageSize" value="${pageSize}" />
		</form>
	</div>
	<!-- 검색기 처리 끝 -->
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>