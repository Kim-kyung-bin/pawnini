<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="insert_product">
		<table border="1">
			<tr>
				<td>1차 분류 : 
					<select id="product_f_code">
						<option value="DOG">강아지</option>
						<option value="CAT">고양이</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>2차 분류 : 
					<select id="product_s_code">
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">용품</option> 
					</select>
				</td>
			</tr>
			<tr>
				<td>3차분류 : 
					<input type="text" id="product_t_code">
				</td>
			</tr>
			<tr>
				<td>브랜드 :
					<input type="text" id="product_brand">
				</td>
			</tr>
			<tr>
				<td>상품명 :
					<input type="text" id="product_name">
				</td>
			</tr>
			<tr>
				<td>상품 옵션 :
					<input type="text" id="product_option">
				</td>
			</tr>
			<tr>
				<td>상품 이미지:
					<input type="file" id="prodcut_img">
				</td>
			</tr>
			<tr>
				<td>상품 설명 :
					<textarea rows="10" cols="40" id="product_desc"></textarea>
				</td>
			</tr>
			<tr>
				<td>상품 제고 :
					<input type="text" id="product_stock">
				</td>
			</tr>
			<tr>
				<td>상품 가격 :
					<input type="text" id="product_price">
				</td>
			</tr>
			<tr>
				<td>상품 원가 :
					<input type="text" id="product_c_price">
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" onclick="insertProduct()" value="등록하기">
				</td>
			</tr>		
		</table>
	</div>
</body>

<script type="text/javascript">

	function insertProduct() {
		
	}

</script>

</html>
















