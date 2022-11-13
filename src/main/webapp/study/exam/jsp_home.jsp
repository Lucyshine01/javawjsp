<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>jsp_home</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script></script>
  <style></style>
  <%
  request.setCharacterEncoding("utf-8");
  String id =request.getParameter("id");
  String pwd= request.getParameter("pwd");
  String name=request.getParameter("name");
  String gender = request.getParameter("gender");
  
  String email = request.getParameter("email");
  %>
</head>
<body>
<p><br/></p>
<div class="container">
  <div class="table-responsive-sm">
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>아이디</th><th>비밀번호</th><th>이름</th><th>성별</th><th>이메일</th>
          </tr>
        </thead>
        <tr>
          <td><%=id %></td>
          <td><%=pwd %></td>
          <td><%=name %></td>
          <td><%=gender %></td>
          <td><%=email %></td>
        </tr>
    	</table>
</div>
<p><br/></p>
</body>
</html>