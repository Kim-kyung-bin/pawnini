<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="js/signup.js" charset="UTF-8"></script>
	<script src="http://code.jquery.com/jquery-1.10.1.js"></script>   
	<title>Sign</title>
    <link rel="stylesheet" href="style/sigUp.css" />
    <link rel="stylesheet" href="style/main.css" />
  </head>

   	<%@ include file="include/Header.jsp" %>
  <body>
    
    <h1>공사중</h1>
    <div class="User">
    <form action="insertMember.do" method="post">
      <h1 class="User_title">Sign Up</h1>
      <h3 class="User_text">아이디*</h3>
      <input class="User_id" type="text" name="member_id" placeholder="User id"/>
      <input type="button" onClick="idChk()" style="cursor: pointer" value="중복확인" />
      <label id="idchk"></label>
      <h3 class="User_text">비밀번호*</h3>
      <input class="User_Password" type="password" name="member_pwd" placeholder="User password"/>
      <h3 class="User_text">이름*</h3>
      <input class="User_name" type="text" name="member_name" placeholder="User Name" />
      <h3 class="User_text">닉네임*</h3>
      <input class="User_nickname" type="text" name="member_nickname" placeholder="User Nick Name" />
      <h3 class="User_text">이메일*</h3>
      <input class="User_email" type="email" name="member_email" placeholder="User Email" />
      <h3 class="User_text">전화번호*</h3>
      <input class="User_phone" type="tel" name="member_phone" placeholder="User Phone" />
      <h3 class="User_text">우편번호</h3>
      <input class="User_postcode" type="text" name="member_postcode" placeholder="User PostNumber" />
      <h3 class="User_text">주소*</h3>
      <input class="User_f_addr" type="text" name="member_f_addr" placeholder="User Address" />
      <h3 class="User_text">상세주소*</h3>
      <input class="User_s_addr" type="text" name="member_s_addr" placeholder="User Detail Address"/>
      <input class="User_Button" type="submit" value="SignUp">
    </form>
    </div>
  </body>
    <%@ include file="include/Footer.jsp" %>
    
    

</html>
