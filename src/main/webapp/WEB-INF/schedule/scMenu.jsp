<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<% pageContext.setAttribute("newLine", "\n"); %>
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
			scheduleInput += '</form></div>';
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
  	// 스케쥴 수정하기
  	function updateCheck(idx,part,content) {
  		let scheduleInput = '<div id="scheduleUpdateForm'+idx+'">';
			scheduleInput += '<form name="updatemyForm'+idx+'">';
			scheduleInput += '<table class="table table-bordered">';
			scheduleInput += '<tr><th>일정분류</th><td>';
			scheduleInput += '<select name="part" id="part'+idx+'" class="form-control">';
			let partName = ['모임','업무','학습','여행','기타'];
			for(let i=0; i<partName.length; i++){
				if(partName[i] == part) scheduleInput += '<option value="'+partName[i]+'" selected>'+partName[i]+'</option>';
				else scheduleInput += '<option value="'+partName[i]+'">'+partName[i]+'</option>';
			}
			/* scheduleInput += '<option value="모임">모임</option>';
			scheduleInput += '<option value="업무">업무</option>';
			scheduleInput += '<option value="학습">학습</option>';
			scheduleInput += '<option value="여행">여행</option>';
			scheduleInput += '<option value="기타">기타</option>';
			scheduleInput += '<option value="'+part+'" selected >'+part+'</option>'; */
			scheduleInput += '</select>';
			scheduleInput += '</td></tr>';
			scheduleInput += '<tr><th>내용</th><td>';
			scheduleInput += '<textarea name="content" id="content'+idx+'" rows="4" class="form-control">'+content.replaceAll("<br/>","\n")+'</textarea>';
			scheduleInput += '</td></tr>';
			scheduleInput += '<tr><td colspan="2" class="text-center">';
			scheduleInput += '<span class="row">';
			scheduleInput += '<span class="col"><input type="button" value="일정등록" onclick="scheduleUpdateOk('+idx+')" class="btn btn-success form-control"></span>';
			scheduleInput += '<span class="col"><input type="button" value="수정창닫기" onclick="scheduleUpdateClose('+idx+')" class="btn btn-warning form-control"></span>';
			scheduleInput += '</span>';
			scheduleInput += '</td></tr>';
			scheduleInput += '</table>';
			scheduleInput += '</form></div>';
			
			$("#scheduleUpdateOpen"+idx).hide();
			$("#updateDemo"+idx).html(scheduleInput);
			$("#updateDemo"+idx).slideDown(500);
			/* $("#schedule").hide();
			$("#schedule").show(); */
			
		}
  	
  	
 		// 수정창 닫기
    function scheduleUpdateClose(idx) {
    	$("#scheduleUpdateOpen"+idx).show();
    	$("#scheduleUpdateForm"+idx).slideUp(500);
    }
 		
 		// 일정 수정하기
 		function scheduleUpdateOk(idx) {
			let part = $("#part"+idx).val();
			let content = $("#content"+idx).val();
			let query = {
					idx : idx,
					part : part,
					content : content
			}
			
			$.ajax({
				type  : "post",
				url 	: "${ctp}/scUpdateOk.sc",
				data 	: query,
				success: function(res) {
					if(res == "1"){
						alert("수정이 완료되었습니다.");
						location.reload();
					}
					else {
						alert("수정에 실패하였습니다.")
					}
				},
				error : function() {
					alert("전송 오류");
				}
			});
		}
 		
 		// 스케쥴 삭제처리
 		function delCheck(idx) {
			let ans = confirm("일정을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type: "post",
				url: "${ctp}/scheduleDeleteOk.sc",
				data: {idx : idx},
				success: function(res) {
					if(res == "1"){
						alert("일정이 삭제되었습니다.");
						location.reload();
					}
					else {
						alert("삭제처리가 실패하였습니다.");
					}
				},
				erorr: function() {
					alert("전송 오류");
				}
			});
		}
 		
 		// 스케쥴 상세내역을 모달창에 띄우기
 		function modalView(part,content) {
 			$("#myModal").on("show.bs.modal", function(e) {
  			$(".modal-body #part").html(part);
  			$(".modal-body #content").html(content);
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
  <hr/>
  <c:if test="${scheduleCnt != 0}">
  	<table class="table table-hover text-center">
  		<tr class="table-dark text-dark">
  			<th>번호</th>
  			<th>간단 내역</th>
  			<th>분류</th>
  			<th>비고</th>
  		</tr>
  		<c:forEach var="vo" items="${vos}" varStatus="st">
  			<tr>
  				<td>${st.count}</td>
  				<td>
  					<a href="#" onclick="modalView('${vo.part}','${fn:replace(vo.content,newLine,'<br/>')}')" data-toggle="modal" data-target="#myModal">
	  					<c:if test="${fn:indexOf(vo.content,newLine) != -1}">
	  						${fn:substring(vo.content,0,fn:indexOf(vo.content,newLine))}
	  					</c:if>
	  					<c:if test="${fn:indexOf(vo.content,newLine) == -1}">
	  						${fn:substring(vo.content,0,21)}
	  					</c:if>
  					</a>
  				</td>
  				<td>${vo.part}</td>
  				<td>
  					<input type="button" value="수정" onclick="updateCheck('${vo.idx}','${vo.part}','${fn:replace(vo.content,newLine,'<br/>')}')" id="scheduleUpdateOpen${vo.idx}" class="btn btn-warning btn-sm"  />
  					<input type="button" value="삭제" onclick="delCheck(${vo.idx})" class="btn btn-danger btn-sm"  />
  				</td>
  			</tr>
  			<tr><td colspan="4" class="m-0 p-0"><div id="updateDemo${vo.idx}"></div></td></tr>
  		</c:forEach>
  		<tr><td colspan="4" class="m-0 p-0"></td></tr>
  	</table>
  </c:if>
  <!-- The Modal(모달창 클릭시 자료실의 내용을 모달창에 출력한다.) -->
  <div class="modal fade" id="myModal" style="margin-top:250px;">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title"><b>${ymd}</b></h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<table class="table">
        		<tr><th>분류 :</th><td><span id="part"></span></td></tr>
        		<tr><th>내용 :</th><td><span id="content"></span></td></tr>
        		<tr><th>작성자 :</th><td>${sMid}</td></tr>
        	</table>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>