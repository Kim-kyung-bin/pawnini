<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../style/detail.css" />
<link rel="stylesheet" href="../style/main.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#rev_content").keyup(function (e){
    var content = $("#rev_content").val();
    
    $("#counter").html("("+content.length+" / 최대 150자)");    //글자수 실시간 카운팅

    if (content.length > 150){
        alert("최대 150자까지 입력 가능합니다.");
        $(this).val(content.substring(0, 150));
        $('#counter').html("(150 / 최대 150자)");
    }

});
	
	
    var likeval = ${like};

    if(likeval>0){
    	console.log("likeval:" + likeval);
    	$("#thumbs_up").attr("class", "fas fa-thumbs-up");
    	$(".like").prop('name', likeval)
    }else {
    	console.log("likeval:" + likeval);
    	$("#thumbs_up").attr("class", "far fa-thumbs-up");
    	$(".like").prop('name', likeval)
    }
    
   $(".like").on("click", function(){
    	var that = $(".like");
    	var rev_id = $("#rev_id_num").val();
    	alert(rev_id);
    	var sendData = {'rev_id' : rev_id, 'like' : that.prop('name')};
    	$.ajax({
    		url: '/reviewLike.do',
    		type: 'post',
    		data: sendData,
    		success: function(data){
    			that.prop('name', data);
    				if(data==1){
    					$('#thumbs_up').attr("class", "fas fa-thumbs-up");
    					likeCount(rev_id);
    					window.location.reload();
    				}
    				else {
    					$('#thumbs_up').attr("class", "far fa-thumbs-up");
    					likeCount();
    					window.location.reload();
    				} 
    			}
    		})
    	});

    function likeCount() {
    	var that = $(".totalLike");
    	var rev_id = $("#rev_id").val();
    	var sendData = {'rev_id' : rev_id, 'totalLike' : that.prop('name')};
    	$.ajax({
    		url: '/reviewLikeCount.do',
    		type: 'post',
    		data: sendData,
    		success: function(count){
    			$("#totalLike").html(count);
    		},
    		});
    	}

});





//장바구니 추가
	function addToCart() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();

		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};

		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal({
					icon : "success",
					text : "장바구니로 이동하시겠습니까?",
					buttons : [ "예", "아니오" ],
				}).then(function(isConfirm) {
					if (isConfirm) {
						window.location.reload();
					} else {
						window.location.href = "getCartList.do";
						$("#cart_amount").val("1");
					}
				});

			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
					window.location.href = "login.do";
				});
			},
		})
	}
// 바로 구매 시
	function goToPurchase() {
		var product_id = $("#product_id").val();
		var cart_amount = $("#cart_amount").val();

		var data = {
			product_id : product_id,
			cart_amount : cart_amount,
		};

		$.ajax({
			url : "addToCart.do",
			type : "post",
			data : data,
			success : function() {
				swal("", "주문서로 이동합니다.", "info");
				setTimeout('window.location.href = "orderFormView.do"', 1500);
			},
			error : function() {
				swal("", "로그인 후 이용해 주시기 바랍니다.", "warning").then(function() {
				setTimeout('window.location.href = "login.do"',1000);
				});
			},
		});
	}
	
	function insert() {
		window.location.href="go_insertProduct_inq.do";
	}

</script>
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
              <li>재고 : ${product.product_stock }</li>
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
				<input type="hidden" id="product_id" value="${product.product_id}" />
				<select class="option"  id="cart_amount">
					<c:forEach begin="1" end="10" var="i">
						<option class="option" value="${i}">${i}</option>
					</c:forEach>
				</select>

				<button type="button" class="button_two" onclick="addToCart();">장바구니
					담기</button>
				<c:set var="stock" value="${product.product_stock}" />
				<c:if test="${product.product_stock != 0 }">
					<button class="button_one" onclick="goToPurchase();">바로구매</button>
					<button class="button_one" onclick="insert();">상품문의</button>
				</c:if>
				<c:if test="${product.product_stock == 0 }">
					<button class="button_two">품절</button>
				</c:if>
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
   </ul>
  </div>

<!-- REVIEW -->
  
	  <div class="Guide">
	      		<span>상품후기</span>
	    	</div>
	
	<div class="insertForm">
		<form action="insertReview.do" method="post" enctype="multipart/form-data">
		<input type="hidden" id="member_id" name="member_id"  value="${member.member_id}">
		<input type="hidden" name="product_id" value="${product.product_id}" />
		<input type="hidden" id="rev_writer" name="rev_writer"  value="${member.member_nickname}">
		    <div class="writer">
		        <label for="notice_name"><span>작성자</span></label>
		        ${member.member_nickname}<br>
		    </div>
		    <div class="rev_stars">
		    	<label for="rev_stars"><span>평점</span></label>
		     	<select name="rev_stars" id="rev_stars">
						<option value="5">★★★★★</option>
						<option value="4">★★★★</option>
						<option value="3">★★★</option>
						<option value="2">★★</option>
						<option value="1">★</option>
					</select>
		    </div>
			<div class="content">
				<label for="rev_content"><span>내용</span></label>
		        <textarea name="rev_content" id="rev_content" cols="50" rows="5" required></textarea>
		        <span style="color:#aaa;" id="counter">(0 / 최대 200자)</span>
			</div>
			<div class="file">
				<label for="rev_f_img"><span>사진 첨부</span></label>
				<input type="file" id="rev_f_img" name="file" />
			</div>
			<div class="btn">
		        <button type="submit" class="insertRevBtn">등록</button>
			</div>
		</form>
	</div>
	
	<!-- 후기 목록 -->
  	<div id="showReview" class="container">

	<table class="table table-hover">
			<c:forEach items="${review}" var="review" varStatus="status">
			<input id="rev_id_num" type="hidden" value="${review.rev_id}">
				<tr class="product">
					<td>${status.count}
					<td><img class="thu_img" src="${review.rev_thumb_img}" />
					<td>${review.rev_writer}</td>
					<td>${review.rev_stars}</td>
					<td align="left">${review.rev_content}
					<td><fmt:formatDate value="${review.rev_date}" pattern="yyyy-MM-dd" /></td>
					<td>	<div class="form-group">
					<input type="text" id="rev_id${review.rev_id}" name="rev_id" value="${review.rev_id}" data-rev_id="${review.rev_id}" />
							<a class="like" data-rev_id="${review.rev_id}">좋아요
							<i id="thumbs_up" class="far fa-thumbs-up"></i>
							</a>
							<a class="totalLike">
							<span id="totalLike">${review.rev_like_cnt}</span>
							</a>
							</div>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<script src="./time.js"></script>
</body>
<%@ include file="../include/Footer.jsp"%>

</html>
