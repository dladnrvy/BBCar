package com.ycar.driver.dao;


import java.util.List;
import java.util.Map;

import com.ycar.driver.model.Driver;
import com.ycar.driver.model.DriverOE;
import com.ycar.driver.model.DriverOP;
import com.ycar.driver.model.DriverSE;
import com.ycar.driver.model.DriverSP;
import com.ycar.driver.model.Route;

public interface DriverDao {
	public Driver selectById(String id);
	public Driver selectByIdx(int idx);
	public Driver selectByName(String name);
	
	
	public int insertDriverSE(DriverSE se);
	public int insertDriverSP(DriverSP sp);
	
	public int insertDriverOE(DriverOE oe);
	public int insertDriverOP(DriverOP op);
	
	public List<Route> selectRoute(int idx);
	
	/**
	 * :::업데이트:::
	 * */
	public int updateMyInfo(Map<String, Object> params); //경로 제외 내정보 
	public int updateRoute(Map<String, Object> params); //선호 경로 
//	public int updateCompanyInfo(Map<String, Object> params); //직장변경시 인증 다시 받기
	
	public int updateFindPW(String pw, int d_idx);
	public int updatePW(String pw, int d_idx);
	
}
