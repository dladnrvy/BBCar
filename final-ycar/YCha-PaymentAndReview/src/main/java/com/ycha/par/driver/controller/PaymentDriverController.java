package com.ycha.par.driver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ycha.par.domain.PaymentDetail;
import com.ycha.par.driver.service.GetDepositListService;

@RestController
@RequestMapping("/payment/driver")
public class PaymentDriverController {
	/* url 
	 * GET : /{idx} : list 출력 
	 * */
	
	@Autowired
	private GetDepositListService getDepositListService;
	
	//운전자 - 입금내역 출력
	@GetMapping("/{idx}")
	@CrossOrigin
	public List<PaymentDetail> getDepList(@PathVariable("idx") int d_idx) {
		System.out.println("입금리스트  02  "+d_idx);
		
		return getDepositListService.getDepListDriver(d_idx);
		
	}

}
