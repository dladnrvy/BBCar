package com.ycha.par.passenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Review;
import com.ycha.par.domain.ReviewEditPassenger;
import com.ycha.par.passenger.dao.PassengerReviewDao;

@Service("editReviewByPassenger")
public class EditReviewByPassengerService {

	@Autowired
	private SqlSessionTemplate template;
	
	private PassengerReviewDao dao;
	
	public int editReview(ReviewEditPassenger reviewEdit) {
		System.out.println("리뷰 수정 03"+reviewEdit);
		
		dao = template.getMapper(PassengerReviewDao.class);
		int rscnt = 0;
		
		Review review = dao.selectByRvIdx(reviewEdit.getRv_idx());
		System.out.println("리뷰 수정 04"+review);
		
		//리뷰를 작성한 탑승자와 현재 세션에 있는 사용자가 같은지 확인
		if(review != null && review.getP_idx() == reviewEdit.getP_idx()) {
			rscnt = dao.editPassengerReview(reviewEdit);
		}
		
		System.out.println("리뷰 수정 05"+rscnt);
		return rscnt;
	}
}
