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
  <script>
  	'use strict'
  	function midSearch() {
			let mid = myform.mid.value;
			if(mid.trim() == "") {
				alert("아이디를 입력하세요!");
				myform.mid.focus();
			}
			else {
				myform.temp.value = "";
				myform.submit();
			}
		}
  	function search() {
			let temp = myform.temp.value;
			if(temp.trim() == "") {
				myform.temp.focus();
			}
			else {
				myform.mid.value = "";
				myform.submit();
			}
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <c:if test="${sLevel != 0}"><h2>전체 회원 리스트</h2></c:if>
  <c:if test="${sLevel == 0}"><h2>전체 회원 리스트(관리자용)</h2></c:if>
  <br/>
  <form name="myform" method="post" action="${ctp}/memMemberSearch.mem">
  	<div class="row">
  		<div class="col text-left"><button type="button" onclick="location.href='${ctp}/memList.mem'" class="btn btn-secondary m-2" >전체검색</button></div>
  		<div class="col form-inline">
  			<input type="text" name="mid" class="form-control m-2" autofocus/>
  			<input type="button" value="아이디개별검색" onclick="midSearch();" class="btn btn-secondary m-2" />
  		</div>
  		<div class="col form-inline">
  			<input type="text" name="temp" class="form-control m-2" autofocus/>
  			<input type="button" value="일반검색" onclick="search();" class="btn btn-secondary m-2" />
  		</div>
  	</div>
  </form>
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
  			<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}&pag=${pag}">${vo.mid}</a></td>
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
	<%-- <!-- 블록 페이지 시작(선생님 처리방식) -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?mid=${mid}&pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 --> --%>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>