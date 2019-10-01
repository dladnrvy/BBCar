package com.ycar.driver.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.driver.dao.DriverDao;
import com.ycar.driver.model.Driver;
import com.ycar.driver.model.EditDriverMyInfo;
import com.ycar.driver.model.Route;


/*-------------------
 * 파일이름: MyPageService.java
 * 파일설명: SERVER side - 마이페이지 service 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 최종수정일자: 2019-09-20 오전 10시 09분
 * 최종수정자: 김나연
 * 최종수정내용: 최초 작성
 * 
 * @showMyPage: 로그인한 회원(==세션에 저장된 회원)의 정보를 검색, 가져오기
 * @editMyInfo: 개인 이메일 혹은 차량관련 정보 및 선호운전환경 변경 시
 * -------------------*/


@Service(value = "mypageService")
public class MyPageService {
	
	@Autowired
	private SqlSessionTemplate template;
	private DriverDao dao;
	

	//mypage에 개인정보 및 즐찾경로 모두 불러오기
	public Map<String, Object> showMyPage(int idx){
		dao = template.getMapper(DriverDao.class);
		Driver driver = dao.selectByIdx(idx);
		List<Route> myrouteList = dao.selectRoute(idx);

//		System.out.println("------ mypage service-----------");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("myinfo", driver);
		map.put("myroute", myrouteList);
		
//		System.out.println("route 들어가는가?"+map.get("myroute"));
		
		return map;
	}
	
	//수정 (운전옵션 혹은 개인이메일, 본인 차 관련)
	public int editMyInfo(int idx, EditDriverMyInfo driver) {
		int result = 0;
		
		dao = template.getMapper(DriverDao.class);
		Map<String, Object> params = new HashMap<String, Object>();
			params.put("d_idx", idx);
			params.put("email", driver.getEmail());
			params.put("d_option", driver.getD_option());
			
			params.put("cartype", driver.getCartype());
			params.put("carnum", driver.getCarnum());
		
		result = dao.updateMyInfo(params);
		
		return result;
	}
	
	//비밀번호 변경 전 비밀번호 맞는지 확인
	public int checkMyCurPW(int idx, String pw) {
		int result = 0;
		
		dao = template.getMapper(DriverDao.class);
		
		Driver driver = dao.selectByIdx(idx);
		if(driver.matchPW(pw)) {
			result = 1;
		}
		
		return result;
	}
	
	//비밀번호 변경
	public int updateMyPW(int idx, String pw) {
		int result = 0;
		dao = template.getMapper(DriverDao.class);
		result = dao.updatePW(pw, idx);
		return result;
	}

}
