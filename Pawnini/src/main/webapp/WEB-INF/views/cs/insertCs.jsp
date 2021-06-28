<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 <!-- absolute path:    -->

<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src = "${path}/ckeditor/ckeditor.js"></script>
<title>CS insertCs - - working on css/html</title>
	<style type="text/css">
	 .main_title {
		text-align: center;
		padding: 20px auto;
		color: rosyBrown;
	}
	   a, a:hover, a:focus, a:active {
	      color: black;
	      text-decoration: none;
	   }
	</style>    
	
</head>
<%@ include file="../include/Header.jsp"%>
<body>

<!-- my bit -->
<div class="Guide">
      <span>고객센터</span>
    </div>
<section class="container">
   <form  class="container" name="insertForm" action="insertCs.do" method="post" enctype="multipart/form-data">
   <input type="hidden" name="member_id" id="member_id" value="${member.member_id }"/>
      <table  class="table" align="center">
      <!-- 일단은 member -->      
         <tr>
            <td class="cs"><label for="cs_writer">작성자</label><input type="text" id="cs_writer" name="cs_writer" required value="${member.member_nickname }" readonly></td>
         </tr>
         <tr>
            <td class="cs"><label for="cs_title">제목</label><input type="text" id="cs_title" name="cs_title" required autofocus></td>
         </tr>
         <tr>
            <td class="cs"><label for="cs_show">공개 여부</label>
                  <select name="cs_show" id="cs_show">
                           <option value="Y">Y</option>
                          <option value="N">N</option>
                       </select>
            </td>
         </tr>
         <tr>
            <td class="cs"><label for="cs_content">내용</label><br><textarea name="cs_content" id="cs_content" cols="50" rows="10" required></textarea>
            <script type="text/javascript">
	        	CKEDITOR.replace("cs_content");
	        </script>
         </tr>     
         <tr>
            <td class="cs"><label for="cs_uploadFile">추가 파일 첨부</label><input type="file" name="cs_uploadFile" id="cs_uploadFile"/>
         </tr>               
         <tr>
            <td class="cs"><button class="insertBtn"  type="submit" style="cursor: pointer" value="글 등록">글 등록</button>
         </tr>
      </table>
	</form>
   <hr>
   <a href="getCsList.do">게시글 목록</a>

</section>

</body>
<%@ include file="../include/Footer.jsp"%>
</html>