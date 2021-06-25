<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../../style/AdoptionFormal.css"/>

<title>Insert title here</title>
</head>
<%@ include file="../../include/Header.jsp"%>
<body>
	<div class="Guide">
      <span>분양등록</span>
    </div>
	
	<div align="center">

		<form class="table_form" action="updatePaws.do" method="post">
			<input name="paws_id" type="hidden" value="${paws.paws_id}" />
			<table class="table">
				<div class="table_in">
					<tr>
						<td class=""><span>1차분류</span> <select name="paws_f_code">
								<option value="DOG">강아지</option>
								<option value="CAT">고양이</option>
						</select>
					<tr>
						<td><span>2차분류</span><input type="text" name="paws_s_code"
							value="${paws.paws_s_code}" />
					<tr>
						<td><span>이름</span><input type="text" name="paws_name"
							value="${paws.paws_name}" />
					<tr>
						<td><span>나이</span><input type="text" name="paws_age"
							value="${paws.paws_age}" />
					<tr>
						<td><span>설명</span><textarea class="textarea" rows="10" cols="40"
								name="paws_desc">
 						 ${paws.paws_desc}</textarea>
					<tr>
						<td><span>성별</span><input type="text" name="paws_sex"
							value="${paws.paws_sex}" />
					<tr>
						<td><span>중성화여부</span> <select name="paws_is_neutered">
								<option value="Y">Y</option>
								<option value="N">N</option>
						</select>
					<tr>
						<td><span>건강상테</span><input type="text" name="paws_health"
							value="${paws.paws_health}" />
					<tr>
						<td><input class="button" type="submit" value="수정" />
						</td>
				</div>
			</table>
		</form>
	<div class="btnDiv">
		<div class="button">
			<a href="deletePaws.do?paws_id=${paws.paws_id}">삭제</a>
		</div>
		<div class="button">
			<a href="AdminGetPawsList.do">목록</a>
		</div>
	</div>
</div>

</body>
<%@ include file="../../include/Footer.jsp"%>
</html>