<%@page import="study.j1116h.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	ProductVO vo = (ProductVO)request.getAttribute("vo");
	System.out.println("관리자 페이지 : vo = "+vo);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>product.jsp</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <style>
    body{
      margin: 0 auto;
      padding: 0px;
    }
    /* input 타입 number 화살표 지우기 */
    /* Chrome, Safari, Edge, Opera */
    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
      -webkit-appearance: none;
      margin: 0;
    }
    /* Firefox */
    input[type=number] {
      -moz-appearance: textfield;
    }

    .container{
      width: 600px;
      display: grid;
      grid-template-columns: 200px 1fr 1fr;
    }
    .container .text{
      text-align: center;
      padding-top: 12px;
    }
    .container .input{
      grid-column: 2/4;
    }
    #box .item{
      display: grid;
      grid-template-columns: 100px 1fr;
    }
    #box .item_price{
      display: grid;
      grid-template-columns: 70px 1fr;
    }
    #box .item_count{
      display: grid;
      grid-template-columns: 70px 50px 1fr;
    }
    .typetxt {
      outline: none;
      border: none;
      padding: -5px;
      text-align: center;
    }
  </style>
  <script>
    'use strict';
    let cnt = 1;
    function plus() {
      cnt++;
      let type = $("#product_list").val();
      box.innerHTML +='<div class="item" id="it'+cnt+'"><div style="text-align: center;">상품명<div>(<input type="text" class="typetxt" value='+type+' name="type" size=6>)</div></div><div><input type="text" name="p_name" class="form-control mt-2 mb-2"></div></div>';
      box.innerHTML +='<div class="item_price" id="it_p'+cnt+'"><div class="text">가격</div><div><input type="number" name="p_price" class="form-control mt-2 mb-2"></div></div>';
      box.innerHTML +='<div class="item_count" id="it_c'+cnt+'"><div class="text">수량</div><div><input type="number" name="p_count" class="form-control mt-2 mb-2"></div>'+
                      '<div><input type="button" value="삭제" id="delete_btn1" onclick="del('+cnt+')" class="btn btn-danger mt-2 mb-2" style="float: right;"></div></div>';
    }
    function del(idx) {
      
      console.log(document.getElementsByName("type")[0].innerHTML);
      let it = ["it"+idx,"it_p"+idx,"it_c"+idx];
      for(let i=0; i<it.length; i++){
        document.getElementById(it[i]).remove();
      }
    }
    $(function(){
      $("#p_sign").click(function(){
        if(document.getElementsByName('type').length == 0){
          alert("상품을 추가하시고 구매해주세요!");
          return false;
        }
        for(let i=0; i<document.getElementsByName('type').length; i++){
          let pname = document.getElementsByName('p_name')[i].value;
          let pprice = document.getElementsByName('p_price')[i].value;
          let pcount = document.getElementsByName('p_count')[i].value;
          if(pname.trim() == "" || pprice == "" || pcount == ""){
            alert("입력을 마치고 눌러주세요!");
            return false;
          }
        }
        myform.submit();
      });
    });
  </script>
  
</head>
<body>
<p><br/></p>
<form name="myform" method="post" action="<%=request.getContextPath()%>/main/list">
<div class="container">
  <div class="text">상품분류</div>
  <div class="input">
    <select name="product_list" id="product_list" class="form-control mt-2 mb-2">
      <option value="가전제품">가전제품</option>
      <option value="가구">가구</option>
      <option value="식료품">식료품</option>
      <option value="장식품">장식품</option>
      <option value="공구류">공구류</option>
    </select>
  </div>
  <div style="grid-column: 1/4;">
    <input type="button" value="상품 추가" onclick="plus()"  class="btn btn-success form-control mt-2 mb-2">
  </div>
  <div id="box" style="grid-column: 1/4; display: grid; grid-template-columns: 200px 1fr 1fr;">
    
  </div>
  <div style="grid-column: 1/4;">
    <input type="button" value="상품 등록" id="p_sign" class="btn btn-primary form-control mt-2 mb-2">
  </div>
</div>
</form>
<p><br/></p>
</body>
</html>
<%
  if(vo != null){
		if(vo.getType() != null){
      	out.println("<script>");
      	out.println("let cnt2 = -1;");
      for(int i=0; i<vo.getType().length; i++){
      	out.println("cnt2--;");
      	out.println("box.innerHTML +='<div class=\"item\" id=\"it'+cnt2+'\"><div style=\"text-align: center;\">상품명<div>(<input type=\"text\" class=\"typetxt\" value=\""+vo.getType()[i]+"\" name=\"type\" size=6>)</div></div><div><input type=\"text\" name=\"p_name\" value=\""+vo.getP_name()[i]+"\" class=\"form-control mt-2 mb-2\"></div></div>';");
      	out.println("box.innerHTML +='<div class=\"item_price\" id=\"it_p'+cnt2+'\"><div class=\"text\">가격</div><div><input type=\"number\" name=\"p_price\" value=\""+vo.getP_price()[i]+"\" class=\"form-control mt-2 mb-2\"></div></div>';");
      	out.println("box.innerHTML +='<div class=\"item_count\" id=\"it_c'+cnt2+'\"><div class=\"text\">수량</div><div><input type=\"number\" name=\"p_count\" value=\""+vo.getP_count()[i]+"\" class=\"form-control mt-2 mb-2\"></div>'+");
      	out.println("'<div><input type=\"button\" value=\"삭제\" id=\"delete_btn1\" onclick=\"del('+cnt2+')\" class=\"btn btn-danger mt-2 mb-2\" style=\"float: right;\"></div></div>';");
      }
      	out.println("</script>");
		}
  }
%>