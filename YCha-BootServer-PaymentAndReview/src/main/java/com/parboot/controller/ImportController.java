package com.parboot.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.parboot.service.ImportService;

@RestController
@RequestMapping("/parboot/payment/import")
public class ImportController {
	
	@Autowired
	private ImportService importService;
	
	@GetMapping("/r_idx/{r_idx}")
	@CrossOrigin
	public ResponseEntity<Map<String, Object>> importRequest(@PathVariable("r_idx") long r_idx) {		
		System.out.println("kg inisis로 결제 요청 02" + r_idx);
		return new ResponseEntity<Map<String,Object>>(importService.importRequest(r_idx), HttpStatus.OK);
	}
}
