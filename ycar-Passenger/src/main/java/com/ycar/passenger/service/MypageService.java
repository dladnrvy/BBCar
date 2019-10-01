package com.ycar.passenger.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.passenger.dao.PassengerDao;
import com.ycar.passenger.domain.PassengerInfo;

@Service("mypageService")
public class MypageService {

	@Autowired
	private SqlSessionTemplate template;
	private PassengerDao dao;

	public int changeInfo(String id, String pw1, String pw2) {

		dao = template.getMapper(PassengerDao.class);

		// 기존 비밀번호랑 일치하는지 확인
		PassengerInfo info = dao.selectById(id);

		if (pw1.equals(info.getPw())) {
			// 일치 : 새로운 비밀번호로 update
			Map<String, String> map = new HashMap<String, String>();
			map.put("id", id);
			map.put("pw", pw2);
			int result = dao.updatePw(map);

			// 임시비밀번호 변경했으므로 --> verify = Y으로 변경
			Map<String, String> map1 = new HashMap<String, String>();
			map1.put("verify", "Y");
			map1.put("id", id);
			dao.changeVer(map1);

			return result > 0 ? 1 : 2; // 성공적으로 업데이트 : 1리턴, 오류 : 2리턴
		}

		// 불일치 : 0 리턴
		return 0;
	}

}
