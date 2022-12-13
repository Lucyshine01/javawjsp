<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>upLoad3.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
  	'use strict';
  	let cnt = 1;
  	
  	function fileBoxAppend() {
			cnt++;
			let fileBox = "";
  		fileBox += '<div id="fBox'+cnt+'">';
  		fileBox += '<input type="file" name="fName'+cnt+'" id="file'+cnt+'" class="form-control-file border mb-3" style="float:left;width:85%" />';
  		fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger form-control btn-sm ml-2 mb-3" style="float:right;width:10%">';
  		fileBox += '</div>';
  		$("#fileBoxAppend").append(fileBox);
		}
  	
  	function deleteBox(idx) {
			$("#fBox"+idx).remove();
		}
  	
  	function fCheck() {
			let fName = $("#fName").val();
			let ext = fName.substring(fName.lastIndexOf(".")+1).toUpperCase(); // 확장자 발췌
			let maxSize = 1024 * 1024 * 20;
			
			if(fName.trim() == "") {
				alert("업로드할 파일을 선택하세요");
				return false;
			}
			
			// 자바스크립트에서 파일을 체크할땐 항상 배열로 생각하기에 [0]부터 받아줘야함
			let fileLength = document.getElementById("fName").files.length; //선택한 파일의 갯수
			alert("1: "+fileLength);
			let fileLength2 = $("#fName").length; //(X)[Jquery 안됌]선택한 파일의 갯수
			alert("2: "+fileLength2);
			let fileSize = 0;
			for(let i=0; i<fileLength; i++) {
				//fName = $("#fName")[i].
				fName = document.getElementById("fName").files[i].name;
				alert(fName);
				let fName2 = $("#fName").val();
				alert(fName2);
				let ext = fName.substring(fName.lastIndexOf(".")+1);
				ext = ext.toUpperCase();
				if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "TXT" && ext != "HWP" && ext != "PPT" && ext != "PPTX" && ext != "MP3" && ext != "MP4"){
					alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/TXT/HWP/PPT/PPTX/MP3/MP4' 입니다.");
					return;
				}
				// 백에서 response.get
				fileSize += document.getElementById("fName").files[i].size;
			}
			if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 20MByte 입니다.");
			}
			else {
				myform.submit();
			}
			
			/* 
			let fileSize = document.getElementById("file").files[0].size;
			if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "TXT" && ext != "HWP" && ext != "PPT" && ext != "PPTX" && ext != "MP3" && ext != "MP4"){
				alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/TXT/HWP/PPT/PPTX/MP3/MP4' 입니다.");
			}
			else if(fileSize > maxSize) {
				alert("업로드할 파일의 최대용량은 20MByte 입니다.");
			}
			else {
				myform.submit();
			}
			 */
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>파일 업로드 테스트 4(멀티파일처리3)</h2>
  <p>cos라이브러리를 이용한 파일 업로드</p>
  <p><font color="blue">여러개의 파일을 선택할 경우는 'Ctrl+클릭/Shift+클릭' 하세요.</font></p>
  <hr/>
  <form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data">
	  <div>
	  	<input type="file" name="fName" id="fName" class="form-control-file border mb-3" multiple/>
  	</div>
  	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control" />
  	<input type="hidden" name="upLoadFlag" value="4" />
  </form>
  <input type="button" value="다운로드폼으로" onclick="location.href='${ctp}/downLoad.st';" class="btn btn-info form-control mt-3"/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>