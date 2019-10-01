package com.ycar.driver.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.driver.model.Driver;
import com.ycar.driver.model.EditDriverMyInfo;
import com.ycar.driver.model.Route;
import com.ycar.driver.service.MyPageService;

/*-------------------
 * 파일이름: MyPageController.java
 * 파일설명: SERVER side - 마이페이지 controller 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 최종수정일자: 2019-09-20 오전 10시 09분
 * 최종수정자: 김나연
 * 최종수정내용: 최초 작성
 * 
 * @getMyPage: 로그인한 회원(==세션에 저장된 회원)의 정보를 검색, 가져오기
 * @editMyInfo: 개인 이메일 혹은 차량관련 정보 및 선호운전환경 변경 시
 * -------------------*/

@RestController
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	
	@CrossOrigin
	@GetMapping(value = "/{idx}")
	public Map<String, Object> getMyPage(@PathVariable("idx")int idx){
		
		System.out.println("서버:: idx " + idx);
		Map<String, Object> map = new HashMap<String, Object>();
		map = mypageService.showMyPage(idx);
		
		System.out.println("서버:: map " + map);
		
		return map;
	}
	
	
	//수정 (운전옵션 혹은 개인이메일)
	@CrossOrigin
	@PutMapping(value = "/{idx}")
	public int editMyInfo(@PathVariable("idx")int idx, @RequestBody EditDriverMyInfo driver){
		return mypageService.editMyInfo(idx, driver);
	}
	
	//---------- 비밀번호 변경 관련 ---------- 
	//현재 패스워드 맞는지 확인~
	
	@CrossOrigin
	@PostMapping("/chkpw")
	public int checkMyCurPW(@RequestBody Driver driver) {
		
		int idx = driver.getD_idx();
		String pw = driver.getPw();
		
		return mypageService.checkMyCurPW(idx, pw);
	}
	
	@CrossOrigin
	@PutMapping("/chkpw")
	public int updateMyPW(@RequestBody Driver driver) {
		
		int idx = driver.getD_idx();
		String pw = driver.getPw();
		return mypageService.updateMyPW(idx, pw);
	}
}
