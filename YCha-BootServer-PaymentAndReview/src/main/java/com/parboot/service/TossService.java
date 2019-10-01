package com.parboot.service;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.parboot.domain.TossRequestVO;
import com.parboot.entity.PaymentEntity;
import com.parboot.entity.ReservationEntity;
import com.parboot.exception.AlreadyPaidException;
import com.parboot.repository.PaymentRepository;
import com.parboot.repository.ReservationRepository;

@Service("tossService")
public class TossService {
	
	@Autowired
	private PaymentRepository payRepository;
	
	@Autowired
	private ReservationRepository resRepository;

	public String tossProcess(long r_idx) {
		
		System.out.println("toss pay 요청 03  "+r_idx);
		
		//1. 결제 요청 시작 전, 이미 결제된 건이 있는지 검사 
		//ERRPR : javax.persistence.EntityNotFoundException: Unable to find com.parboot.entity.PaymentEntity with id 6
		
		/*PaymentEntity payEntity = payRepository.getOne(r_idx);
		System.out.println("toss pay 요청 03-1  "+payEntity);
		
		if(payEntity != null) {
			throw new AlreadyPaidException("이미 결제된 건입니다.");
		} else {
			System.out.println("신규 결제 요청!");
		}*/
		
		/* 결제 요청을 위해 필요한 데이터 
		 *    private int r_idx;
			  private int p_idx;
			  private int d_fee; 
		 * */		
		//결제 요청에 필요한 예약 정보 받아오기 
		ReservationEntity resEntity = resRepository.getOne(r_idx);		
		System.out.println("toss pay 요청 03-2  "+resEntity.toString());
		System.out.println("toss pay 요청 03-2  "+resEntity.getCarpoolEntity());
		
		URL url = null;
		URLConnection connection = null;
		StringBuilder responseBody = new StringBuilder();
		
		try {

			//연결할 url connection
			url = new URL("https://pay.toss.im/api/v1/payments");
			connection = url.openConnection();
			connection.addRequestProperty("Content-Type", "application/json;charset=utf-8");
			connection.setDoOutput(true);
			connection.setDoInput(true);
			
			//ResponseEntity<TossRequestVO> tossEntityVo;			
			//System.out.println("toss pay 요청 03  "+tossEntityVo);
			
			//TossRequestVO 객체에 Toss server 로 전달할 데이터 삽입
			TossRequestVO tossVO = new TossRequestVO();
			
			tossVO.setOrderNo(Long.toString(resEntity.getR_idx())+System.nanoTime());
			tossVO.setAmount(resEntity.getCarpoolEntity().getD_fee());
			tossVO.setAmountTaxFree(0);
			tossVO.setProductDesc("연차 카풀 서비스");
			tossVO.setApiKey("sk_test_apikey1234567890");
			tossVO.setAutoExecute(true);
			tossVO.setResultCallback("https://localhost:8080/parclient/toss/success.jsp?r_idx="+r_idx); //결제 성공시 : 가맹점에서 autoexeccute=false 시에만 호출됨
			tossVO.setRetUrl("http://localhost:8080/parclient/toss/success.jsp?r_idx="+r_idx); //결제 완료 시 페이지 
			tossVO.setRetCancelUrl("http://localhost:8080/parclient/kakao/fail.jsp?r_idx="+r_idx); //결제 실패 or 취소 
			
			System.out.println("toss pay 요청 04  "+tossVO.toString());
			
			//tossEntityVo = new ResponseEntity<TossRequestVO>(tossVO, HttpStatus.OK);
			//System.out.println("toss pay 요청 05  "+tossEntityVo);
			
			//자바 객체인 tossVO를 json 객체로 변경
			String json = new ObjectMapper().writeValueAsString(tossVO);			
			System.out.println("toss pay 요청 05  "+json.toString());

			//output stream 이용하여 연결된 url connection에 json 객체 넘겨주기
			BufferedOutputStream bos = new BufferedOutputStream(connection.getOutputStream());
			bos.write(json.toString().getBytes(StandardCharsets.UTF_8));
			bos.flush();
			bos.close();

			//input stream 통해서 결제 결과 받아오기 
			BufferedReader br = new BufferedReader(
					new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));
			String line = null;
			while ((line = br.readLine()) != null) {
				//tossRequestVo = line;
				responseBody.append(line);
				System.out.println("toss pay 요청 06  "+responseBody.toString());
			}
			br.close();
		} catch (Exception e) {
			responseBody.append(e);
		}
		
		System.out.println("toss pay 요청 07  " + responseBody.toString());
		
		String str = responseBody.toString();
		System.out.println("toss pay 요청 08  " + str);
		
		return str;
	}
	
	

}
