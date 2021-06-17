<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="update_product">
		<form action="updateProduct.do" method="post">
		<input type="hidden" name="product_id" value="${product.product_id}">
		<table border="1">
			<tr>
				<td>1차 분류 : 
					<select name="product_f_code">
						<option value="DOG">강아지</option>
						<option value="CAT">고양이</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>2차 분류 : 
					<select name="product_s_code">
						<option value="MEAL">사료</option> 
						<option value="SNACK">간식</option> 
						<option value="SUPPLIES">용품</option> 
					</select>
				</td>
			</tr>
			<tr>
				<td>3-1차분류 : 
					<input type="text" name="product_t_code" value="${product.product_t_code}">
				</td>
			</tr>
			<tr>
				<td>3-2차분류 : 
					<input type="text" name="product_t_code2" value="${product.product_t_code2}">
				</td>
			</tr>
			<tr>
				<td>브랜드 :
					<input type="text" name="product_brand" value="${product.product_brand}">
				</td>
			</tr>
			<tr>
				<td>상품명 :
					<input type="text" name="product_name" value="${product.product_name}">
				</td>
			</tr>
			<tr>
				<td>상품 옵션 :
					<input type="text" name="product_option" value="${product.product_option }">
				</td>
			</tr>
			<tr>
				<td>상품 설명 :
					<textarea rows="10" cols="40" name="product_desc">${product.product_desc}</textarea>
				</td>
			</tr>
			<tr>
				<td>상품 재고 :
					<input type="text" name="product_stock" value="${product.product_stock}">
				</td>
			</tr>
			<tr>
				<td>상품 가격 :
					<input type="text" name="product_price" value="${product.product_price}">
				</td>
			</tr>
			<tr>
				<td>상품 원가 :
					<input type="text" name="product_c_price" value="${product.product_c_price}">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="수정하기">
				</td>
			</tr>	
		</table>
		</form>

		
		

	</div>
</body>


</html>
















