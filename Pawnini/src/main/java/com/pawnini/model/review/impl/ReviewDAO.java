package com.pawnini.model.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//후기 등록
	public void insertReview(ReviewDTO dto) throws Exception {
		System.out.println(dto.toString());
		mybatis.insert("ReviewDAO.insertReview", dto);
		System.out.println("Mybatis/insertReview() 기능처리 완료");
	}
	
	//후기 목록
	public List<ReviewDTO> getReviews(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/getReviews() 기능처리 완료");
		return mybatis.selectList("ReviewDAO.getReviews", dto);
	}
	
	//후기 평점 평균
	public double getAvgStars(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/getAvgStars() 기능처리 완료");
		return mybatis.selectOne("ReviewDAO.getAvgStars", dto);
	}
	
	//후기 좋아요 생성
	public void insertReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/insertReviewLike() 기능처리");
		mybatis.insert("ReviewDAO.insertReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 삭제
	public void deleteReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/deleteReviewLike() 기능처리");
		mybatis.delete("ReviewDAO.deleteReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 업데이트 (변수 타입 확인!!!!!)
	public void updateReviewLike(int rev_id) throws Exception{
		System.out.println("Mybatis/updateReviewLike() 기능처리");
		mybatis.update("ReviewDAO.updateReviewLike", rev_id);
	}
		
	//후기 좋아요 개수 구하기 (ID 중복 방지용)
	public int getReviewLike(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/getReviewLike() 기능처리");
		return mybatis.selectOne("ReviewDAO.getReviewLike", reviewLikeDTO);
	}
	
	//후기 좋아요 개수 구하기 (ID 중복 방지용)
	public int getReviewLikeTotal(ReviewLikeDTO reviewLikeDTO) throws Exception{
		System.out.println("Mybatis/getReviewLikeTotal() 기능처리");
		return mybatis.selectOne("ReviewDAO.getReviewLikeTotal", reviewLikeDTO);
	}
/*	
	//후기 수정
	public void updateReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/updateReview() 기능처리");
		mybatis.update("ReviewDAO.updateReview", dto);
	}
	
	//후기 삭제
	public void deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/deleteReview() 기능처리");
		mybatis.update("ReviewDAO.deleteReview", dto);
	}
	
	//후기 목록
	public List<ReviewDTO> getReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Mybatis/getReviewList() 기능처리");
		return mybatis.selectList("ReviewDAO.getReviewList", scri);
	}
	
	//게시물 총 갯수
	public int countReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Mybatis/countReviewList() 기능처리");
		return mybatis.selectOne("ReviewDAO.countReviewList", scri);
	}
	
	//후기 상세보기
	public ReviewDTO getReview(ReviewDTO dto) throws Exception {
		System.out.println("Mybatis/getReview() 기능처리");
		return (ReviewDTO) mybatis.selectOne("ReviewDAO.getReview", dto);
	}
	
	//후기 댓글 개수 구하기
	public void updateReplyCount(int rev_id) throws Exception {
		System.out.println("Mybatis/updateReplyCount() 기능처리");
		mybatis.update("ReviewDAO.updateReplyCount", rev_id);
	}*/
	

}
