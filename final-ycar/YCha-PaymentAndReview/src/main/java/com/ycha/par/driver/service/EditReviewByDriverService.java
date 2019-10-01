package com.ycha.par.driver.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Review;
import com.ycha.par.domain.ReviewEditDriver;
import com.ycha.par.driver.dao.DriverReviewDao;

@Service("editReviewByDriverService")

public class EditReviewByDriverService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private DriverReviewDao dao;

	public int editReview(ReviewEditDriver reviewEdit) {
		System.out.println("리뷰 수정 03"+reviewEdit);
		
		dao = template.getMapper(DriverReviewDao.class);
		int rscnt = 0;
		
		Review review = dao.selectByRvIdx(reviewEdit.getRv_idx());
		System.out.println("리뷰 수정 04"+review);
		
		//리뷰를 작성한 운전자와 현재 세션에 있는 운전자와 같은지 확인
		if(review != null && review.getD_idx() == reviewEdit.getD_idx()) {
			rscnt = dao.editDriverReview(reviewEdit);
		}
		
		System.out.println("리뷰 수정 05"+rscnt);
		return rscnt;
	}

}
