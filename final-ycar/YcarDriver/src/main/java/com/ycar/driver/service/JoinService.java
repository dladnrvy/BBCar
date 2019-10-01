package com.ycar.driver.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.driver.dao.DriverDao;
import com.ycar.driver.model.DriverInfo;
import com.ycar.driver.model.DriverOE;
import com.ycar.driver.model.DriverOP;
import com.ycar.driver.model.DriverSE;
import com.ycar.driver.model.DriverSP;

@Service(value = "joinService")
public class JoinService {
	@Autowired
	private SqlSessionTemplate template;
	private DriverDao dao;
	
	public int joinDriver(DriverInfo driverInfo) {
		dao = template.getMapper(DriverDao.class);
		int result = 0;
		
		System.out.println("들어오긴하니" + driverInfo);
		//회사인증 E
		if(driverInfo.getCtype().equals("E")) {

			//간단가입시
			if(driverInfo.getType().equals("S")) {
				DriverSE se = driverInfo.toDriverSE();
				System.out.println(se);
				result = dao.insertDriverSE(se);
				
			} else {
				DriverOE oe = driverInfo.toDriverOE();
				System.out.println(oe);
				result = dao.insertDriverOE(oe);
			}
			
		//회사인증 P
		}else if(driverInfo.getCtype().equals("P")) {
			
			//간단가입시
			if(driverInfo.getType().equals("S")) {
				DriverSP sp = driverInfo.toDriverSP();
				result = dao.insertDriverSP(sp);
			
			} else {
				DriverOP op = driverInfo.toDriverOP();
				System.out.println(op);
				result = dao.insertDriverOP(op);
			}
			
		}
		System.out.println("잘들어갔니2 ======" + result);
		return result;
	}
	
	//id 중복 확인
	public String idCheck(String id) {
		dao = template.getMapper(DriverDao.class);
		String chk = dao.selectById(id)==null? "Y":"N";
		return chk;
	}
}
