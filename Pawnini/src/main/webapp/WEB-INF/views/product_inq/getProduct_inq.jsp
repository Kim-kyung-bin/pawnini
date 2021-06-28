<%@ page import ="com.pawnini.model.product_inq.impl.Product_inqDAO" %>
<%@ page import ="com.pawnini.model.product_inq.Product_inqDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 세션에 저장된 게시글 정보를 꺼낸다.
	Product_inqDTO product_inqDTO = (Product_inqDTO)session.getAttribute("product_inqDTO");
%>  
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 상세</title>
<link rel="stylesheet" href="../style/product_inq.css"/>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function getProduct_inqList() {
	window.location.href="getProduct_inqList.do";
};
function deleteProduct_inq() {
	window.location.href="deleteProduct_inq.do?inq_id=${product_inq.inq_id}";
}
	
	$(document).ready(function(){
		
		$(".inq_repUpdateBtn").on("click", function(){
			location.href = "go_updateInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
		});
		
		$(".inq_repDeleteBtn").on("click", function(){
			location.href = "deleteInq_rep.do?inq_id=${product_inq.inq_id}&inq_rep_id="+$(this).attr("data-rno");
		});
		
		$(".product_inqUpdateBtn").on("click", function(){
			location.href = "/go_updateProduct_inq.do?inq_id=${product_inq.inq_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
					+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
		});
		
	});
</script>
</head>
  <%@ include file="../include/Header.jsp" %>

<body>
	<div class="Guide">
      <span>상품문의</span>
    </div>
    
	<div align="center">
		<div class="form_box">
			<form action="go_updateProduct_inq.do" method="post">
				<input name="inq_id" type="hidden" value="${ product_inq.inq_id }" />
				<div class="title">
					<span>제목</span> 
					${ product_inq.inq_title } <br>
					<span>등록일 
					</span>
					<fmt:formatDate value="${ product_inq.inq_date }" pattern="yyyy-MM-dd" />
				</div>
				<div class="writer">
					<span>작성자</span>
					${ product_inq.inq_name }
				</div>
					<div class="content_box"> <img src="${product_inq.inq_thumb}"/> <br>
					${product_inq.inq_content }
					</div>
				
				<div class="btnList">
				<c:if test="${product_inq.inq_name eq member.member_nickname}">
					<input class="button"  type="submit" value="수정하기">
					<input type="button" onclick="deleteProduct_inq()" value="삭제하기">
				</c:if>
					<input type="button" onclick="getProduct_inqList()" value="목록으로">
				</div>
			</form>
		</div>
			
	</div>
			
		<!-- 답글 -->
	
		<div class="form_box">
		<div id="inq_rep" align="center">
		<ol class="inq_repList">
			<c:forEach items="${inq_repList}" var="inq_repList">
				<li class="rep">
					
					<div class="title">제목: ${inq_repList.inq_rep_title}</div>
					<div class="writer"> ${inq_repList.inq_rep_name}  <fmt:formatDate value="${inq_repList.inq_rep_date}" pattern="yyyy-MM-dd"/></div>
					<div class="rep_content">
					${inq_repList.inq_rep_content}
					</div>
					<div class="btnList">
						<c:if test="${member.member_grade eq '2' }">
						<button type="button" class="inq_repUpdateBtn btn btn-warning" data-rno="${inq_repList.inq_rep_id}">수정</button>
						<button type="button" class="inq_repDeleteBtn btn btn-danger" data-rno="${inq_repList.inq_rep_id}">삭제</button>
						</c:if>
					</div>
				</li>
			</c:forEach>
		</ol>
		</div>
	</div>
	
	<!-- 답글 입력창 -->
<c:if test="${ member.member_grade eq '2'}">
	<div class="form_box" align="center">
	<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	<div align="center">
	<form name="inq_repForm" method="post" action="${contextPath}/insertInq_rep.do">
		<div class="writer">
			<input type="hidden" id="inq_id" name="inq_id" value="${product_inq.inq_id}">
			<input type="hidden" id="inq_rep_title" name="inq_rep_title" value="상품 문의 답변입니다.">
			<label for="inq_rep_name"></label>
			<input type="hidden" id="inq_rep_name" name="inq_rep_name" value="관리자" >관리자
		</div>
		<div class="content">
			<label for="inq_rep_content" class="col-sm-2 control-label">답글 내용</label>
		</div>	
			<div>
				<textarea name="inq_rep_content" rows="3" cols="139" ></textarea>
			</div>
		
		<div class="btnList">
			<button type="submit" class="insertInq_repBtn btn btn-success" id="updateInq_ans" >입력</button>
		</div>
	</form>
	</div>
	</div>
</c:if>

	<hr>

</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
