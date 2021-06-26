<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>공지사항 상세</title>
<link rel="stylesheet" href="../style/getNotice.css"/>
</head>
<%@ include file="../include/Header.jsp"%>
<body>
	<div>

		<div class="Guide">
			<span>공지사항</span>
		</div>
		<div class="form_box">
			<form action="go_updateNotice.do" method="post">
				<input name="notice_id" type="hidden" value="${ notice.notice_id }" />
				<div class="title">
				<span class="title">제목
				${ notice.notice_title }
				</span> 
				<span class="date">등록일 
				<fmt:formatDate value="${ notice.notice_date }" pattern="yyyy-MM-dd" />
				</span>
				</div>
				<br>
				<span>작성자</span>
				${ notice.notice_name }
				<span>내용</span>
				<div class="content_box">${ notice.notice_content }</div>
				
				<c:if test="${notice.notice_name eq member.member_nickname}">
					<input class="button" type="submit" value="수정하기">
				</c:if>
			</form>
		</div>
		<c:if test="${notice.notice_name eq member.member_nickname}">
			<a id="btnList" class="button"
				href="deleteNotice.do?notice_id=${ notice.notice_id}">글 삭제</a>&nbsp;&nbsp;&nbsp;
			</c:if>
		<a id="btnList" class="button" href="getNoticeList.do">글 목록</a>
	</div>

</body>
<%@ include file="../include/Footer.jsp"%>
</html>
