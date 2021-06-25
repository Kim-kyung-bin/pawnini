<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>공지사항 등록</title>
<link rel="stylesheet" href="../style/insertNotice.css"/>

</head>
	  <%@ include file="../include/Header.jsp" %>

<body>
		<div class="Guide">
      		<span>공지사항</span>
    	</div>

<div class="insertForm">
	<form action="insertNotice.do" method="post">
	<input type="hidden" name="notice_name"  value="${member.member_nickname}">
   		<div class="title">
	        <label for="notice_title"><span>제목</span></label>
	        <input type="text" id="notice_title" name="notice_title"/><br>
   		</div>
	    <div class="writer">
	        <label for="notice_name"><span>작성자</span></label>
	        ${member.member_nickname}<br>
	    </div>
		<div class="content">
			<label for="notice_content"><span>내용</span></label>
	        <textarea name="notice_content" id="notice_content" cols="70" rows="23"></textarea>
		</div>
	        <input class="button" type="submit" value=" 새글 등록 "/>
	</form>
</div>
			<a id="btnList" class="button" href="getNoticeList.do">글 목록</a>
</body>
   <%@ include file="../include/Footer.jsp" %>

</html>
