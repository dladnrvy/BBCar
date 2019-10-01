package com.parboot.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.parboot.domain.TestVO;
import com.parboot.domain.TossRequestVO;

@RestController
public class TestController {
	
	@GetMapping("/boottest/{idx}")
	@CrossOrigin
	public ResponseEntity<TestVO> test(@PathVariable("idx") String idx) {
		
		System.out.println("idx from toss test  "+idx);
		
		TestVO voTest = new TestVO();
		
		voTest.setUsername("user01");
		voTest.setPassword(idx);
			
		return new ResponseEntity<TestVO>(voTest, HttpStatus.OK);
	}
	
	@PostMapping("/boottest/{idx}")
	@CrossOrigin
	public ResponseEntity<TestVO> testPost(@PathVariable("idx") String idx) {
		
		System.out.println("idx from toss test  "+idx);
		
		TestVO voTest = new TestVO();
		
		voTest.setUsername("user02");
		voTest.setPassword(idx);
			
		return new ResponseEntity<TestVO>(voTest, HttpStatus.OK);
	}
	
	
	 
}
