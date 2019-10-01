package com.ycha.par.driver.controller;

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
import com.ycha.par.domain.ReviewEditDriver;
import com.ycha.par.driver.service.DeleteReviewByDriverService;
import com.ycha.par.driver.service.EditReviewByDriverService;
import com.ycha.par.driver.service.ReviewInsertDriverService;
import com.ycha.par.driver.service.ReviewListByDriverService;

@RestController
@RequestMapping("/review/driver")
public class ReviewDriverController {
	/* url 
	 * POST : /
	 * GET : /{idx} - 리스트 
	 * PUT : /{idx}
	 * DELETE : /{idx}/d_idx/{didx}
	 * */
	
	@Autowired
	private  ReviewInsertDriverService reviewInsertDriverService;
	
	@Autowired
	private ReviewListByDriverService reviewListByPassengerService;
	
	@Autowired
	private DeleteReviewByDriverService deleteReviewByDriverService;
	
	@Autowired
	private EditReviewByDriverService editReviewByDriverService;
	
	
	//리뷰 등록
	@PostMapping()
	@CrossOrigin
	public int writeReview(@RequestBody Review review) {
		System.out.println("운전자 리뷰 등록 02  "+review);
		
		return reviewInsertDriverService.insertReview(review);
		
	}
	
	//리뷰 리스트
	@GetMapping("/{idx}")
	@CrossOrigin
	public List<Review> getReviewListByPassengers(
							@PathVariable("idx") int d_idx) {
		
		return reviewListByPassengerService.getReviewByPassengerList(d_idx);
	}
	
	//리뷰 삭제
	@DeleteMapping("/{rv_idx}/d_idx/{d_idx}")
	@CrossOrigin
	public int deleteReview(@PathVariable("rv_idx") int rv_idx,
							@PathVariable("d_idx") int d_idx) {
		
		System.out.println("후기 삭제 01  "+rv_idx);
		System.out.println("후기 삭제 02  "+d_idx);
		
		return deleteReviewByDriverService.deleteReview(rv_idx, d_idx);
	}
	
	//리뷰 수정
	@PutMapping("/{idx}")
	@CrossOrigin
	public int editReview(@RequestBody ReviewEditDriver reviewEdit) {
		System.out.println("리뷰 수정 02"+reviewEdit);
		
		return editReviewByDriverService.editReview(reviewEdit);
		
	}

}
