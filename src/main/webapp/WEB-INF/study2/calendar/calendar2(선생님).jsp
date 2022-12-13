<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>calendar2.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <style>
    #td1,#td8,#td15,#td22,#td29,#td36 {color:red}
    #td7,#td14,#td21,#td28,#td35 {color:blue}
    .today {
      background-color: pink;
      color: #fff;
      font-weight: bolder;
    }
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<p><br/></p>
<div class="container">
  <div class="text-center">
    <button type="button" onclick="location.href='${ctp}/calendar2.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="이전년도">◁◁</button>
    <button type="button" onclick="location.href='${ctp}/calendar2.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary btn-sm" title="이전월">◀</button>
    <font size="5">${yy}년 ${mm+1}월</font>
    <button type="button" onclick="location.href='${ctp}/calendar2.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary btn-sm" title="다음월">▶</button>
    <button type="button" onclick="location.href='${ctp}/calendar2.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary btn-sm" title="다음년도">▷▷</button>
    &nbsp;&nbsp;
    <button type="button" onclick="location.href='${ctp}/calendar2.st';" class="btn btn-secondary btn-sm" title="오늘날짜"><i class="fa fa-home"></i></button>
  </div>
  <br/>
  <div class="text-center">
    <table class="table table-bordered" style="height:450px">
      <tr class="text-center" style="background-color:#eee">
        <th style="width:13%; color:red; vertical-align:middle">일</th>
        <th style="width:13%; vertical-align:middle">월</th>
        <th style="width:13%; vertical-align:middle">화</th>
        <th style="width:13%; vertical-align:middle">수</th>
        <th style="width:13%; vertical-align:middle">목</th>
        <th style="width:13%; vertical-align:middle">금</th>
        <th style="width:13%; color:blue; vertical-align:middle">토</th>
      </tr>
      <tr>
        <c:set var="cnt" value="${1}"/>
        <!-- 시작일 이전의 공백을 이전달의 날짜로 채워준다. -->
        <c:forEach var="preDay" begin="${preLastDay-(startWeek-2)}" end="${preLastDay}">
          <td style="color:#ccc;font-size:0.6em">${prevYear}-${prevMonth+1}-${preDay}</td>
          <c:set var="cnt" value="${cnt+1}"/>
        </c:forEach>
        
        <!-- 해당월에 대한 날짜를 마지막일자까지 반복 출력한다.(단, gap이 7이되면 줄바꿈한다.) -->
        <c:forEach begin="1" end="${lastDay}" varStatus="st">
          <c:set var="todaySw" value="${toYear==yy && toMonth==mm && toDay==st.count ? 1 : 0}"/>
          <td id="td${cnt}" ${todaySw==1 ? 'class=today' : ''} style="font-size:0.9em">
            ${st.count}
          </td>
          <c:if test="${cnt % 7 == 0}"></tr><tr></c:if>  <!-- 한주가 꽉차면 줄바꾸기 한다. -->
          <c:set var="cnt" value="${cnt + 1}"/>
        </c:forEach>
        
        <!-- 마지막일 이후를 다음달의 일자로 채워준다. -->
        <c:if test="${nextStartWeek != 1}">
	        <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
	          <td style="color:#ccc;font-size:0.6em">${nextYear}-${nextMonth+1}-${nextDay.count}</td>
	        </c:forEach>
        </c:if>
      </tr>
    </table>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>