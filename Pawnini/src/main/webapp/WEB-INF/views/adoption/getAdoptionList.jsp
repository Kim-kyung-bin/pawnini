<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	.table{
		width: 700px;
	}
</style>
<meta charset="UTF-8">
 <link rel="stylesheet" href="../style/event.css" />
<title>Insert title here</title>
</head>
<%@ include file="../include/Header.jsp" %>
<body>
	<div align="center">
		<h1>분양글 게시판</h1>
		
		<!-- 검색 부분 -->
		<form action="getAdoptionList.do" method="post">
			<table class="table" border="1">
				<tr>
					<td align="right">
						<select name="searchCondition">
							<c:forEach items="${conditionMap}" var="option" >
								<option value="${option.value}">${option.key}
							</c:forEach>
						</select>
						<input name="searchKeyword" type="text">
						<input type="submit" value="검색">
			</table>			
		</form>
		<!-- ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ -->		
		<table class="table" border="1">
			<tr>
				<td bgcolor="orange">사진
				<td bgcolor="orange">제목
			<c:forEach items="${adoptionList}" var="adoption">
			<tr>
				<td>${adoption.adoption_f_image}
				<td><a href="getAdoption.do?adoption_id=${adoption.adoption_id}">
				${adoption.adoption_title}
				</a>
			</c:forEach>
		</table>	
		<a href="goInsert.do">등록</a>
	</div>
</body>
<%@ include file="../include/Footer.jsp" %>
</html>
