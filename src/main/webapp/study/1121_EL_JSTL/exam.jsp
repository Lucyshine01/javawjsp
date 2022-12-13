<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>exam.jsp</title>
  <%@ include file="../../include/bs4.jsp" %>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
	<div class="container">
  5-3.atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하고 전체 개수를 출력하시오?<br/>
			단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/><br/>
		
		<c:set var="atom" value="Welcome to My Homepage!"/>
		<c:set var="str" value=""/>
		<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" varStatus="st">
		 	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
		 		<c:set var="temp" value="${cnt+1}번째 'o'의 위치는 ${i}입니다./"/>
		 		<c:set var="str" value="${str}${temp}"/>
				<c:set var="cnt" value="${cnt+1}"/>
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${cnt==0}">
				<font color="red"><b>
					해당 문자가 없습니다!
				</b></font>
			</c:when>
			<c:when test="${cnt==1}">
				<font color="red"><b>
					${fn:substring(str,0,fn:length(str)-1)}<br/>
					두번째 값이 존재하지 않습니다!<br/><br/>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:when>
			<c:otherwise>
				<font color="red"><b>
					<c:set var="strs" value="${fn:split(str,'/')}"/>
					<c:forEach var="i" begin="0" end="${fn:length(strs)}">
						${strs[i]}<br/>
					</c:forEach>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:otherwise>
		</c:choose>
		
		6-2.atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하고 전체 개수를 출력하시오?<br/>
			단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/><br/>
		
		<c:set var="atom" value="Welcome to My Homepage!"/>
		<c:set var="str" value=""/>
		<c:set var="cnt" value="0"/>
		<c:set var="nextIdx" value="0"/>
		<c:forEach begin="0" end="${fn:length(atom)}" varStatus="st">
			<c:if test="${fn:indexOf(atom,'o') == nextIdx}">
				<c:set var="cnt" value="${cnt+1}"/>
				<c:set var="str" value="${str}${cnt}번째 'o'문자 인덱스위치 ${st.index}번/"/>
				<c:set var="atom" value="${fn:substringAfter(atom, 'o')}"/>
				<c:set var="nextIdx" value="-1"/>
			</c:if>
			<c:set var="nextIdx" value="${nextIdx+1}"/>
		</c:forEach>
		<c:choose>
			<c:when test="${cnt==0}">
				<font color="red"><b>
					해당 문자가 없습니다!<br/>
				</b></font>
			</c:when>
			<c:when test="${cnt==1}">
				<font color="red"><b>
					${fn:substring(str,0,fn:length(str)-1)}<br/>
					두번째 값이 존재하지 않습니다!<br/><br/>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:when>
			<c:otherwise>
				<font color="red"><b>
					<c:set var="strs" value="${fn:split(str,'/')}"/>
					<c:forEach var="i" begin="0" end="${fn:length(strs)}">
						${strs[i]}<br/>
					</c:forEach>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:otherwise>
		</c:choose>
	
		<p>===='o'가 하나일 경우====</p>
		
		5-3.atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하고 전체 개수를 출력하시오?<br/>
			단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/><br/>
		
		<c:set var="atom" value="Welcome Mypage!"/>
		<c:set var="str" value=""/>
		<c:set var="cnt" value="0" />
		<c:forEach var="i" begin="0" end="${fn:length(atom)-1}" varStatus="st">
		 	<c:if test="${fn:substring(atom,i,i+1) == 'o'}">
		 		<c:set var="temp" value="${cnt+1}번째 'o'문자 인덱스위치 ${i}번/"/>
		 		<c:set var="str" value="${str}${temp}"/>
				<c:set var="cnt" value="${cnt+1}"/>
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${cnt==0}">
				<font color="red"><b>
					해당 문자가 없습니다!
				</b></font>
			</c:when>
			<c:when test="${cnt==1}">
				<font color="red"><b>
					${fn:substring(str,0,fn:length(str)-1)}<br/>
					두번째 값이 존재하지 않습니다!<br/><br/>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:when>
			<c:otherwise>
				<font color="red"><b>
					<c:set var="strs" value="${fn:split(str,'/')}"/>
					<c:forEach var="i" begin="0" end="${fn:length(strs)}">
						${strs[i]}<br/>
					</c:forEach>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:otherwise>
		</c:choose>
		
		<br/><p></p>
		
		6-2.atom변수에 기억되어 있는 'o'문자의 위치를 모두 출력하고 전체 개수를 출력하시오?<br/>
			단, 두번째 기억값이 없으면 1번째 기억위치를 출력하고 '두번째 값 없음'을 함께 출력하시오.<br/><br/>
		
		<c:set var="atom" value="Welcome Mypage!"/>
		<c:set var="str" value=""/>
		<c:set var="cnt" value="0"/>
		<c:set var="nextIdx" value="0"/>
		<c:forEach begin="0" end="${fn:length(atom)}" varStatus="st">
			<c:if test="${fn:indexOf(atom,'o') == nextIdx}">
				<c:set var="cnt" value="${cnt+1}"/>
				<c:set var="str" value="${str}${cnt}번째 'o'문자 인덱스위치 ${st.index}번/"/>
				<c:set var="atom" value="${fn:substringAfter(atom, 'o')}"/>
				<c:set var="nextIdx" value="-1"/>
			</c:if>
			<c:set var="nextIdx" value="${nextIdx+1}"/>
		</c:forEach>
		<c:choose>
			<c:when test="${cnt==0}">
				<font color="red"><b>
					해당 문자가 없습니다!<br/>
				</b></font>
			</c:when>
			<c:when test="${cnt==1}">
				<font color="red"><b>
					${fn:substring(str,0,fn:length(str)-1)}<br/>
					두번째 값이 존재하지 않습니다!<br/><br/>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:when>
			<c:otherwise>
				<font color="red"><b>
					<c:set var="strs" value="${fn:split(str,'/')}"/>
					<c:forEach var="i" begin="0" end="${fn:length(strs)}">
						${strs[i]}<br/>
					</c:forEach>
					전체갯수 : ${cnt}개<br/>
				</b></font>
			</c:otherwise>
		</c:choose>
	</div>
<p><br/></p>
</body>
</html>