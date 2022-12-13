<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>pdsInput.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
	  'use strict';
		let cnt = 1;
		function fileBoxAppend() {
			cnt++;
			let fileBox = "";
			fileBox += '<div id="fBox'+cnt+'">';
			fileBox += '<input type="file" name="fName'+cnt+'" id="fName'+cnt+'" class="form-control-file border mb-3" style="float:left;width:85%" />';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control btn-sm ml-2 mb-3" style="width:10%">';
			fileBox += '</div>';
			$("#fileBoxAppend").append(fileBox);
		}
		
		function deleteBox(idx) {
			$("#fBox"+idx).remove();
		}
		
  	function fCheck() {
			let fName1 = $("#fName1").val();
			let maxSize = 1024 * 1024 * 20;
  		let title = $("#title").val();
			let pwd = $("#pwd").val();
  		
			if(fName1.trim() == "") {
				alert("업로드할 파일명을 선택해 주세요.");
				return false;
			}
			else if(title.trim() == "") {
				alert("업로드할 파일명을 입력해 주세요.");
				return false;
			}
			else if(pwd.trim() == "") {
				alert("비밀번호를 입력해 주세요.");
				return false;
			}
			
			// 파일 사이즈 처리...
			let fileSize = 0;
			for(let i=1; i<=cnt; i++){
				let imsiName = 'fName'+i;
				if(isNaN(document.getElementById(imsiName))){
					let fName = document.getElementById(imsiName).value;
					if(fName != "") {
						fileSize += document.getElementById(imsiName).files[0].size;
						let uExt = fName.substring(fName.lastIndexOf(".")+1).toUpperCase();
						if(uExt != "JPG" && uExt != "PNG" && uExt != "GIF" && uExt != "MP4" && uExt != "MP3" && uExt != "ZIP" && uExt != "TXT" && uExt != "HWP" && uExt != "PPT" && uExt != "PPTX"){
							alert("업로드 가능한 파일은 'JPG/PNG/GIF/MP4/MP3/TXT/ZIP/PPT/PPTX' 입니다");
							return false;
						}
					}
					else {
							alert("빈 파일박스에 파일을 선택해 주세요.");
							return false;
					}
				}
			}
			if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 20MByte 입니다.");
				return false;
			}
			else {
				myform.fileSize.value = fileSize;
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
	<form name="myform" method="post" action="${ctp}/pdsInputOk.pds" enctype="multipart/form-data">
	  <h2 class="text-center">자 료 올 리 기</h2>
	  <br/>
	  <div>
	  	<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2" />
	  	파일명 : 
	  	<input type="file" name="fName1" id="fName1" class="form-control-file border mb-3" />
		</div>
		<div><div id="fileBoxAppend" class="mb-2"></div></div>
		<div class="mb-2">업로더 : ${sNickName}</div>
		<div class="mb-2">
			제목 : 
			<input type="text" name="title" id="title" placeholder="자료 제목을 입력하세요" class="form-control" required>
		</div>
		<div class="mb-2">
			상세 내용 : 
			<textarea rows="4" name="content" id="content" class="form=control"></textarea>
		</div>
		<div class="mb-2">
			분류 : 
			<select name="part" id="part" class="form-control">
				<option ${part == '학습' ? 'selected' : ''} value="학습">학습</option>
				<option ${part == '여행' ? 'selected' : ''} value="여행">여행</option>
				<option ${part == '음식' ? 'selected' : ''} value="음식">음식</option>
				<option ${part == '기타' ? 'selected' : ''} value="기타">기타</option>
			</select>
		</div>
		<div class="mb-2">
			공개여부 : 
			<input type="radio" name="openSw" value="공개" checked /> 공개 &nbsp;&nbsp;
			<input type="radio" name="openSw" value="비공개" /> 비공개 
		</div>
		<div class="mb-2">
			비밀번호 : 
			<input type="password" name="pwd" id="pwd" placeholder="비밀번호를 입력하세요." required/>
		</div>
		<div>
			<input type="button" value="자료올리기" onclick="fCheck()" class="btn btn-success"/> &nbsp;
			<input type="reset" value="다시쓰기" class="btn btn-warning"/> &nbsp;
			<input type="button" value="돌아가기" onclick="location.href='${ctp}/pdsList.pds?part=${part}'" class="btn btn-primary" />
		</div>
		<input type="hidden" name="listPart" value="${part}"/>
		<input type="hidden" name="fileSize" />
		<input type="hidden" name="hostIp" value="${pageContext.request.remoteAddr}" />
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>