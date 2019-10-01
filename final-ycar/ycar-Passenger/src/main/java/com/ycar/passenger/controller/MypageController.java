package com.ycar.passenger.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.passenger.service.MypageService;

@RestController
@CrossOrigin
@RequestMapping("/members/mypage")
public class MypageController {

	@Autowired
	private MypageService mypageService;

	@PutMapping
	public int changeInfo(@RequestBody Map<String,String> map) {

		int result = mypageService.changeInfo(map.get("id"),map.get("pw1"),map.get("pw2"));
		
		return result;
	}
}
