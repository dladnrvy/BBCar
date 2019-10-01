package com.ycar.driver.model;
/**
 * 재직증명서인증+일반가입 외
 * */
public class DriverOP extends DriverP{
	private String id;
	private String email; //없을수도
	public DriverOP(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option, String cnum, String id, String email) {
		super(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype,
				d_option, cnum);
		this.id = id;
		this.email = email;
	}
	@Override
	public String toString() {
		return "DriverOP [id=" + id + ", email=" + email + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
