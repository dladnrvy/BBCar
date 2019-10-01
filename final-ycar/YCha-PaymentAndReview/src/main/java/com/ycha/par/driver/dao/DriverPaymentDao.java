package com.ycha.par.driver.dao;


import java.util.List;

import com.ycha.par.domain.PaymentDetail;

public interface DriverPaymentDao {

	public List<PaymentDetail> selectListDriver(int d_idx);

}
