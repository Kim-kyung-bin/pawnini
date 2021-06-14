package com.pawnini.view.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pawnini.model.review.PageMaker;
import com.pawnini.model.review.ReviewDTO;
import com.pawnini.model.review.ReviewReplyDTO;
import com.pawnini.model.review.ReviewReplyService;
import com.pawnini.model.review.ReviewService;
import com.pawnini.model.review.SearchCriteria;

@Controller
@SessionAttributes("review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ReviewReplyService reviewReplyService;
	
	//후기 등록 View 이동
	@RequestMapping("/insertReviewView.do")
	public String insertReviewView() throws Exception {
		System.out.println("insertReviewView.do() 작동");
		
		return "review/insertReviewView";
	}
	
	//후기 등록
	@RequestMapping("/insertReview.do")
	public String insertReview(ReviewDTO dto) throws Exception {
		System.out.println("insertReview.do() 작동");
		
		reviewService.insertReview(dto);
		return "redirect:getReviewList.do";
	}
	
	//후기 수정
	@RequestMapping("/updateReviewView.do")
	public String updateReviewView(ReviewDTO dto, Model model) throws Exception {
		System.out.println("updateReviewView.do() 작동");
		// int형으로 바꿔야 하나?? 
		model.addAttribute("update", reviewService.getReview(dto));
		return "review/updateReviewView";
	}
	
	@RequestMapping("/updateReview.do")
	public String updateReview(ReviewDTO dto) throws Exception {
		System.out.println("updateReview.do() 작동");
		
		reviewService.updateReview(dto);
		
		return "redirect:getReviewList.do";
	}
	
	//후기 삭제
	@RequestMapping("/deleteReview.do")
	public String deleteReview(ReviewDTO dto) throws Exception {
		System.out.println("deleteReview.do() 작동");
		
		reviewService.deleteReview(dto);
		
		return "redirect:getReviewList.do";
	}

	//후기 목록 불러오기 (pagination 추가)
	@RequestMapping("/getReviewList.do")
	public String getReviewList(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		System.out.println("getReviewList.do() 작동");
		
		model.addAttribute("reviewList", reviewService.getReviewList(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(reviewService.countReviewList(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "review/getReviewList";
	}
	
	//후기 상세 보기
	@RequestMapping("/getReview.do")
	public String getReview(ReviewDTO dto, Model model) throws Exception {
		System.out.println("getReview.do() 작동");
		
	
		
		model.addAttribute("review", reviewService.getReview(dto));
		
		// 댓글 조회
		List<ReviewReplyDTO> reviewReplyList = reviewReplyService.readReply(dto.getRev_id());
		model.addAttribute("reviewReplyList", reviewReplyList);
		
		return "review/getReview";
	}
	
	//댓글 삽입 POST
	@RequestMapping("/insertReviewReply.do")
	public String insertReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("insertReviewReply.do() 작동");
		
		reviewReplyService.insertReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:getReview.do";
	}
	
	//댓글 수정 View
	@RequestMapping("/updateReviewReplyView.do")
	public String updateReviewReplyView(ReviewReplyDTO dto, Model model) throws Exception {
		System.out.println("updateReviewReplyView.do() 작동");
		
		model.addAttribute("replyUpdate", reviewReplyService.getReviewReply(dto.getRev_com_id()));
		
		return "review/updateReviewReplyView";
	}
	
	//댓글 수정 
	@RequestMapping("/updateReviewReply.do")
	public String updateReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("updateReviewReply.do() 작동");
		
		reviewReplyService.updateReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:getReview.do";
	}
	
	//댓글 삭제
	@RequestMapping("/deleteReviewReply.do")
	public String deleteReviewReply(ReviewReplyDTO dto, RedirectAttributes rttr) throws Exception {
		System.out.println("deleteReviewReply.do() 작동");
		
		reviewReplyService.deleteReviewReply(dto);
		
		rttr.addAttribute("rev_id", dto.getRev_id());
		
		return "redirect:getReview.do";
	}
	
}
