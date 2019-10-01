package com.driver.reservation.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.driver.reservation.dao.DriverReservationDao;
import com.driver.reservation.domain.DriverReservation;
import com.driver.reservation.domain.lonlat;

@Service
public class SelectLonLat {

	@Autowired
	private SqlSessionTemplate template;
	
	private DriverReservationDao dao;
	
	public lonlat selectlonlat(int r_idx) {
		
		dao = template.getMapper(DriverReservationDao.class);
		
		lonlat DR = dao.selectlonlat(r_idx);
		
		System.out.println("서비스 " + DR);
		
		
		return DR;
	}
}
