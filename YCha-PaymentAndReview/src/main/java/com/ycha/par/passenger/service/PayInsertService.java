package com.ycha.par.passenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycha.par.domain.Payment;
import com.ycha.par.domain.PaymentDetail;
import com.ycha.par.passenger.dao.PassengerPaymentDao;

@Service("payInsertService")
public class PayInsertService {

	@Autowired
	private SqlSessionTemplate template;
	
	private PassengerPaymentDao dao;
	
	//결제 내역 DB에 등록 
	public PaymentDetail insert(int r_idx, String paymethod) {
		
		System.out.println("결제내역03 "+ paymethod);
		
		//결제 내역 등록 
		dao = template.getMapper(PassengerPaymentDao.class);
		
		int rscnt = dao.insertPayRecord(r_idx, paymethod);
		System.out.println("결제내역04 "+ rscnt);
		
		//결제 + 운행 정보 출력 
		PaymentDetail payinfo = getPayDetail(r_idx);
		System.out.println("결제 내역 07 "+payinfo.toString());
		
		return payinfo;
	}
	
	public PaymentDetail getPayDetail (int r_idx) {
		System.out.println("결제 내역 05  "+r_idx);
		
		dao = template.getMapper(PassengerPaymentDao.class);
		PaymentDetail paydetail = dao.selectOneByRIdx(r_idx);
		System.out.println("결제 내역 06 "+paydetail.toString());

		return paydetail;
	}
	

}
