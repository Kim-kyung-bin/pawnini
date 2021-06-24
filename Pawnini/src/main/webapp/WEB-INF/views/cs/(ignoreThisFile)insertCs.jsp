<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
	<h1>CS 등록</h1>
	<form action="insertCs.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td><label for="cs_title">제목</label><input type="text" name="cs_title" required autofocus></td>
			</tr>
			<tr>
				<td><label for="cs_writer">작성자</label><input type="text" name="cs_writer" required></td>
			</tr>
			<tr>
				<td><label for="cs_show">공개 여부</label>
						<select name="cs_show">
	                  		<option value="Y">Y</option>
	                    	<option value="Y">N</option>
                    	</select>
				</td>
			</tr>
			<tr>
				<td><label for="cs_content">내용</label><br><textarea name="cs_content" cols="50" rows="10" required></textarea>
			</tr>
			<tr>
				<td><label for="cs_img">이미지</label><input type="text" name="cs_img">
			</tr>			
			<tr>
				<td><label for="cs_file">파일</label><input type="file" name="cs_file"/>
			</tr>	
			<!-- 일단은 -->		
			<tr>
				<td><label for="member_id">멤버아이디</label><input type="text" name="member_id"/>
			</tr>				
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	</form>
	<hr>
	<a href="getCsList.do">게시글 목록</a>
</div>
</body>
</html>