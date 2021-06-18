<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="../style/main.css" />
    <link rel="stylesheet" href="../style/product.css" />
    <title>meal</title>
  </head>
  <%@ include file="../include/Header.jsp" %>
  <body>

    <h1>Meal Dog</h1>
    <div class="Table">
      <ul>
        <li class="Table_LI">
        
          <span class="Table_Span"><!-- <a href="goProductList.do?searchOption=dog&searchKeyword=meal&searchKeyword2=테스트">테스트</a> --> 임시 페쇄</span> 
        </li>
      </ul>
    </div>
    <div class="product">
      <ul class="product_ul">
    <c:forEach items="${productList}" var="product">
        <li class="product_li">
          <a href="detailProduct.do?product_id=${product.product_id}">
            <img class="product_img" src="${product.product_thumb_img}" />
             <ul class="product_list">
              <li class="product_title">${product.product_name}</li>
              <li class="product_cash">${product.product_price}</li>
              <li class="product_rank">❤❤❤❤🤍</li>
            </ul>
          </a>
        </li>
    </c:forEach>
      </ul>
    </div>

   <%@ include file="../include/Footer.jsp" %>

  </body>
</html>
