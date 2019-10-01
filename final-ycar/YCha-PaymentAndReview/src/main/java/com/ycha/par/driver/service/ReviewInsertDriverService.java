package com.ycha.par.driver.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Review;
import com.ycha.par.driver.dao.DriverReviewDao;

@Service("reviewInsertDriverService")
public class ReviewInsertDriverService {

	@Autowired
	private SqlSessionTemplate template;
	
	private DriverReviewDao dao;
	
	//original : 탑승자와 운전자 겹치는 코드가 많아서 1개의 서비스에서 분기처리함 
	//2019.09.19 : 탑승자 - 운전자 서비스 분리
	public int insertReview(Review review) {
		dao = template.getMapper(DriverReviewDao.class);
		
		System.out.println("리뷰 등록 03  "+review.toString());
		
		//반환할 결과값 
		int rscnt = 0;
		
		//writer 정의  + p_idx 정의 
		if(review != null 
				&& review.getD_idx()>0 
				&& review.getP_idx()==0) {
			review.setWriter("운전자");
			review.setP_idx(dao.selectP_idx(review.getPayidx()));
			System.out.println("리뷰 등록 04  "+review.toString());
			
			//기존에 payidx + 운전자 라는 작성자로 등록된 리뷰 내역이 있는지 확인 --> 없다면 등록처리, 있다면 rscnt 자동으로 0
			if(dao.selectReviewRecordByPayidx(review.getPayidx(), review.getWriter())==null) {
				rscnt = dao.insertReview(review);
			}
		}
		System.out.println("리뷰 등록 05  "+rscnt);
		return rscnt;
	}

}
