package com.ycar.driver.client.domain;

import java.util.Date;

/**
 * 파일설명: 가입시 client 쪽에서 전체 정보 info 받아오는 객체임.
 */

public class DriverInfo {
	private int d_idx;
	private String type;

	private String id;
	private String pw;
	private String email;

	private String ctype;
	private String company;
	private String cemail;
	private String cnum;

	private String lscnum;
	private String name;
	private String idnum1;
	private String idnum2;
	private char lsctype;
	private String sdate;
	private String police;
	private String carnum;
	private char cartype;

//	private String nickname;
	private char gender;

	private String d_option;

	
	//생성자
	public DriverInfo() {
	}
	
	
	@Override
	public String toString() {
		return "DriverInfo [d_idx=" + d_idx + ", type=" + type + ", id=" + id + ", pw=" + pw + ", email=" + email
				+ ", ctype=" + ctype + ", company=" + company + ", cemail=" + cemail + ", cnum=" + cnum + ", lscnum="
				+ lscnum + ", name=" + name + ", idnum1=" + idnum1 + ", idnum2=" + idnum2 + ", lsctype=" + lsctype
				+ ", sdate=" + sdate + ", police=" + police + ", carnum=" + carnum + ", cartype=" + cartype
				+ ", gender=" + gender + ", d_option=" + d_option + "]";
	}


//	//E인증 + 간단가입
//	public DriverSE toDriverSE() {
//		DriverSE d = new DriverSE(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype, d_option, cemail, id, pw, email);
//		return d;
//	}
//	
//	
//	//P인증 + 간단가입
//	public DriverSP toDriverSP() {
//		DriverSP s = new DriverSP(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype, d_option, cnum, id, pw, cemail);
//		return s;
//	}
	
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	public String getLscnum() {
		return lscnum;
	}
	public void setLscnum(String lscnum) {
		this.lscnum = lscnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdnum1() {
		return idnum1;
	}
	public void setIdnum1(String idnum1) {
		this.idnum1 = idnum1;
	}
	public String getIdnum2() {
		return idnum2;
	}
	public void setIdnum2(String idnum2) {
		this.idnum2 = idnum2;
	}
	public char getLsctype() {
		return lsctype;
	}
	public void setLsctype(char lsctype) {
		this.lsctype = lsctype;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getPolice() {
		return police;
	}
	public void setPolice(String police) {
		this.police = police;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public char getCartype() {
		return cartype;
	}
	public void setCartype(char cartype) {
		this.cartype = cartype;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getD_option() {
		return d_option;
	}
	public void setD_option(String d_option) {
		this.d_option = d_option;
	}


	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}
