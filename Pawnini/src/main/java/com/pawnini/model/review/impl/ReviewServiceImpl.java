package com.pawnini.model.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO dao;

	@Override
	public void insertReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 등록");
		dao.insertReview(dto);
	}
	
	@Override
	public List<ReviewDTO> getReviews(ReviewDTO dto) throws Exception {
		System.out.println("후기 목록");
		return dao.getReviews(dto);
	}
	
	@Override
	public double getAvgStars(ReviewDTO dto) throws Exception {
		System.out.println("후기 평점 평균 구하기");
		return dao.getAvgStars(dto);
	}
	
	@Override
	public void insertReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 생성");
		
		dao.insertReviewLike(dto);
		dao.updateReviewLike(dto.getRev_id());
	}

	@Override
	public void deleteReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 삭제");
		
		dao.deleteReviewLike(dto);
		dao.updateReviewLike(dto.getRev_id());
	}

	@Override
	public int getReviewLike(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 개수 불러오기");
		return dao.getReviewLike(dto);
	}

	@Override
	public int getReviewLikeTotal(ReviewLikeDTO dto) throws Exception {
		System.out.println("후기 좋아요 총 개수 불러오기");
		return dao.getReviewLikeTotal(dto);
	}


	
/*
	@Override
	public void updateReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 수정");
		
		reviewDAO.updateReview(dto);
	}
	
	@Override
	public void deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 삭제");
		
		reviewDAO.deleteReview(dto);
	}

	@Override
	public ReviewDTO getReview(ReviewDTO dto) throws Exception {
		System.out.println("후기 상세보기");
		
		return reviewDAO.getReview(dto);
	}

	@Override
	public List<ReviewDTO> getReviewList(SearchCriteria scri) throws Exception {
		System.out.println("후기 목록");
		
		return reviewDAO.getReviewList(scri);
	}

	@Override
	public int countReviewList(SearchCriteria scri) throws Exception {
		System.out.println("Pagination - 후기 목록 갯수 세기");
		
		return reviewDAO.countReviewList(scri);
	}

	@Override
	public void updateReplyCount(int rev_id) throws Exception {
		System.out.println("후기 목록 갯수 세기");
		
		reviewDAO.updateReplyCount(rev_id);
	}*/

	

}
