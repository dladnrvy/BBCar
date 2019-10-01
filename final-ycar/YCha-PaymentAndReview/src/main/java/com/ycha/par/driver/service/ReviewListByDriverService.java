package com.ycha.par.driver.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Review;
import com.ycha.par.driver.dao.DriverReviewDao;

@Service("reviewListByPassengerService")
public class ReviewListByDriverService {
	
	@Autowired
	private SqlSessionTemplate template;
	
	private DriverReviewDao dao;

	public List<Review> getReviewByPassengerList(int d_idx) {
		
		dao = template.getMapper(DriverReviewDao.class);
		
		List<Review> rvlist = dao.selectListByDrivers(d_idx);
		
		return rvlist;
	}

}
