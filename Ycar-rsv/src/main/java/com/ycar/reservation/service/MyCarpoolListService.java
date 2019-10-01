package com.ycar.reservation.service;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ycar.reservation.dao.ReservationDao;
import com.ycar.reservation.domain.MyCarpool;

@Service("myCarpoolService")
public class MyCarpoolListService {

	private ReservationDao dao;

	@Inject
	private SqlSessionTemplate template;

	public List<MyCarpool> getConfirmList(int p_idx) {

		dao = template.getMapper(ReservationDao.class);

		List<MyCarpool> list = dao.confirmListByP_idx(p_idx);

		return list;
	}

	public List<MyCarpool> getWaitingList(int p_idx) {

		dao = template.getMapper(ReservationDao.class);

		List<MyCarpool> list = dao.waitingListByP_idx(p_idx);

		return list;
	}
	
	public List<MyCarpool> getPastList(int p_idx){
		
		dao = template.getMapper(ReservationDao.class);
		
		List<MyCarpool> list = dao.pastListByP_idx(p_idx);
		
		return list;
	}


}