<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../style/detail.css" />
<link rel="stylesheet" href="../style/main.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<%@ include file="../include/Header.jsp"%>
<body>
   <div class="Guide">
      <span>상품설명</span>
    </div>

    <div class="grid">
      <div class="product_image"><img class="img_main" src="${product.product_img }"></div>
<div class="box">
			<ul class="product_dis">
				<li>${product.product_brand}</li>
				<li>${product.product_name}</li>
				<li>❤❤❤❤</li>
				<c:set var="c_price" value="${product.product_c_price}"/>
				<c:set var="price" value="${product.product_price}"/>
				<script type="text/javascript">
				 	var c_price = '<c:out value = "${product.product_price}"/>' * 1.1;
				 	var price = '<c:out value = "${product.product_price}"/>'
				 	var sale = c_price - price;
				 	$(document).ready(
				 			function() {
				 				$("#c_price").text(Math.floor(c_price)+"원");
								$("#salePrice").text(Math.floor(sale)+"원");
							});
				</script>
				<li>정가<span id="c_price">원</span></li>
				<li>판매가<span>${product.product_price} 원</span></li>
				
				<li>할인된 가격<span id="salePrice"></span></li>
			</ul>
        <div class="product_stock">
          <div class="stpck_one">
            <ul>
              <li>재고잇음</li>
              <li>❤</li>
            </ul>
          </div>

          <div>
            <ul>
              <li>무료배송</li>
              <li>😘</li>
            </ul>
          </div>
          <div>
            <ul>
              <li>신속배송</li>
              <li>🎁</li>
            </ul>
          </div>
        </div>
        <div class="button">
          <button class="button_one">장바구니 담기</button>
          <button class="button_two">바로구매</button>
        </div>
      </div>
    </div>
    
    <div class="product_Information"><h1>상품 상세 정보</h1></div>
    <div class="pawnini">
      <img src="../images/Rogo.jpg"/>
    </div>
    <div class="bener">
      <div class="product_bener">
      </div>
    
    </div>
    

    <!-- 상품 설명 상품 제목 -->
    <h1 class="product_title">${product.product_name }</h1>
<div class="product_img">
<img  src="${product.product_img }"/>
</div>
    <!-- 상품 사진 -->
    <div align="center">
      <h1 class="Product_dis">Q&A</h1>
      <img src="../images/asdasd.png">
      <div class="product_image_des"></div>
    </div>


<div class="Bouns">
    <ul class="Bouns_ul">
      <li>
        <h3> <i class="fas fa-drumstick-bite lg"></i>신선한 사료</h3>
      </li>
      <li>
        <h3><i class="far fa-clock"></i>유통기한 100% 책임제</h3>
     
      </li>
      <li>
        <h3><i class="fas fa-shipping-fast"></i>신속! 정확! 배송!</h3>
      </li>
      <li>
        <h3><i class="fas fa-rss"></i>만원 이상 구매시 무료배송</h3>
      </li>
   
  </div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script src="./time.js"></script>
</body>
<%@ include file="../include/Footer.jsp"%>

</html>
