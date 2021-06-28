package com.pawnini.view.review;

import java.io.File;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.pawnini.model.member.MemberDTO;
import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewLikeDTO;
import com.pawnini.model.review.ReviewService;
import com.pawnini.utils.UploadFileUtils;

@Controller
@SessionAttributes("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	//후기 등록
	@RequestMapping(value="/insertReview.do", method=RequestMethod.POST)
	public String insertReview(ReviewDTO dto, MultipartFile file, @RequestParam("product_id") int product_id) throws Exception {
		
		System.out.println("insertReview.do() 작동");
		
		//이미지 파일 첨부, 썸네일 경로 설정 
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		dto.setRev_f_img(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		dto.setRev_thumb_img(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		reviewService.insertReview(dto);
		// 후기 DB 삽입

		return "main";
	}
	
	//좋아요
	@ResponseBody
	@RequestMapping("/reviewLike.do")
	public int reviewLike(HttpServletRequest req) throws Exception {
		int like = Integer.parseInt(req.getParameter("like"));
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));
		String member_id = ((MemberDTO) req.getSession().getAttribute("member")).getMember_id();
		
		ReviewLikeDTO revlikeDTO = new ReviewLikeDTO();
		
		revlikeDTO.setRev_id(rev_id);
		revlikeDTO.setMember_id(member_id);
		
	
		System.out.println(like);
		
		if(like >= 1) {
			reviewService.deleteReviewLike(revlikeDTO);
			like = 0;
		} else {
			reviewService.insertReviewLike(revlikeDTO);
			like = 1;
		}
		return like;
	}
	
	@ResponseBody
	@RequestMapping("/reviewLikeCount.do")
	public int reviewLikeCount(HttpServletRequest req) throws Exception {
		
		int rev_id = Integer.parseInt(req.getParameter("rev_id"));

		ReviewLikeDTO revLikeDTO = new ReviewLikeDTO();
		
		revLikeDTO.setRev_id(rev_id);
		
		int totalLike = reviewService.getReviewLikeTotal(revLikeDTO);
	
		return totalLike;
	}
	
	/*// 후기 목록 
	@RequestMapping("/getReviews.do")
	public String getReviews(int product_id, Model model) throws Exception {
		System.out.println("getReviews.do() 작동");
		
		
		model.addAttribute("review",reviewService.getReviews(product_id));
		
		return "review/getReviews";
	}*/
	
}
