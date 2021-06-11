<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../style/Header.css" />
  </head>
  <body>
    <div class="Login">
      <ul class="Login_ul">
        <li><a href="login.do">LOGIN</a></li>
        <li><a href="signUp.do">SignUp</a></li>
        <li><a href="myPage.do">My Pages</a></li>
      </ul>
    </div>
    <header class="Header_menu">
      <div class="Title">
        <h1>
          <a href="main.do"><img src="./images/Rogo.jpg" /></a>
        </h1>
      </div>
      <input class="Header_input" type="text" placeholder="Search..." />
      <ul class="Header_ul">
        <li class="Dog_dropmenu">
          강아지
          <span class="dropmenu">
            <span><a href="dogSnack.do">간식</a></span>
            <span><a href="dogSupplies.do">용품</a></span>
            <span><a href="dogMeal.do">사료</a></span>
          </span>
        </li>
        <li class="Cat_dropmenu">
          고양이
          <span class="dropmenu">
            <span><a href="catSnack.do">간식</a></span>
            <span><a href="catSupplies.do">용품</a></span>
            <span><a href="catMeal.do">사료</a></span>
          </span>
        </li>
        <li><a href="event.do">이벤트</a></li>
        <li><a href="service.do">고객센터</a></li>

        <li class="Dog_dropmenu">
          <a href="adoption.do"> 분양</a>
          <span class="dropmenu">
            <span><a href="adoptionDog.do">Cat</a></span>
            <span><a href="adoptionCat.do">Dog</a></span>
          </span>
        </li>
        <li><a href="notice.do">공지</a></li>
      </ul>
    </header>
  </body>
</html>
