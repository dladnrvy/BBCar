package com.ycar.driver.client.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.ws.spi.http.HttpHandler;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.ycar.driver.client.domain.EditDriverMyInfo;
import com.ycar.driver.client.domain.EditDriverPW;
/*-------------------
 * 파일이름: MyPageController.java
 * 파일설명: CLIENT side - 마이페이지 controller 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 생성일자: 2019-09-20 오전 10시 09분
 * 최종수정일자: 2019-09-20 오전 10시 09분
 * 최종수정자: 김나연
 * 최종수정내용: 최초 작성
 * 
 * @getMyPage: 로그인한 회원(==세션에 저장된 회원)의 정보를 검색, 가져오기
 * @editMyInfo: 개인 이메일 혹은 차량관련 정보 및 선호운전환경 변경 시
 * -------------------*/
@Controller
@RequestMapping("/mypage")
public class MyPageController {

		//내정보 페이지
		@RequestMapping(method = RequestMethod.GET)
		public String showMyPage() {
			
			return "mypage/form";
		}
		
		//비밀번호변경 페이지
		@RequestMapping(method = RequestMethod.GET, value = "/changePW")
		public String showChangePWPage() {
			return "mypage/changePW";
		}
	
		//마이페이지에 내 정보 전체 넘겨주기
		@GetMapping(value = "/{idx}")
		@RequestMapping(value = "/{idx}", method = RequestMethod.GET)
		public @ResponseBody ResponseEntity<String> getMyPage(@PathVariable("idx")int idx){
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<String> entity = new HttpEntity<String>(headers);
			
			System.out.println("GET client:: idx " + idx);
			System.out.println("GET client:: entity " + entity);
			
			
			RestTemplate template = new RestTemplate();
			
			return
			template.exchange("http://13.209.40.5:8080/driver/mypage/"+idx, HttpMethod.GET, entity, String.class, idx);
//			template.exchange("http://localhost:8080/driver/mypage/"+idx, HttpMethod.GET, entity, String.class, idx);
		}
		
		//마이페이지 수정
		@RequestMapping(method = RequestMethod.PUT)
		public @ResponseBody ResponseEntity<String> editMyInfo(@RequestBody EditDriverMyInfo driver){
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<EditDriverMyInfo> entity = new HttpEntity<EditDriverMyInfo>(driver, headers);
			int idx = driver.getD_idx();
			System.out.println("PUT client:: idx " + idx);
			System.out.println("PUT client:: entity " + entity);
			
			RestTemplate template = new RestTemplate();
			
			return template.exchange("http://13.209.40.5:8080/driver/mypage/"+idx, HttpMethod.PUT, entity, String.class, idx);
//			return template.exchange("http://localhost:8080/driver/mypage/"+idx, HttpMethod.PUT, entity, String.class, idx);
		}
		
		
		//---------- 비밀번호 변경 관련 ---------- 
		//현재 패스워드 맞는지 확인~
		@RequestMapping(value = "/chkpw" , method = RequestMethod.POST)
		public @ResponseBody ResponseEntity<String> checkMyCurPW(@RequestBody EditDriverPW driver){
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<EditDriverPW> entity = new HttpEntity<EditDriverPW>(driver, headers);
			
			RestTemplate template = new RestTemplate();
			
			return template.exchange("http://13.209.40.5:8080/driver/mypage/chkpw", HttpMethod.POST, entity, String.class);
//			return template.exchange("http://localhost:8080/driver/mypage/chkpw", HttpMethod.POST, entity, String.class);
		}
		//비밀번호 변경
		@RequestMapping(value = "/chkpw" , method = RequestMethod.PUT)
		public @ResponseBody ResponseEntity<String> updateMyPW(@RequestBody EditDriverPW driver){
			HttpHeaders headers = new HttpHeaders();
			headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
			HttpEntity<EditDriverPW> entity = new HttpEntity<EditDriverPW>(driver, headers);
			
			RestTemplate template = new RestTemplate();
			
			return template.exchange("http://13.209.40.5:8080/driver/mypage/chkpw", HttpMethod.PUT, entity, String.class);
//			return template.exchange("http://localhost:8080/driver/mypage/chkpw", HttpMethod.PUT, entity, String.class);
		}
}
