package com.ycar.driver.client.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.ycar.driver.client.domain.LoginDriverInfo;
import com.ycar.driver.client.domain.LoginDriverSearch;

/*-------------------
 * 파일이름: LoginController.java
 * 파일설명: CLIENT side - 로그인 controller 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 생성일자: 2019-09-20 오전 10시 09분
 * 최종수정일자: 2019-09-20 오전 10시 09분
 * 최종수정자: 김나연
 * 최종수정내용: 최초 작성
 * 
 * @login : 로그인(간편가입자 로그인 처리)
 * -------------------*/

@Controller
public class LoginController {
	
	//로그인폼으로 페이지이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String page() {
		return "login/form";
	}
	
	
	//로그인
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public int login(@RequestBody LoginDriverSearch search, HttpServletRequest request){
		RestTemplate template = new RestTemplate();
		
		Map<String, Object> maps = new HashMap<String, Object>();
		maps = template.postForObject("http://13.209.40.5:8080/driver/login", search, Map.class);
//		maps = template.postForObject("http://localhost:8080/driver/login", search, Map.class);
		
		int msg = (int) maps.get("msg");
		
		//pw 맞은 애들 세션처리
		if(msg == 4 || msg ==3) {
			System.out.println("세션처리시작");
			HttpSession session = request.getSession(false); 
			LoginDriverInfo loginInfo = setSessionLoginInfo(maps);

			session.setAttribute("loginInfo", loginInfo);
			System.out.println("세션처리완료?  - 기본정보 -  " + loginInfo);
		}
		return msg;
	}
	
	//카카오 로그인
	@ResponseBody
	@RequestMapping(value = "/login/kakao/{id}", method = RequestMethod.POST)
	public int login(@PathVariable("id") String id, HttpServletRequest request ) {
		int msg = 0;
		RestTemplate template = new RestTemplate();
		
		Map<String, Object> maps = new HashMap<String, Object>();
//		maps = template.getForObject("http://13.209.40.5:8080/driver/login/kakao"+id, Map.class, id);
		maps = template.getForObject("http://localhost:8080/driver/login/kakao/"+id, Map.class, id);
		msg = (int) maps.get("msg");
		
		if(msg == 2) {
			System.out.println("세션처리시작");
			HttpSession session = request.getSession(false); 
			LoginDriverInfo loginInfo = setSessionLoginInfo(maps);
			
			session.setAttribute("loginInfo", loginInfo);
			System.out.println("세션처리완료?  - 기본정보 -  " + loginInfo);
		}
		return msg ;
	}
	
	
	//session을 위한 loginInfo 설정하기
	public LoginDriverInfo setSessionLoginInfo(Map<String, Object> maps) {
		LinkedHashMap<String, Object> loginMap = (LinkedHashMap<String, Object>) maps.get("loginInfo");
		
		LoginDriverInfo loginInfo = new LoginDriverInfo(
				(int)loginMap.get("d_idx"),
				(String) loginMap.get("id"),
				(String) loginMap.get("name"),
				(String) loginMap.get("nickname")
				);
		return loginInfo;
	}
	
	//아이디찾기
	@RequestMapping(value = "/login/findID", method = RequestMethod.POST)
	public ResponseEntity<String> findID(@RequestBody LoginDriverSearch search){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<LoginDriverSearch> entity = new HttpEntity<LoginDriverSearch>(search, headers);
		
		System.out.println("client ::: entity  "+entity);
		
		RestTemplate template = new RestTemplate();
		ResponseEntity<String> result= 
				template.exchange("http://13.209.40.5:8080/driver/login/findID", HttpMethod.POST, entity, String.class);
//		template.exchange("http://localhost:8080/driver/login/findID", HttpMethod.POST, entity, String.class);
		
		return result;
	}
	
	//비밀번호찾기
	@RequestMapping(value = "/login/findPW", method = RequestMethod.POST)
	public ResponseEntity<String> findPW(@RequestBody LoginDriverSearch search){
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<LoginDriverSearch> entity = new HttpEntity<LoginDriverSearch>(search, headers);
		
		RestTemplate template = new RestTemplate();
		
		return template.exchange("http://13.209.40.5:8080/driver/login/findPW", HttpMethod.POST, entity, String.class);
//		return template.exchange("http://localhost:8080/driver/login/findPW", HttpMethod.POST, entity, String.class);
	}
	
}
