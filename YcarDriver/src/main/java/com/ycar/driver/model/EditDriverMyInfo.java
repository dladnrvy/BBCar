package com.ycar.driver.model;
/**
 * MyPage 내에서
 * 개인정보 변경시 :: Driver 테이블에 있는 정보만,,
 * */
public class EditDriverMyInfo {
	private int d_idx;
	private String d_option;
	private String email;
	private String cartype;
	private String carnum;
	
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getD_option() {
		return d_option;
	}
	public void setD_option(String d_option) {
		this.d_option = d_option;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCartype() {
		return cartype;
	}
	public void setCartype(String cartype) {
		this.cartype = cartype;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	
	
}
