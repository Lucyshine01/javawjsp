<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/368f95b037.js" crossorigin="anonymous"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="프론트연습2.css">
  <title>프론트 연습2</title>
  <script>
    'use strict';
    
    $(function(){
      
      $("#clipTab_menu .clipTab_menuitem").click(function(){
        $(this).addClass("clipTab_menuitem_click");
        $("#clipTab_menu .clipTab_menuitem").not(this).removeClass("clipTab_menuitem_click");
        for(let i=1;i<=10; i++){
          let clipnum = "#mitem" + i;
          if($(this).is(clipnum)){
            $("#citem"+i).show();
          }
          else{
            $("#citem"+i).hide();
          }
        }
      });
      
      let menuSW = 0;
      $("#all-cat .nav-borline").click(function(){
        if(parseInt(menuSW)==0){
          $("#all-cat i").addClass("fa-xmark");
          $(".nav-item ul").slideDown(120);
          /* $(".nav-item ul .ul-bg").slideUp(120); */
          $("#all-cat #all-bg").slideDown(120);
          menuSW = 1;
        }
        else{
          $("#all-cat i").removeClass("fa-xmark");
          $(".nav-item ul").slideUp(120);
          $("#all-cat #all-bg").slideUp(120);
          menuSW = 0;
        }
      });
      $(".nav-main").click(function(){
        if(parseInt(menuSW)==0){
          $(this).next().slideToggle(120);
          $(".nav-main").not(this).next().slideUp(120);
        }
      });
      $(".nav-item ul").mouseleave(function(){
        if(parseInt(menuSW)==0){
          $(".nav-main").next().slideUp(120);
        }
      });

    });
  </script>
</head>
<body>
  <div id="header" class="width">
    <div><a href="#"><img src="../../images/sample-logo.png" alt="logo" id="logo"></a></div>
    <div></div>
    <div id="head-loginimg" class="row">
      <div class="col">
        <a href="#">
          <i class="fa-solid fa-star"></i>
          <br/>즐겨찾기
        </a>
      </div>
      <div class="col">
        <a href="2022-11-13 과제.jsp">
          <i class="fa-solid fa-pen-to-square"></i>
          <br/>회원가입
        </a>
      </div>
      <div class="col">
        <a href="#">
          <i class="fa-solid fa-circle-user"></i>
          <br/>로그인
        </a>
      </div>
    </div>
  </div>
  <div id="nav-box">
    <div id="nav" class="width d-flex flex-row">
      <div id="all-cat" class="nav-item">
        <div class="nav-borline">
          <i class="fa-solid fa-bars" style="font-size: 1.2em; margin-right: 5px;"></i> 전체 카테고리
        </div>
        <div id="all-bg"></div>
      </div>
      <div class="nav-item">
        <div class="nav-borline nav-main">1번 주메뉴</div>
        <ul>
          <li class="ul-bg"></li>
          <li class="ul-mt20"></li>
          <li>1-1번 부메뉴</li><hr/>
          <li>1-2번 부메뉴</li><hr/>
          <li>1-3번 부메뉴</li><hr/>
          <li>1-4번 부메뉴</li><hr/>
          <li>1-5번 부메뉴</li><hr/>
        </ul>
      </div>
      <div class="nav-item">
        <div class="nav-borline nav-main">2번 주메뉴</div>
        <ul>
          <li class="ul-bg"></li>
          <li class="ul-mt20"></li>
          <li>2-1번 부메뉴</li><hr/>
          <li>2-2번 부메뉴</li><hr/>
          <li>2-3번 부메뉴</li><hr/>
          <li>2-4번 부메뉴</li><hr/>
          <li>2-5번 부메뉴</li><hr/>
        </ul>
      </div>
      <div class="nav-item">
        <div class="nav-borline nav-main">3번 주메뉴</div>
        <ul>
          <li class="ul-bg"></li>
          <li class="ul-mt20"></li>
          <li>3-1번 부메뉴</li><hr/>
          <li>3-2번 부메뉴</li><hr/>
          <li>3-3번 부메뉴</li><hr/>
          <li>3-4번 부메뉴</li><hr/>
          <li>3-5번 부메뉴</li><hr/>
        </ul>
      </div>
      <div class="nav-item">
        <div class="nav-borline nav-main">4번 주메뉴</div>
        <ul>
          <li class="ul-bg"></li>
          <li class="ul-mt20"></li>
          <li>4-1번 부메뉴</li><hr/>
          <li>4-2번 부메뉴</li><hr/>
          <li>4-3번 부메뉴</li><hr/>
          <li>4-4번 부메뉴</li><hr/>
          <li>4-5번 부메뉴</li><hr/>
        </ul>
      </div>
      <div class="nav-item ml-auto" id="nav-right">
        <div style="border-left: 1px solid #ddd;">
          검색어순위 및 이미지
        </div>
      </div>
    </div>
    <hr/>
  </div>
  <div id="body" class="width">
    <div id="clipTab">
      <div id="clipTab_menu" class="d-flex flex-column">
        <div class="clipTab_menuitem flex-fill" id="mitem1">클립탭 1번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem2">클립탭 2번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem3">클립탭 3번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem4">클립탭 4번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem5">클립탭 5번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem6">클립탭 6번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem7">클립탭 7번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem8">클립탭 8번메뉴</div>
        <div class="clipTab_menuitem flex-fill" id="mitem9">클립탭 9번메뉴</div>
      </div>
      <div id="clipTab_content">
        <div class="clipTab_contitem" id="citem1">클립탭 1번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem2">클립탭 2번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem3">클립탭 3번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem4">클립탭 4번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem5">클립탭 5번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem6">클립탭 6번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem7">클립탭 7번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem8">클립탭 8번 컨텐츠</div>
        <div class="clipTab_contitem" id="citem9">클립탭 9번 컨텐츠</div>
      </div>
    </div>
  </div>
</body>
</html>