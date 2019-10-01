package com.ycha.par.passenger.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.PaymentDetail;
import com.ycha.par.passenger.dao.PassengerPaymentDao;

@Service("getPayListService")
public class GetPayListService {
	
	@Autowired
	private SqlSessionTemplate template;

	private PassengerPaymentDao dao;

	public List<PaymentDetail> getListPassenger(int p_idx) {
		System.out.println("결제 리스트 03  "+p_idx);
		
		dao = template.getMapper(PassengerPaymentDao.class);
		
		List<PaymentDetail> list = dao.selectListPassenger(p_idx);
		System.out.println("결제 리스트 04  "+list);
		
		return list;
	}
	
	
}
