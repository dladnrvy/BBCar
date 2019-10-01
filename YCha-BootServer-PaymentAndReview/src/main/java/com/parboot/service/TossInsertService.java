package com.parboot.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.parboot.domain.PaymentDetail;
import com.parboot.entity.PaymentEntity;
import com.parboot.repository.PaymentRepository;

@Service("tossInsertService")
public class TossInsertService {
	
	@Autowired
	private PaymentRepository payRepository;
	
	public PaymentDetail insert(int r_idx, String paymethod) {
		System.out.println("결제내역03 " + paymethod);

		// 결제 내역 등록 
		PaymentEntity entity = new PaymentEntity();
	
		entity.setR_idx(r_idx);
		entity.setPaymethod(paymethod);
		entity.setPaydate(new Date());
		
		payRepository.flush(); 
		//발생 에러 : java.sql.SQLIntegrityConstraintViolationException: Duplicate entry '11' for key 'r_idx_UNIQUE'
		//확실하게 insert 하기 위해서 저장 전 flush() 로 비워주기
		PaymentEntity payEntity = payRepository.saveAndFlush(entity);
		System.out.println("결제내역04 " + payEntity);

		//결제 + 운행 정보 출력
		PaymentDetail payinfo = getPayDetail(r_idx);
		System.out.println("결제 내역 07 " + payinfo.toString());

		return payinfo;
	}
	
	public PaymentDetail getPayDetail (long r_idx) {
		System.out.println("결제 내역 05  "+r_idx);
		
		 PaymentEntity pay = payRepository.findByIdx((int)r_idx);
		 System.out.println("결제 내역 06-1 "+pay.toString());
		 System.out.println("결제 내역 06-2 "+pay.getReservationEntity().toString());
		 System.out.println("결제 내역 06-3 "+pay.getReservationEntity().getCarpoolEntity().toString());

		 PaymentDetail paydetail 
		 	= new PaymentDetail((int)pay.getPayidx(), 
		 						pay.getPaydate(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_distance(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_commute(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_starttime(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_endtime(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_fee(), 
		 						pay.getPaymethod(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_startpoint(), 
		 						pay.getReservationEntity().getCarpoolEntity().getD_endpoint());
		 System.out.println("결제 내역 06-4 "+paydetail.toString());

		return paydetail;
	}
}
