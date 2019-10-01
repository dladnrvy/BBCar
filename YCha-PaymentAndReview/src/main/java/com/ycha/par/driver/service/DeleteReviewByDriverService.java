package com.ycha.par.driver.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Review;
import com.ycha.par.driver.dao.DriverReviewDao;

@Service("deleteReviewByDriverService")
public class DeleteReviewByDriverService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private DriverReviewDao dao;

	public int deleteReview(int rv_idx, int d_idx) {
		
		dao = template.getMapper(DriverReviewDao.class);
		int rscnt = 0; //반환값 
		
		//1. rv_idx 에 해당하는 리뷰가 존재하는지 확인
		Review review = dao.selectByRvIdx(rv_idx);
		System.out.println("후기 삭제 03  "+review.toString());
		
		//일치하는 리뷰 내역이 있고 + 그 작성자가 현재 삭제요청한 사람과 같다면, 삭제처리 
		if(review != null && review.getD_idx() == d_idx){
			rscnt = dao.deleteDriverReview(rv_idx);
			System.out.println("후기 삭제 04-1  "+rscnt);
		} else { //그 밖의 예외상황들 
			rscnt = 0;
		}
		
		System.out.println("후기 삭제 05  "+rscnt);
		return rscnt;
	}

}
