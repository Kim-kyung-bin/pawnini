<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="getAdoptionList.do" method="post">
		<table>
			<tr>
				<td>작성자<input type="text" name="adoption_name">
			<tr>
				<td>제목<input type="text" name="adoption_title">
			<tr>
				<td>내용<input type="text" name="adoption_content">
			<tr>
				<td>사진(수정필요)<input type="text" name="adoption_f_image">
			<tr>
				<td>임시1<input type="text" name="member_id">
			<tr>
				<td>임시2<input type="text" name="paws_id">
			<tr>
				<td><input type="submit" value="등록">
		</table>
	</form>
</body>
</html>
