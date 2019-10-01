package com.ycha.par.api.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ycha.par.api.service.KakaoPayService;

@RestController
@RequestMapping("/payment/kakao")
public class PaymentKakaoController {
	/* POST : /payment/kakao/p_idx/{idx} - kakao 결제 요청 
	 * GET : /payment/kakao/success - 결제 성공 
	 * GET : /payment/kakao/calcel - 결제 취소 
	 * GET : /payment/kakao/fail - 결제 실패
	 * */
	@Autowired
	private KakaoPayService kakaoPayService;
	
	//kakao pay 결제 요청을 위한 post  
	@PostMapping("/r_idx/{r_idx}") 
	@CrossOrigin
	public String kakaoPay(@PathVariable("r_idx") int r_idx) {
		
		System.out.println("kakao pay 요청 02 "+r_idx);
		
		return kakaoPayService.kakaoPayReady(r_idx);
	}
	
	//카카오페이 성공시 호출 매서드 
	@GetMapping("/success")
	@CrossOrigin
	public Map<String, Object> kakaoPaySuccess(@RequestParam("pg_token") String pg_token) {
		
		System.out.println("kakao pay 성공 02 " +pg_token);
		
		return kakaoPayService.getkakaoPayResult(pg_token);
	}
}
