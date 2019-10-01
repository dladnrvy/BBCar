package com.ycha.par.passenger.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ycha.par.domain.Review;
import com.ycha.par.domain.ReviewEditPassenger;
import com.ycha.par.domain.ReviewListInfo;
import com.ycha.par.passenger.service.DeleteReviewByPassengerService;
import com.ycha.par.passenger.service.EditReviewByPassengerService;
import com.ycha.par.passenger.service.ReviewListByPassenger;
import com.ycha.par.passenger.service.ReviewInsertPassengerService;

@RestController
@RequestMapping("/review/passenger")
public class ReviewPassengerController {
	/* url 
	 * POST : /
	 * GET : /{idx} - 특정 사용자의 리뷰 리스트 출력
	 * PUT : /{rv_idx}- 특정 사용자의 특정 리뷰 수정
	 * DELETE : /{rv_idx}/p_idx/{p_idx} - 특정 사용자의 특정 리뷰 삭제
	 * */
	
	@Autowired
	private ReviewInsertPassengerService reviewInsertPassengerService;
	
	@Autowired
	private ReviewListByPassenger reviewListByPassenger;
	
	@Autowired
	private DeleteReviewByPassengerService deleteReviewByPassenger;
	
	@Autowired
	private EditReviewByPassengerService editReviewByPassenger;
	
	//리뷰 등록
	@PostMapping()
	@CrossOrigin
	public int writeReview(@RequestBody Review review) {
		System.out.println("탑승자 리뷰 등록 03  "+review);
		
		return reviewInsertPassengerService.insertReview(review);
		
	}
	
	//리뷰 리스트
	@GetMapping("/{idx}")
	@CrossOrigin
	public List<ReviewListInfo> getReviewListByDrivers(@PathVariable("idx") int p_idx) {
		
		return reviewListByPassenger.getReviewByPassenger(p_idx);
	}
	
	//리뷰 수정
	@PutMapping("/{rv_idx}")
	@CrossOrigin
	public int editReview(@RequestBody ReviewEditPassenger reviewEdit) {
		
		System.out.println("리뷰 수정 02"+reviewEdit);
		
		return editReviewByPassenger.editReview(reviewEdit);
		
	}
	
	//리뷰 삭제
	@DeleteMapping("/{rv_idx}/p_idx/{pidx}")
	@CrossOrigin
	public int deleteReview(@PathVariable("rv_idx") int rv_idx,
							@PathVariable("pidx") int p_idx) {
		
		System.out.println("후기 삭제 01  "+rv_idx);
		System.out.println("후기 삭제 02  "+p_idx);
		
		return deleteReviewByPassenger.deleteReview(rv_idx, p_idx);
		
	}
}
