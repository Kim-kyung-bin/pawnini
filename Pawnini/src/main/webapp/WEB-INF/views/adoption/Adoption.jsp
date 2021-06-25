<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="../style/adoption_pags.css" />

<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="../style/Adoption.css" />
<title>Snack</title>
</head>

<%@ include file="../include/Header.jsp"%>

<body>
	<div class="Guide">
		<span>분양</span>
	</div>

	<div class="title_product"></div>

	<div class="Kategorie"></div>
	<div class="grid">
		<ul class="product">
			<c:forEach items="${pawsList}" var="paws">
				<li><img src="${paws.paws_thumb_img}" class="img"><br>
					<a href="getPaws.do?paws_id=${paws.paws_id}"> <span
						class="text"></span></a>
					<h3>${paws.paws_name}</h3>	
						<p>${paws.paws_age}</p>
				<p>${paws.paws_sex}</p>
						</li>
			
			</c:forEach>

		</ul>

	</div>



	<div class="Bouns">
		<ul class="Bouns_ul">
			<li>
				<h3>
					<i class="fas fa-drumstick-bite lg"></i>신선한 사료
				</h3>
			</li>
			<li>
				<h3>
					<i class="far fa-clock"></i>유통기한 100% 책임제
				</h3>

			</li>
			<li>
				<h3>
					<i class="fas fa-shipping-fast"></i>신속! 정확! 배송!
				</h3>
			</li>
			<li>
				<h3>
					<i class="fas fa-rss"></i>만원 이상 구매시 무료배송
				</h3>
			</li>
	</div>


	<%@ include file="../include/Footer.jsp"%>


</body>

</html>
