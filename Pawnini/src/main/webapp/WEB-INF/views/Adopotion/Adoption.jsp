<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
  <style type="text/css">
  	.img{
		width:300px;
  		
  		height: 300px;
  		box-shadow: 3px 3px 2px 2px rgba(0, 0, 0, 0.5);
  	}
  	.text{
  	display: flex;
  	justify-content: center;
  	align-items: center;
  	font-size: 20px;
  	font-weight: 600;
  	border-top: 1px solid rgba(0,0,0,0.3);
  	padding-top: 30px;
  	}
  </style>
  
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/Adoption.css" />
    <title>Snack</title>
  </head>
   <%@ include file="../include/Header.jsp" %> 
  <body>
    <h1 class="bener_text">They are waiting for their owners.</h1>
    <section>
      <div class="sa sa-scaleDown">
        <ul class="bener_ul">
          <c:forEach items="${pawsList}" var="paws">
          <li><img src="${paws.paws_thumb_img}" class="img"><br><a href="getPaws.do?paws_id=${paws.paws_id}"><span class="text">${paws.paws_name}</span></a></li>
          </c:forEach>
        </ul>
        <a href="PawsList.do">관리</a>
      </div>
    </section>
   
   
    <%@ include file="../include/Footer.jsp" %>
   
    <script>
      // Scroll Animation (sa, 스크롤 애니메이션)
      const saTriggerMargin = 300;
      const saElementList = document.querySelectorAll(".sa");

      const saFunc = function () {
        for (const element of saElementList) {
          if (!element.classList.contains("show")) {
            if (
              window.innerHeight >
              element.getBoundingClientRect().top + saTriggerMargin
            ) {
              element.classList.add("show");
            }
          }
        }
      };

      window.addEventListener("load", saFunc);
      window.addEventListener("scroll", saFunc);
    </script>
  </body>
</html>
