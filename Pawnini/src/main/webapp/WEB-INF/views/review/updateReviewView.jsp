<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getReview</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<div>
	<section id="container">
		<form action="updateReview.do" method="post">
		<input name="rev_id" type="hidden" value="${update.rev_id}">
			<div class="form-group">
				<label for="rev_writer" class="col-sm-2 control-label">글쓴이</label>
				<input type="text" name="rev_writer" class="form-control" value="${update.rev_writer}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_title" class="col-sm-2 control-label">제목</label>
				<input type="text" name="rev_title" class="form-control" value="${update.rev_title}">
			</div>
			<div class="form-group">
				<label for="rev_f_category" class="col-sm-2 control-label">애완동물 크기</label>
				<select name="rev_f_category">
						<option value="XS">XS</option>
						<option value="S">S</option>
						<option value="M">M</option>
						<option value="L">L</option>
						<option value="XL">XL</option>
				</select>
			</div>
			<div class="form-group">
				<label for="rev_content" class="col-sm-2 control-label">내용</label>
				<textarea name="rev_content" rows="10" cols="40" class="form-control">${update.rev_content}</textarea>
			</div>
			<div class="form-group">
				<label for="rev_stars" class="col-sm-2 control-label">평점</label>
				<input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력" value="${update.rev_stars}">
			</div>
			<div class="form-group">
				<label for="rev_show" class="col-sm-2 control-label">공개</label>
				<select name="rev_show">
                  		<option value="Y">Y</option>
                    	<option value="N">N</option>
                </select>
			</div>
			<div class="form-group">
				<label for="member_id" class="col-sm-2 control-label">내용</label>
				<input type="text" name="member_id" value="${update.member_id}" readonly>
			</div>
			<div class="form-group">
				<label for="product_id" class="col-sm-2 control-label">내용</label>
				<input type="text" name="product_id" value="${update.product_id}" readonly>
			</div>
					
			<div>
				<input type="submit" class="form-control" value="수정">
			</div>
			</form>
		<a href="deleteReview.do?rev_id=${update.rev_id}">삭제</a>
		<a href="getReviewList.do">목록</a>
	
	
	</section>
	<hr>
</div>
</body>
</html>