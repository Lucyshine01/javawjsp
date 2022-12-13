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
			let maxSize = 1024 * 1024 * 10; // 업로드 가능한 최대파일의 용량은 10MByte로 한다.
  		for (let i = 1; i <= cnt; i++) {
				let fName = $("#file"+i).val();
				$("#fileBoxAppend").append(fName);
				let ext = fName.substring(fName1.lastIndexOf(".")+1).toUpperCase();
				let fileSize = $("#file"+i).files[0].size;
				if(ext != "JPG" && ext != "GIF" && ext != "PNG" && ext != "ZIP" && ext != "TXT" && ext != "HWP" && ext != "PPT" && ext != "PPTX" && ext != "MP3" && ext != "MP4"){
					alert("업로드 가능한 파일은 'JPG/GIF/PNG/ZIP/TXT/HWP/PPT/PPTX/MP3/MP4' 입니다.\n"+i+"번째 파일의 확장자가 잘못되었습니다.");
					return;
				}
				else if(fileSize > maxSize) {
					alert("업로드할 파일의 최대용량은 10MByte 입니다.");
					return;
				}
			}
  		myform.submit();
			return;
		}
  </script>
  <style></style>
</head>
<body>
<jsp:include page="/include/header.jsp"/>
<p><br/></p>
<div class="container">
  <h2>파일 업로드 테스트 3(동적폼 파일처리)</h2>
  <p>cos라이브러리를 이용한 파일 업로드</p>
  <hr/>
  <form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data">
	  <div>
	  	<input type="button" value="파일박스추가" onclick="fileBoxAppend()" class="btn btn-info btn-sm mb-2" />
	  	파일명 : 
	  	<input type="file" name="fName1" id="file1" class="form-control-file border mb-3" />
  	</div>
  	<div id="fileBoxAppend"></div>
  	<input type="button" value="전송" onclick="fCheck()" class="btn btn-primary form-control" />
  	<input type="hidden" name="upLoadFlag" value="3" />
  </form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"/>
</body>
</html>