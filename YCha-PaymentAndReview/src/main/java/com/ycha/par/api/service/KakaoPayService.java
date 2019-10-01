package com.ycha.par.api.service;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.ycha.par.domain.KakaoPayReady;
import com.ycha.par.domain.KakaoPayResult;
import com.ycha.par.domain.Payment;
import com.ycha.par.domain.ReservationBasicInfo;
import com.ycha.par.passenger.dao.PassengerPaymentDao;

@Service("kakaoPayService")
public class KakaoPayService {

	private static final String HOST = "https://kapi.kakao.com";
	
	//에약정보 조회를 위해 DB 접근 설정
	@Autowired
	private SqlSessionTemplate template;
	
	private PassengerPaymentDao dao;
	
	//결제에 필요한 최소예약정보
	private ReservationBasicInfo rsvBasicInfo;
	
	//카카오 결제 요청 결과 : tid, next_redirect_pc_url, created_at
	private KakaoPayReady kakaoPayReady; 
	
	//카카오 결제 결과 
	private KakaoPayResult kakaoPayResult;	
	
	//결제 요청 : 필요한 매개변수들 headers & body 에 담아 post 로 요청 
	public String kakaoPayReady(int r_idx) {		
		//0. dao 정의 
		dao = template.getMapper(PassengerPaymentDao.class);
		
		//1. 결제 요청 시작 전, 이미 결제된 건이 있는지 검사 
		Payment payment = dao.selectPaymentByR_idx(r_idx);
		if(payment != null) {
			return "이미 결제된 건입니다!";
		}
		/* 결제 요청을 위해 필요한 데이터 
		 *    private int r_idx;
			  private int p_idx;
			  private int d_fee; 
		 * */ 		
		
		//2. dao - method 호출 
		rsvBasicInfo = dao.selectReservationBasicInfo(r_idx);
		System.out.println("kakao pay 요청 03 "+rsvBasicInfo);

		RestTemplate restTemplate = new RestTemplate();
		
		//1. header에 담을 정보 
		HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4b5b9271cba7502a54f6c429a8f101a7"); //admin key 입력
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

		System.out.println("kakao pay 요청 04 "+headers);
		
		//2. body에 담을 정보 (필수 파라미터들 10개)
		MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		
		params.add("cid", "TC0ONETIME"); //테스트용 cid 
		params.add("partner_order_id", rsvBasicInfo.getR_idx()); //예약번호 idx
		params.add("partner_user_id", rsvBasicInfo.getP_idx()); // 탑승자 idx 
		params.add("item_name", "연차 카풀 서비스"); //연차카풀서비스
		params.add("quantity", "1"); //건당 결제이므로 1
		params.add("total_amount", rsvBasicInfo.getD_fee()); //이용요금 
		params.add("tax_free_amount", "0"); //
		params.add("approval_url", "http://localhost:8080/parclient/kakao/success.jsp"); //결제 성공시 url 
		params.add("cancel_url", "http://localhost:8080/par/payment/kakao/fail.jsp?r_idx="+rsvBasicInfo.getR_idx()); //결제 취소시 url 
		params.add("fail_url", "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+rsvBasicInfo.getR_idx()); //결제 실패시 url 
		
		System.out.println("kakao pay 요청 05 "+params);
		
		HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String,String>>(params, headers);
				
		try {
			
			System.out.println("kakao pay 요청 06 "+body);
			
			kakaoPayReady = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReady.class);
			
			System.out.println("kakao pay 요청 07 "+kakaoPayReady);
			System.out.println("kakao pay 요청 08 "+kakaoPayReady.getNext_redirect_pc_url());

			//결제 요청 성공시 반환 주소 
			//: https://mockup-pg-web.kakao.com/v1/c6c8aa28d6788a586d97f4caae341ac31846ec74cb72eb22a6e07f223fe499c5/info
			return kakaoPayReady.getNext_redirect_pc_url();
			
		} catch (RestClientException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		
		//결제 요청 단계에서 실패 시 반환 주소 
		return "http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+rsvBasicInfo.getR_idx();
	}
	
	//결제 승인 : 결제된 결과를 보여준다. 
	public Map<String, Object> getkakaoPayResult(String pg_token) {
		//반환할 객체 : Payment
		Payment payment;
		
        RestTemplate restTemplate = new RestTemplate();
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "4b5b9271cba7502a54f6c429a8f101a7");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReady.getTid());
        params.add("partner_order_id", rsvBasicInfo.getR_idx());
        params.add("partner_user_id", rsvBasicInfo.getP_idx());
        params.add("pg_token", pg_token);
        params.add("total_amount", rsvBasicInfo.getD_fee());
        
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
		System.out.println("kakao pay 성공 03 " +body);
        
        try {
            kakaoPayResult = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayResult.class);
    		System.out.println("kakao pay 성공 04 " +kakaoPayResult);
            
            Map<String, Object> rsmap = new HashMap<String, Object>();
            
            //결제 완료 페이지에 필요한 정보들 
            rsmap.put("r_idx", rsvBasicInfo.getR_idx());
            rsmap.put("paymethod", kakaoPayResult.getPayment_method_type());            
    		System.out.println("kakao pay 성공 05 " +rsmap);
    		
            return rsmap;
        
        } catch (RestClientException e) {
            e.printStackTrace();

        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
	}
	
}
