package com.ycar.driver.model;
/**
 * 이메일인증+일반가입 외(카카오/네이버/구글)
 * */
public class DriverOE extends DriverE{
	private String id;
	private String email; //없을수도있음

	public DriverOE(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option, String cemail, String id, String email) {
		super(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype,
				d_option, cemail);
		this.id = id;
		this.email = email;
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
	@Override
	public String toString() {
		return "DriverOE [id=" + id + ", email=" + email + "]";
	}
	
	
}
