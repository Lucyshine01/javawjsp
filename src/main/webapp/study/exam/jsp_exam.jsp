<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <title>exam</title>
  <style>
    body {
      margin: 0px;
      padding: 0px;
    }

    #fullform{
      margin: 0 auto;
      width: 1000px;
    }
    #fullform fieldset{
      margin-top: 100px;
      border: 1px solid #999;
      border-radius: 5px;
      font-size: 1.1em;
    }
    #fullform fieldset div{
      margin: 0 auto;
      width: 500px;
    }
    #fullform fieldset input[type="text"],
    #fullform fieldset input[type="email"],
    #fullform fieldset input[type="button"]{
      float: right;
      width: 300px;
    }
  </style>
  <script>

    $(function(){
      $('.form-inline input[type="button"]').click(function(){
		    let regId = /[^a-zA-Z0-9_]/g;   //아이디는 영문소문자,대문자,숫자,밑줄만 사용가능
		    let regPwd = /[^a-zA-Z0-9!@#$%^&+=<>?,\./\*()_-]/g;  //비밀번호는 영문대,소문자,숫자,특수문자 사용가능
		    let regName = /[^가-힣a-zA-Z]{2,20}/g;  //성명은 한글/영문만 가능하도록 길이는 2~20자까지
		    let regEmail = /([^a-zA-Z0-9_]{2,20})@([^a-zA-Z]{2,20})\.([^a-zA-Z]{2,3})/g; //이메일 형식에 맞도록 체크(a@b.c)
        let id = $("#id").val();
        let pwd = $("#pwd").val();
        let name = $("#name").val();
        let gender = $("#gender").val();
        let email = $("#email").val();
        if(id == "" || pwd == "" || name == "" || gender == "" || email == ""){
          alert("모든입력을 마치고 눌러주세요!");
          return 0;
        }
        if(regId.test(id)){
          alert("아이디 양식이 불일치합니다!");
          document.getElementById("id").focus();
          return false;
        }
        else if(regPwd.test(pwd)){
          alert("비밀번호 양식이 불일치합니다!");
          document.getElementById("pwd").focus();
          return false;
        }
        else if(regName.test(name)){
          alert("성명 양식이 불일치합니다!");
          document.getElementById("name").focus();
          return false;
        }
        else if(regEmail.test(email)){
          alert("이메일 양식이 불일치합니다!");
          document.getElementById("mail").focus();
          return false;
        }
        else {
        	
          alert("가입완료!");
          myform.submit();
        }
      });
       
    });
  </script>
</head>
<body>
  <div id="fullform">
    <fieldset>
      <h2 style="text-align: center;">회원가입</h2>
      <p><br/></p>
      <form name="myform" class="form-inline" method="post" action="jsp_home.jsp">
        <div>
          아이디:
          <input type="text" name="id" id="id" placeholder="아이디 입력" class="form-control mt-1 mb-2">
        </div>
        <div>
          비밀번호:
          <input type="text" name="pwd" id="pwd" placeholder="비밀번호 입력" class="form-control mt-1 mb-2">
        </div>
        <div>
          성명:
          <input type="text" name="name" id="name" placeholder="성명 입력" class="form-control mt-1 mb-2">
        </div>
        <div>
          성별: &nbsp;
          <input type="radio" name="gender" id="gender" value="남자" class="mt-1 mb-2" checked style="margin-left: 150px;"> 남자 &nbsp;
          <input type="radio" name="gender" id="gender" value="여자" class="mt-1 mb-2"> 여자
        </div>
        <div>
          <br/>이메일: <input type="email" class="form-control mt-1 mb-2" id="email" name="email" placeholder="이메일 입력" >
        </div>
        <div>
          <input type="button" value="회원가입" class="btn btn-success mt-1 mb-2">
        </div>
      </form>
    </fieldset>
  </div>
</body>
</html>