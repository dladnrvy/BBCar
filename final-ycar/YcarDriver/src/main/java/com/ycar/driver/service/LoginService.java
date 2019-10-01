package com.ycar.driver.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.driver.dao.DriverDao;
import com.ycar.driver.model.Driver;
import com.ycar.driver.model.LoginDriverInfo;
import com.ycar.driver.model.Route;

/*-------------------
 * 파일이름: LoginService.java
 * 파일설명: SERVER side - 로그인 service 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 생성일자: 2019-09-20 오전 10시 09분
 * 최종수정일자: 2019-09-20 오전 10시 09분
 * 최종수정자: 김나연
 * 최종수정내용: 최초 작성
 * 
 * @loginDriverSimple : 로그인(간편가입자 로그인 처리)
 * 1 탈퇴혹은검색결과없음
 * 2 비밀번호 불일치
 * 3 비밀번호 찾기 신청한 회원(==임시비밀번호 발송)
 * 4 정상로그인 및 인증처리 완료
 * 
 * -------------------*/

@Service("loginService")
public class LoginService {

	@Autowired
	private SqlSessionTemplate template;
	private DriverDao dao;

	@Autowired
	private AuthService authService;

	// 로그인프로세스
	public Map<String, Object> loginDriverSimple(String id, String pw) {

		Map<String, Object> map = new HashMap<String, Object>();

		dao = template.getMapper(DriverDao.class);
		Driver driver = dao.selectById(id);
		
		if (driver == null || driver.getSignout() == 'Y') {
			// 탈퇴 혹은 검색결과 없음
			map.put("msg", 1);
		} else if (!driver.matchPW(pw)) {
			// 비밀번호 불일치
			map.put("msg", 2);
		} else if (driver.matchPW(pw) && driver.getVerify().equals("N")) {
			// 임시번호발송된회원 비밀번호변경하라고 말해줘야 함

			// 기본정보
			LoginDriverInfo loginInfo = new LoginDriverInfo(driver.getD_idx(), driver.getId(), driver.getName(),driver.getNickname());

			map.put("msg", 3);
			map.put("loginInfo", loginInfo);

		} else if (driver.matchPW(pw) && driver.getVerify().equals("Y")) {
			// 인증처리완료, 정상로그인

			// 기본정보
			LoginDriverInfo loginInfo = new LoginDriverInfo(driver.getD_idx(), driver.getId(), driver.getName(),driver.getNickname());

			map.put("msg", 4);
			map.put("loginInfo", loginInfo);
		}

		return map;
	}
	
	//카카오로그인
	public Map<String, Object> loginDriverKakao(String id) {
		dao = template.getMapper(DriverDao.class);
		Driver driver = dao.selectById(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(driver == null || driver.getSignout() == 'Y' ) {
			map.put("msg", 1);
		
		} else {
			LoginDriverInfo loginInfo = new LoginDriverInfo(driver.getD_idx(), driver.getId(), driver.getName(),driver.getNickname());
			map.put("msg", 2);
			map.put("loginInfo", loginInfo);
		}
		
		return map;
		
	}

	// 아이디찾기
	public String findID(String name, String email) {
		String result = null;

		dao = template.getMapper(DriverDao.class);
		Driver driver = dao.selectByName(name);
		System.out.println("server 서비스:::: 아이디 찾기 들어옴? " + driver);

		// 간단회원가입자 + 이름 이메일 일치시
		if (driver.getType().equals("S") && driver.findID(name, email)) {
			String id = driver.getId();
			result = getPersonalizeId(id);
		}
		
		System.out.println("server 서비스:::: 아이디 암호화 됨?" + result);
		return result;
	}
	
	//ID 암호화하기
	public String getPersonalizeId(String id) {
		// id 문자열 부분 치환 맨앞자리 3개 + *** + 맨 뒷자리 1개

		StringBuffer personalizedID = new StringBuffer();
		personalizedID.append(id.substring(0, 3));
		
		for(int i = 0; i < id.length() - 4 ; i++ ) {
			personalizedID.append("*");
		}
		
		personalizedID.append(id.substring(id.length() -1));
		
		return personalizedID.toString();
	}

	// 패스워드 찾기
	public String findPW(String id, String email) {
		String result = "fail";

		dao = template.getMapper(DriverDao.class);
		Driver driver = dao.selectById(id);
		System.out.println("server 서비스:::: 패스워드 찾기 들어옴? " + driver);

		// 간단회원가입자 + 아이디 이메일 일치시
		if (driver.getType().equals("S") && driver.findPW(id, email)) {
			driver.randomCode();
			String code = driver.getCode();
			System.out.println("code 제대로 되었나,, " + code);

			authService.sendPW(email, code);
			System.out.println("--- 메일보냄,, ---");

			int cnt = 0;
			cnt = dao.updateFindPW(code, driver.getD_idx());
			System.out.println("pw 제대로 업데이트됨?? " + cnt);

			if (cnt > 0) {
				result = "success";
			}
		}

		return result;
	}

}
