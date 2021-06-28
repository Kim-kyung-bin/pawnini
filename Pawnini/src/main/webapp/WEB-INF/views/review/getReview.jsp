<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>getReview</title>
<link rel="stylesheet" href="../style/reviewDetail.css"/>

</head>
<%@ include file="../include/Header.jsp"%>
<body>



    <div class="Guide">
        <span>Review</span>
      </div>

   <section id="container">
      <div class="container_form">
      <form name="reviewForm" role="form" method="post">
      <input name="rev_id" type="hidden" value="${review.rev_id}">
      <input name="page" type="hidden" value="${scri.page}">
      <input name="perPageNum" type="hidden" value="${scri.perPageNum}">
      <input name="searchType" type="hidden" value="${scri.searchType}">
      <input name="keyword" type="hidden" value="${scri.keyword}">
      </form>
      <input name="member_id" type="hidden" value="${member.member_id}">

      <div class="form-group">

         <!-- 뒤에 bacground_img 이미지 없이 하고싶으시면 이거 주석 처리해보고 비교해주세요 !!!!! -->
         
         <!-- <img src="./images/KakaoTalk_20210625_153735240.jpg" class="bacground_img"/> -->
         <div >
         <label for="rev_f_img" class="col-sm-2 control-label"></label>
         <img class="img" src="${review.rev_thumb_img}" id="rev_thumb_img"/>
         </div>

         <div class="write">
            <label id="write_head_title"  id="title" for="rev_title" class="col-sm-2 control-label"><span>제목</span></label>
            <input type="text" name="rev_title" class="form-control" value="${review.rev_title}" readonly>
            
            
            <div class="write_head">
               <label for="rev_writer" class="col-sm-2 control-label"><span>글쓴이</span></label>
            <input id="write_head_title"   type="text" name="rev_writer" class="form-control" value="${review.rev_writer}" readonly>
        
            <label  for="rev_f_category" class="col-sm-2 control-label"><span>Size</span> </label>
            <input id="size" type="text" name="rev_f_category" value="${review.rev_f_category}" readonly>

            <label for="rev_show" class="col-sm-2 control-label"><span>공개</span></label>
            <input type="text" name="rev_show" value="${review.rev_show}" readonly>
            </div>

            <label for="rev_content" class="col-sm-2 control-label"><span>내용</span></label>
            <textarea id="text_dic" name="rev_content" class="form-control" readonly>${review.rev_content}</textarea>


            <div class="write_footer">
            <label for="rev_stars" class="col-sm-2 control-label"><span>평점</span></label>
            <input type="number" name="rev_stars" placeholder="1~5 사이의 평점 입력" value="${review.rev_stars}" readonly>
     
            <label for="product_id" class="col-sm-2 control-label"><span>상품코드</span></label>
            <input type="text" name="product_id" value="${review.product_id}" readonly>
         </div>

            <a class="like"><span>좋아요</span>
            <span id="like" class="glyphicon glyphicon-heart"></span>
            </a>
            <a class="totalLike">
            <span id="totalLike">${review.rev_like_cnt}</span>
            </a>
            </div>

                
         </div>
        

         <div class="button">
            <button class="btn" type="button" class="updateBtn btn btn-success">수정</button>
            <button class="btn" type="button" class="reviewListBtn btn btn-default">목록</button>
            <button class="btn" type="button" class="reviewDeleteBtn btn btn-warning">삭제</button>
         </div>
          
         
         
   
   
   <!-- 후기 댓글 -->
   <div class="reply" id="reply">

      <ol class="replyList">
         <c:forEach items="${reviewReplyList}" var="replyList">
            <li>
               <p>
                 <span> 글쓴이 </span> :${replyList.rev_com_writer}
                  <span>작성일</span>: <fmt:formatDate value="${replyList.rev_com_moddate}" pattern="yyyy-MM-dd" />
               </p>
               <p>${replyList.rev_com_content}</p>
               <div class="btn_list">
                  <button class="btn_reply"  type="button" class="reviewReplyUpdateBtn btn btn-warning" data-rno="${replyList.rev_com_id}">수정</button>
                  <button class="btn_reply"  type="button" class="reviewReplyDeleteBtn btn btn-danger" data-rno="${replyList.rev_com_id}">삭제</button>
               </div>
            </li>
         </c:forEach>
      </ol>
   </div>
   
   <!-- 후기 댓글 작성 -->
   <div class="review">
   <!-- <c:set var="contextPath" value="${pageContext.request.contextPath}"/> -->
   <form name="reviewReplyForm" class="form-horizontal" method="post" action="/insertReviewReply.do">
      <input type="hidden" id="rev_id" name="rev_id" value="${review.rev_id}">
      <input type="hidden" name="member_id" value="${member.member_id}"/>
      
     
      </div>
   </div>
