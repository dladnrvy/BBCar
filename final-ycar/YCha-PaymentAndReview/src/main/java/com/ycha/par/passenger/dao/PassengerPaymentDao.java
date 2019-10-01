package com.ycha.par.passenger.dao;

import java.util.List;

import com.ycha.par.domain.Payment;
import com.ycha.par.domain.PaymentDetail;
import com.ycha.par.domain.ReservationBasicInfo;

public interface PassengerPaymentDao {
	
	public Payment selectPaymentByR_idx(int r_idx);

	public ReservationBasicInfo selectReservationBasicInfo(int r_idx);

	public int insertPayRecord(int r_idx, String paymethod);

	public PaymentDetail selectOneByRIdx(int r_idx);

	public List<PaymentDetail> selectListPassenger(int p_idx);
}
