<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>test4.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script></script>
  <style></style>
</head>
<body>
<p><br/></p>
<div class="container">
	<%!	//jsp변수 선언부...
		int i = 0;
		int tot = 0;
	%>
	<h2>1~10까지의 합...</h2>
	<%
		while(i<10) {
			i++;
			tot += i;
			out.println("1 ~ "+i+"까지의 합은 "+tot+"입니다.<br/>");
		}
	%>
</div>
<p><br/></p>
</body>
</html>