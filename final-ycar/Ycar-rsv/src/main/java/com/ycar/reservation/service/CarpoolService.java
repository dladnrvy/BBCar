package com.ycar.reservation.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ycar.reservation.dao.ReservationDao;
import com.ycar.reservation.domain.Carpool;

@Service("carpoolService")
public class CarpoolService {
	
	private ReservationDao dao;
	
	@Inject
	private SqlSessionTemplate template;
	
	//전체카풀 출력하기~ 
	public List<Carpool> getAllList(){
		
		dao = template.getMapper(ReservationDao.class);
		
		List<Carpool> list = dao.allCarpoolList();
		
		return list;
	}
	
//	//검색
	public List<Carpool> getSearchList(String date, String time, String startPoint, String endPoint) {
		
		dao =template.getMapper(ReservationDao.class);
		
		List<Carpool> list = dao.searchCarpoolList(date, time, startPoint, endPoint);
		
		System.out.println("서비스"+ date + time + startPoint + endPoint);
		
		return list;
	}

	
	//rsv할 카풀 선택! 
	public Carpool selectCarpool(int dr_idx) {
		
		dao = template.getMapper(ReservationDao.class);
		
		Carpool carpool = dao.selectByDr_idx(dr_idx);
		
		return carpool;
	}


}