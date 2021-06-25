<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="../style/reviewRegistration.css"/>
		<title>공지사항 상세</title>
	</head>
	  <%@ include file="../include/Header.jsp" %>
	<body>
		<center>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>
			<form action="go_updateNotice.do" method="post">
			<input name="notice_id" type="hidden" value="${ notice.notice_id }" />
				<table class="table" align="center" >
					<tr>
						<td><span>제목</span></td>
						<td align="left">${ notice.notice_title }
					</tr>
					<tr>
						<td><span>작성자</span></td>
						<td align="left">${ notice.notice_name }</td>
					</tr>
					<tr>
						<td><span>내용</span></td>
						<td align="left">
							<textarea name="notice_content" cols="70" rows="23" readonly="readonly">${ notice.notice_content }</textarea>
						</td>
					</tr>
					<tr>
						<td><span>등록일</span></td>
						
						<td><fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" /></td>
					</tr>
			<c:if test ="${notice.notice_name eq member.member_nickname}">
					<tr>
						<td colspan="2" align="center">
						<input class="button" type="submit" value="수정하기">
					</tr>
			</c:if>
				</table>
			</form>
			<c:if test ="${notice.notice_name eq member.member_nickname}">
			<a  id="btnList" class="button" href="deleteNotice.do?notice_id=${ notice.notice_id}">글 삭제</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			<a id="btnList" class="button" href="getNoticeList.do">글 목록</a>
		</center>
	</body>
	   <%@ include file="../include/Footer.jsp" %>
</html>
