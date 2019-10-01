package com.ycar.pClient.controller;

import java.util.Arrays;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.ycar.pClient.domain.JoinInfo;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	// 회원가입 페이지 로딩
	@GetMapping
	public String page() {
		return "join";
	}
	

	@PostMapping
	@ResponseBody
	public ResponseEntity<String> join(@RequestBody JoinInfo joinInfo) {
		System.out.println("client controller --- JoinInfo ::: "+joinInfo);
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<JoinInfo> entity = new HttpEntity<JoinInfo>(joinInfo, headers);

		RestTemplate template = new RestTemplate();
		// int result = template.postForObject("http://localhost:8080/driver/join", driverInfo, Integer.class);
		// System.out.println("잘들어갔니 4 ====" + result);
		// return new ResponseEntity<String>(result>0 ? "success":"fail",HttpStatus.OK);
		return template.exchange("http://localhost:9090/passenger/members/join", HttpMethod.POST, entity, String.class);
	}

}
