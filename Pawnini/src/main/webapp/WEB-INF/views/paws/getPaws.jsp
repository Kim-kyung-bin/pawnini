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
		<form action="updatePaws.do" method="post">
		<input name="paws_id" type="hidden" value="${paws.paws_id}">
			<table border="1">
				<tr>
					<td>1차분류
					<select name="paws_f_code" >
						<option value="DOG">강아지</option>
						<option value="CAT">고양이</option>
					</select>
				<tr>
					<td>2차분류<input type="text" name="paws_s_code" value="${paws.paws_s_code}">
				<tr>
					<td>이름<input type="text" name="paws_name" value="${paws.paws_name}">
				<tr>
					<td>나이<input type="text" name="paws_age" value="${paws.paws_age}">
				<tr>
					<td>설명<input type="text" name="paws_desc" value="${paws.paws_desc}">
				<tr>
					<td>성별<input type="text" name="paws_sex" value="${paws.paws_sex}">
				<tr>
					<td>중성화여부
					<select name="paws_is_neutered">
                  		<option value="Y">Y</option>
                    	<option value="N">N</option>
                    </select>
				<tr>
					<td>건강상태<input type="text" name="paws_health" value="${paws.paws_health}">
				<tr>
					<td><input type="submit" value="수정">
			</table>
		</form>
		<a href="deletePaws.do?paws_id=${paws.paws_id}">삭제</a>
		<a href="getPawsList.do">목록</a>
	</div>
</body>

</html>