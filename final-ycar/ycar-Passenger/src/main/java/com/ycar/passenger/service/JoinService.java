package com.ycar.passenger.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.passenger.dao.PassengerDao;
import com.ycar.passenger.domain.JoinInfo;
import com.ycar.passenger.domain.PassengerSE;
import com.ycar.passenger.domain.PassengerSP;

@Service(value = "joingService")
public class JoinService {

	@Autowired
	private SqlSessionTemplate template;
	private PassengerDao dao;

	// 회원가입
	public int join(JoinInfo joinInfo) {
		dao = template.getMapper(PassengerDao.class);
		int result = 0;

		System.out.println("들어오긴하니" + joinInfo);
		// 회사인증 E
		if (joinInfo.getCtype().equals("E")) {

			// 간단가입시
			if (joinInfo.getType().equals("S")) {
				PassengerSE se = joinInfo.toPassengerSE();
				System.out.println("joinInfo.toPassengerSE()"+se);
				result = dao.insertPassengerSE(se);
				System.out.println("잘 들어갔니 ==========" + result);
			}

		// 회사인증 P
		} else if (joinInfo.getCtype().equals("P")) {

			// 간단가입시
			if (joinInfo.getType().equals("S")) {
				PassengerSP sp = joinInfo.toPassengerSP();
				result = dao.insertPassengerSP(sp);
				System.out.println("잘 들어갔니 ==========" + result);
			}

		}
		System.out.println("잘들어갔니2 ======" + result);
		return result;
	}

	// 중복 ID 체크
	public String idCheck(String id) {
		dao = template.getMapper(PassengerDao.class);
		String chk = dao.selectById(id) == null ? "Y" : "N";
		return chk;
	}

}
