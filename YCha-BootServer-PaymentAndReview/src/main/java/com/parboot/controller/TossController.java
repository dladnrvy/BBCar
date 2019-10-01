package com.parboot.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.parboot.domain.PaymentDetail;
import com.parboot.exception.AlreadyPaidException;
import com.parboot.service.TossInsertService;
import com.parboot.service.TossService;

@RestController
@RequestMapping("/parboot/payment/toss")
public class TossController {
	
	@Autowired
	private TossService tossService;
	
	@Autowired
	private TossInsertService tossInsertService;
	
	@PostMapping("/r_idx/{r_idx}")
	@CrossOrigin
	public ResponseEntity<String> tossTest(HttpServletResponse rep, 
											@PathVariable("r_idx") long r_idx) {
		
		System.out.println("toss pay 요청 02  "+r_idx);
		
		//str 로 요청 성공시 반환되는 결과값 받아오기 
		String str = tossService.tossProcess(r_idx);
		
		//client 페이지에 json 타입으로 전달
		return new ResponseEntity<String>(str, HttpStatus.OK);
	}
	
	@PostMapping
	@CrossOrigin
	public ResponseEntity<PaymentDetail> tossInsert(@RequestBody Map<String, Object> params) {
		//PaymentEntity entity로 받으면 null 로 받아짐.... ㅠㅠㅠ
		
		System.out.println("결제내역02 "+ params.get("r_idx")+" / "+params.get("paymethod"));
		
		int r_idx = Integer.parseInt((String)params.get("r_idx"));
		String paymethod = (String) params.get("paymethod");
		
		PaymentDetail paydetail = tossInsertService.insert(r_idx, paymethod);
		
		return new ResponseEntity<PaymentDetail>(paydetail, HttpStatus.OK);
	}
	
}
