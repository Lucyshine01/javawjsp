<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>scMenu.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	
  	//뷰를 뿌릴때 바로 사용되는 함수
  	$(document).ready(function() {
			$("#scheduleInputHidden").hide();
		});
  	
  	// 일정 등록폼을 가상에 출력하기
  	function scheduleInputView() {
			let scheduleInput = '<hr/><div id="secheduleInputForm">';
			scheduleInput += '<form name="myform">';
			scheduleInput += '<table class="table table-bordered">';
			scheduleInput += '<tr><th>일정분류</th><td>';
			scheduleInput += '<select name="part" class="form-control">';
			scheduleInput += '<option value="모임">모임</option>';
			scheduleInput += '<option value="업무">업무</option>';
			scheduleInput += '<option value="학습">학습</option>';
			scheduleInput += '<option value="여행">여행</option>';
			scheduleInput += '<option value="기타">기타</option>';
			scheduleInput += '</select>';
			scheduleInput += '</td></tr>';
			scheduleInput += '<tr><th>내용</th><td>';
			scheduleInput += '<textarea name="content" rows="4" class="form-control"></textarea>';
			scheduleInput += '</td></tr>';
			scheduleInput += '<tr><td colspan="2" class="text-center">';
			scheduleInput += '<input type="button" value="일정등록" onclick="scheduleInputOk()" class="btn btn-success form-control">';
			scheduleInput += '</td></tr>';
			scheduleInput += '</table>';
			scheduleInput += '</div>';
			$("#demo").html(scheduleInput);
			$("#demo").slideDown(500);
			$("#scheduleInputHidden").show();
			$("#scheduleInputView").hide();
		}
  	
  	// 일정 등록창 닫기
  	function scheduleInputHidden() {
  		$("#scheduleInputHidden").hide();
			$("#scheduleInputView").show();
  		$("#secheduleInputForm").slideUp(500);
  		//$("#secheduleInputForm").hide();
		}
  	
  	// 일정 등록하기(ajax처리)
  	function scheduleInputOk() {
			let part = myform.part.value;
			let content = myform.content.value;
			if(content == ""){
				alert("일정을 입력하세요!");
				myform.content.focus();
				return false;
			}
			let query = {
					mid : '${sMid}',
					ymd : '${ymd}',
					part : part,
					content : content
			}
			
			$.ajax({
				type : "post",
				url : "${ctp}/scheduleInputOk.sc",
				data : query,
				success: function(res) {
					if(res == "1") {
						alert("일정이 등록되었습니다.");
						location.reload();
					}
					else {
						alert("일정 등록에 실패했습니다.");
					}
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
  <h4>${ymd} 일정입니다.</h4>
  <p>오늘의 일정은 총 ${scheduleCnt} 건 있습니다.</p>
  <hr/>
  <div>
  	<input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-primary" />
  	<input type="button" value="등록창닫기" onclick="scheduleInputHidden()" id="scheduleInputHidden" class="btn btn-primary" />
  	<input type="button" value="돌아가기" onclick="location.href='${ctp}/schedule.sc?yy=${fn:split(ymd,'-')[0]}&mm=${fn:split(ymd,'-')[1]-1}'" class="btn btn-info" />
  </div>
  <div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>