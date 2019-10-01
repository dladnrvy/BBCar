package com.ycar.driver.client.controller;

import java.util.Arrays;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import com.ycar.driver.client.domain.DriverInfo;

@Controller
@RequestMapping("/join")
public class JoinController {

	@RequestMapping(method = RequestMethod.GET)
	public String page() {
		return "join/form";
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public ResponseEntity<String> join(@RequestBody DriverInfo driverInfo){
		System.out.println("=====client =====" + driverInfo);
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
		HttpEntity<DriverInfo> entity = new HttpEntity<DriverInfo>(driverInfo, headers);
		
		RestTemplate template = new RestTemplate();
//		int result = template.postForObject("http://localhost:8080/driver/join",	driverInfo, Integer.class);
//		System.out.println("잘들어갔니 4 ====" + result);
//		return new ResponseEntity<String>(result>0 ? "success":"fail",HttpStatus.OK);

		
//		return template.exchange("http://13.209.40.5:8080/driver/join", HttpMethod.POST, entity, String.class);
		return template.exchange("http://localhost:8080/driver/join", HttpMethod.POST, entity, String.class);
	}
}
