package com.ycar.passenger.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;  
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.passenger.service.LoginService;

@RestController
@CrossOrigin
@RequestMapping("/members/login")
public class LoginController {

	@Autowired
	private LoginService loginService;

	// 로그인
	@PostMapping
	public Map<String, Object> login(@RequestBody Map<String,String> map) {

		String id = map.get("id");
		String pw = map.get("pw");
				
		Map<String, Object> maps = new HashMap<String, Object>();
		maps = loginService.login(id, pw);

		return maps;
	}

	// 카카오 로그인
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Map<String, Object> kakaoLogin(@PathVariable("id") String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map = loginService.kakaoLogin(id);

		return map;
	}

	// 아이디 찾기
	@PostMapping("/findId")
	public int findId(@RequestBody MultiValueMap<String,String> map) {

		String name = map.getFirst("name");
		String email = map.getFirst("email");
		
		int result = loginService.findId(name, email);

		return result;
	}

	// 비밀번호 찾기
	@PostMapping("/findPw")
	public int findPw(@RequestBody Map<String,String> map) {
		
		String name = map.get("name");
		String email = map.get("email");
		
		int result = loginService.findPw(name, email);

		return result;
	}
	
}
