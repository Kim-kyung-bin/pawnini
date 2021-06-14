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
<style type="text/css">
	li {
		padding: 12px;
	}
	section {
		margin-top: 20px;
	}
</style>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$(".reviewReplyUpdateBtn").on("click", function(){
			location.href = "updateReviewReplyView.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
		});
		
		$(".reviewReplyDeleteBtn").on("click", function(){
			location.href = "deleteReviewReply.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
		});
	});
</script>
</head>
<body>
	<div class="container">
	<section id="container">
		<div>
		<input name="rev_id" type="hidden" value="${review.rev_id}">
			<div class="form-group">
				<label for="rev_writer" class="col-sm-2 control-label">글쓴이</label>
				<input type="text" name="rev_writer" class="form-control" value="${review.rev_writer}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_title" class="col-sm-2 control-label">제목</label>
				<input type="text" name="rev_title" class="form-control" value="${review.rev_title}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_f_category" class="col-sm-2 control-label">애완동물 크기</label>
				<input type="text" name="rev_f_category" value="${review.rev_f_category}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_content" class="col-sm-2 control-label">내용</label>
				<textarea name="rev_content" rows="10" cols="40" class="form-control" readonly>${review.rev_content}</textarea>
			</div>
			<div class="form-group">
				<label for="rev_stars" class="col-sm-2 control-label">평점</label>
				<input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력" value="${review.rev_stars}" readonly>
			</div>
			<div class="form-group">
				<label for="rev_show" class="col-sm-2 control-label">공개</label>
				<input type="text" name="rev_show" value="${review.rev_show}" readonly>
			</div>
			<div class="form-group">
				<label for="member_id" class="col-sm-2 control-label">내용</label>
				<input type="text" name="member_id" value="${review.member_id}" readonly>
			</div>
			<div class="form-group">
				<label for="product_id" class="col-sm-2 control-label">내용</label>
				<input type="text" name="product_id" value="${review.product_id}" readonly>
			</div>
				<a href="getReviewList.do">목록</a>
				<a href="updateReviewView.do?rev_id=${review.rev_id}">수정/삭제</a>
			</div>
	
	
	<!-- 후기 댓글 -->
	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${reviewReplyList}" var="replyList">
				<li>
					<p>
						글쓴이: ${replyList.rev_com_writer} <br>
						작성일: <fmt:formatDate value="${replyList.rev_com_moddate}" pattern="yyyy-MM-dd" />
					</p>
					<p>${replyList.rev_com_content}</p>
					<div>
						<button type="button" class="reviewReplyUpdateBtn btn btn-warning" data-rno="${replyList.rev_com_id}">수정</button>
						<button type="button" class="reviewReplyDeleteBtn btn btn-danger" data-rno="${replyList.rev_com_id}">삭제</button>
					</div>
				</li>
			</c:forEach>
		</ol>
	</div>
	
	<!-- 후기 댓글 작성 -->
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<form name="reviewReplyForm" class="form-horizontal" method="post" action="${contextPath}/insertReviewReply.do">
		<input type="hidden" id="rev_id" name="rev_id" value="${review.rev_id}">
		
		<div class="form-group">
			<label for="rev_com_writer" class="col-sm-2 control-label">댓글 글쓴이</label>
			<div class="col-sm-10">
				<input type="text" id="rev_com_writer" name="rev_com_writer" />
			</div>
		</div>
		
		<div class="form-group">
			<label for="rev_com_content" class="col-sm-2 control-label">댓글 내용</label>
			<div class="col-sm-10">
				<textarea name="rev_com_content" rows="3" cols="30" class="form-control"></textarea>
			</div>
		</div>
		
		<div class="form-group">
			<label for="rev_com_show" class="col-sm-2 control-label">공개</label>
			<div class="col-sm-10">
				<select name="rev_com_show">
                  		<option value="Y">공개</option>
                    	<option value="N">비공개</option>
            	</select>
			</div>
		</div>

		<div class="form-group replydiv">
			<div class="col-sm-10">
				<button type="submit" class="insertReviewReplyBtn btn btn-success">작성</button>
			</div>
		</div>

	</form>
	</section>
	<hr>
</div>
</body>
</html>