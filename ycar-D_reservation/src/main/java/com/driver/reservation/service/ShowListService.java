package com.driver.reservation.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.driver.reservation.dao.DriverReservationDao;
import com.driver.reservation.domain.DriverReservation;

@Service
public class ShowListService {

	@Autowired
	private SqlSessionTemplate template;

	private DriverReservationDao dao;

	public Map<String, Object> showListForDate(int d_idx) {
		
		
		System.out.println("(서비스)검색하고자 하는 사람의 idx는" + d_idx);
	
		dao = template.getMapper(DriverReservationDao.class);
		
		Map<String, Object> thisdate = new HashMap<String, Object>();
		
		List<DriverReservation> past = dao.pastList(d_idx);
		
		List<DriverReservation> today = dao.todayList(d_idx);
		
		List<DriverReservation> future = dao.futureList(d_idx);

		thisdate.put("past", past);
		thisdate.put("today", today);
		thisdate.put("future", future);
		
		System.out.println("서비스에서 map출력"+thisdate);
		
		return thisdate;
	}

	
	 
	 

}
