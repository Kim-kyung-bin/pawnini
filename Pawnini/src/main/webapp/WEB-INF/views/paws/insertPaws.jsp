<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<form action="insertPaws.do" method="post">
			<table>
				<tr>
					<td>1차분류
					<select name="paws_f_code">
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
					</select>
				<tr>
					<td>2차분류<input type="text" name="paws_s_code">
				<tr>
					<td>이름<input type="text" name="paws_name">
				<tr>
					<td>나이<input type="text" name="paws_age">
				<tr>
					<td>사진<input type="file" name="paws_img">
				<tr>
					<td>설명<input type="text" name="paws_desc">
				<tr>
					<td>성별<input type="text" name="paws_sex">
				<tr>
					<td>중성화여부
					<select name="paws_is_neutered">
                  		<option value="Y">Y</option>
                    	<option value="N">N</option>
                    </select>
				<tr>
					<td>건강상태<input type="text" name="paws_health">
				<tr>
					<td><input type="submit" value="등록">
			</table>
		</form>
		<a href="getPawsList.do">목록</a>
	</div>
</body>
</html>