package com.ycha.par.passenger.dao;

import java.util.List;

import com.ycha.par.domain.Review;
import com.ycha.par.domain.ReviewEditPassenger;
import com.ycha.par.domain.ReviewListInfo;

public interface PassengerReviewDao {

	public int selectD_idx(int payidx);
	
	public int insertReview(Review review);

	public Review selectReviewRecordByPayidx(int payidx, String writer);
	
	public List<ReviewListInfo> selectListByPassenger(int p_idx);
	
	public Review selectByRvIdx(int rv_idx);
	
	public int editPassengerReview(ReviewEditPassenger reviewEdit);
	
	public int deletePassengerReview(int rv_idx);

}
