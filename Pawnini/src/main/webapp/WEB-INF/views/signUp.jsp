<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Sign</title>
    <link rel="stylesheet" href="style/sigUp.css" />
    <link rel="stylesheet" href="style/main.css" />
  </head>

   	<%@ include file="include/Header.jsp" %>
  <body>
    
    <h1>공사중</h1>
    <div class="User">
      <h1 class="User_title">Sign Up</h1>
      <h3 class="User_text">이름*</h3>
      <input class="User_name" type="text" placeholder="User Name" />
      <h3 class="User_text">비밀번호*</h3>
      <input
        class="User_Password"
        type="password"
        placeholder="User password"
      />
      <h3 class="User_text">닉네임*</h3>
      <input class="User_nickname" type="text" placeholder="User Nick Name" />
      <h3 class="User_text">이메일*</h3>
      <input class="User_email" type="email" placeholder="User Email" />
      <h3 class="User_text">전화번호*</h3>
      <input class="User_phone" type="tel" placeholder="User Phone" />
      <h3 class="User_text">카드</h3>
      <input class="User_card_id" type="text" placeholder="User Card" />
      <h3 class="User_text">카드번호</h3>
      <input class="User_card_come" type="text" placeholder="User CardNumber" />
      <h3 class="User_text">우편번호</h3>
      <input class="User_postcode" type="text" placeholder="User PostNumber" />
      <h3 class="User_text">주소*</h3>
      <input class="User_f_addr" type="text" placeholder="User Address" />
      <h3 class="User_text">상세주소*</h3>
      <input
        class="User_s_addr"
        type="text"
        placeholder="User Detail Address"
      />
      <button class="User_Button">Sign Up</button>
    </div>
  </body>
    <%@ include file="include/Footer.jsp" %>
</html>
