package com.driver.reservation.service;

import java.util.List;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.driver.reservation.dao.DriverReservationDao;
import com.driver.reservation.domain.lonlat;
import com.driver.reservation.domain.DriverReservation;

@Service
public class ShowListService {

	@Autowired
	private SqlSessionTemplate template;

	private DriverReservationDao dao;

	public List<DriverReservation> showAllList(int d_idx) {
			
		System.out.println("(서비스-전체출력) 하는 사람의 idx는" + d_idx);
	
		dao = template.getMapper(DriverReservationDao.class);	
			
		List<DriverReservation> test = dao.carpoolAllList(d_idx);	
		
		System.out.println("(서비스-전체출력) 출력해봅니다 : "+test);
		
		return test;
	}
	
	public List<DriverReservation> BmycarpoolList(int d_idx) {
		
		System.out.println("(서비스-B) 검색하고자 하는 사람의 idx는" + d_idx);
	
		dao = template.getMapper(DriverReservationDao.class);	
			
		List<DriverReservation> test = dao.mycarpoolB(d_idx);	
		
		System.out.println("(서비스-B) 출력해봅니다 : "+test);
		
		return test;
	}
	
	public List<DriverReservation> YmycarpoolList(int d_idx) {
		
		System.out.println("(서비스-Y) 검색하고자 하는 사람의 idx는" + d_idx);
	
		dao = template.getMapper(DriverReservationDao.class);	
			
		List<DriverReservation> test = dao.mycarpoolY(d_idx);	
		
		System.out.println("(서비스-Y) 출력해봅니다 : "+test);
		
		return test;
	}

	
	 
	 

}