<div class="footer_text">
   <div class="col-sm-10">
      <label for="rev_com_writer" class="col-sm-2 control-label"><span>댓글 글쓴이:</span></label>
         <input type="text" id="rev_com_writer" name="rev_com_writer" value="${member.member_nickname}" />
      </div>
         <label  for="rev_com_content" class="col-sm-2 control-label"><span>댓글 내용</span></label>
         <div class="col-sm-10">
            <textarea id="text_review" name="rev_com_content" rows="3" cols="30" class="form-control"></textarea>
         </div>
      </div>
      <label id="footer_title" for="rev_com_show" class="col-sm-2 control-label"><span>공개</span></label>
      <div class="footer">
         <div class="col-sm-10">
            <select class="option" name="rev_com_show">
                        <option value="Y">공개</option>
                       <option value="N">비공개</option>
               </select>
               <div class="btn_footer">
            <button class="btn_review"   type="submit" class="insertReviewReplyBtn  btn-success">작성</button>
               </div>
            </div>
         </div>
      </div>

   </form>
   </section>
   <hr>
</div>
<div class="Bouns">
    <ul class="Bouns_ul">
      <li>
        <h3> <i class="fas fa-drumstick-bite lg"></i>신선한 사료</h3>
      </li>
      <li>
        <h3><i class="far fa-clock"></i>유통기한 100% 책임제</h3>
     
      </li>
      <li>
        <h3><i class="fas fa-shipping-fast"></i>신속! 정확! 배송!</h3>
      </li>
      <li>
        <h3><i class="fas fa-rss"></i>만원 이상 구매시 무료배송</h3>
      </li>
   </ul>
  </div>

  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function(){
      var formObj = $("form[name='reviewForm']");
      
      $(".reviewReplyUpdateBtn").on("click", function(){
         location.href = "/updateReviewReplyView.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
      });
      
      $(".reviewReplyDeleteBtn").on("click", function(){
         location.href = "/deleteReviewReply.do?rev_id=${review.rev_id}&rev_com_id="+$(this).attr("data-rno");
      });
      
      $(".reviewListBtn").on("click", function(){
         location.href = "/getReviewList.do?page=${scri.page}&perPageNum=${scri.perPageNum}"
                     +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
      });
      
      $(".updateBtn").on("click", function(){
         location.href = "/updateReviewView.do?rev_id=${review.rev_id}&page=${scri.page}&perPageNum=${scri.perPageNum}"
                     +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
      });
      
      $(".reviewDeleteBtn").on("click", function(){
         var deleteChk = confirm("게시글을 삭제하시겠습니까?");
         if(deleteChk == true){
            formObj.attr("action", "/deleteReview.do");
            formObj.attr("method", "post");
            formObj.submit();
         }
         
      });
      
      
      
      var likeval = ${like};
      
      if(likeval>0){
         console.log(likeval);
         $("#like").attr("class", "glyphicon glyphicon-heart");
         $(".like").prop('name', likeval)
      }else {
         console.log(likeval);
         $("#like").attr("class", "glyphicon glyphicon-heart-empty");
         $(".like").prop('name', likeval)
      }
      
      $(".like").on("click", function() {
         var that = $(".like");
         var sendData = {'rev_id' : '${review.rev_id}', 'like' : that.prop('name')};
         $.ajax({
            url: '/reviewLike.do',
            type: 'post',
            data: sendData,
            success: function(data){
               that.prop('name', data);
                  if(data==1) {
                     $('#like').attr("class", "glyphicon glyphicon-heart");
                     likeCount();
                  }
                  else {
                     $('#like').attr("class", "glyphicon glyphicon-heart-empty");
                     likeCount();
                  }
               }
            })
         });

      
      function likeCount() {
         var that = $(".totalLike")
         var sendData = {'rev_id' : '${review.rev_id}', 'totalLike' : that.prop('name')};
         $.ajax({
            url: '/reviewLikeCount.do',
            type: 'post',
            data: sendData,
            success: function(count){
               $("#totalLike").html(count);
            },
            });
         }
      
      });
      
</script>
</body>
<%@ include file="../include/Footer.jsp"%>
</html>