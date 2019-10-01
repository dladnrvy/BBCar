package com.ycar.driver.model;
/**
 * 재직증명서인증+일반가입
 * */
public class DriverSP extends DriverP {
	private String id;
	private String pw;

	private String email;
	
	//생성자
	public DriverSP() {
	}
	
	

	public DriverSP(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option, String cnum, String id, String pw, String email) {
		super(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype,
				d_option, cnum);
		this.id = id;
		this.pw = pw;
		this.email = email;
	}



	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}
