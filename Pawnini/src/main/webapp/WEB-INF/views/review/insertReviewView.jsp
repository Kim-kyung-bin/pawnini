<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-1.10.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>InsertReviewView</title>
</head>
<body>
	<div>
		<form action="insertReview.do" method="post">
			<table border="1">
				<tr>
					<td>글쓴이
					<input type="text" name="rev_writer">
				<tr>
					<td>제목
					<input type="text" name="rev_title">
				<tr>
					<td>애완동물 크기
					<select name="rev_f_category">
						<option value="XS">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
					</select>
				<tr>
					<td>내용
					<textarea name="rev_content" rows="10" cols="40"></textarea>
				<tr>
					<td>평점<input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력">
				<tr>
					<td>공개 여부
					<select name="rev_show">
                  		<option value="Y">공개</option>
                    	<option value="N">비공개</option>
                    </select>
				<tr>
					<td>회원ID<input type="text" name="member_id">
				<tr>
					<td>상품코드<input type="text" name="product_id">
				<tr>
					<td><input type="submit" value="등록">
			</table>
		</form>
		<a href="getReviewList.do">목록</a>
	</div>
</body>
</html>