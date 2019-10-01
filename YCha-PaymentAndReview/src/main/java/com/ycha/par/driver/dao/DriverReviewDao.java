package com.ycha.par.driver.dao;

import java.util.List;

import com.ycha.par.domain.Review;
import com.ycha.par.domain.ReviewEditDriver;

public interface DriverReviewDao {

	public int selectP_idx(int payidx);

	public Review selectReviewRecordByPayidx(int payidx, String writer);

	public int insertReview(Review review);

	public List<Review> selectListByDrivers(int d_idx);

	public Review selectByRvIdx(int rv_idx);

	public int editDriverReview(ReviewEditDriver reviewEdit);

	public int deleteDriverReview(int rv_idx);
	
}
