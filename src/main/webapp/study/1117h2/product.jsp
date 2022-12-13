<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="vo" class="study.j1117h2.ProductVO"/>
<jsp:setProperty property="*" name="vo"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>product.jsp</title>
	<jsp:include page="../../include/bs4.jsp"/>
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
      box.innerHTML +='<div class="item" id="it'+cnt+'"><div style="text-align: center;">상품명<div>(<input type="text" class="typetxt" value='+type+' name="type" size=6>)'+
      								'</div></div><div><input type="text" name="p_name" class="form-control mt-2 mb-2"></div></div>';
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
<form name="myform" method="post" action="${pageContext.request.contextPath}/main/list2">
<c:if test="${!empty vo.id}">
	<input type="hidden" name="id" value="${vo.id}"/>
	<div style="margin: 10px; text-align: center;"><h4>${vo.id}님 상품을 추가하거나 삭제해주세요</h4></div>
</c:if>
<hr/>
<div class="container">
  <div class="text">상품분류</div>
  <div class="input">
    <select name="product_list" id="product_list" class="form-control mt-2 mb-2">
      <option value="가전제품">가전제품</option>
      <option value="가구">가구</option>
      <option value="장식품">장식품</option>
      <option value="생활용품">생활용품</option>
      <option value="주방용품">주방용품</option>
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

<c:if test="${!empty vo}">
	<c:if test="${!empty vo.type}">
		<script>
				let cnt2 = -1;
		</script>
			<c:forEach var="vos" items="${vo}">
				<script>
					cnt2--;
					box.innerHTML +='<div class="item" id="it'+cnt+'"><div style="text-align: center;">상품명<div>(<input type="text" class="typetxt" value='${vos.type[status.index]}' name="type" size=6>)'+
													'</div></div><div><input type="text" name="p_name" value='${vos.p_name[status.index]}' class="form-control mt-2 mb-2"></div></div>';
		      box.innerHTML +='<div class="item_price" id="it_p'+cnt+'"><div class="text">가격</div><div><input type="number" name="p_price" value='${vos.p_price[status.index]}' class="form-control mt-2 mb-2"></div></div>';
		      box.innerHTML +='<div class="item_count" id="it_c'+cnt+'"><div class="text">수량</div><div><input type="number" name="p_count" value='${vos.p_count[status.index]}' class="form-control mt-2 mb-2"></div>'+
		                      '<div><input type="button" value="삭제" id="delete_btn1" onclick="del('+cnt+')" class="btn btn-danger mt-2 mb-2" style="float: right;"></div></div>';
				</script>
			</c:forEach>
	</c:if>
</c:if>
