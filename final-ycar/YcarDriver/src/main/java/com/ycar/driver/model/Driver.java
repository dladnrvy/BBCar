package com.ycar.driver.model;

import java.util.Random;

/**
 * ID 중복 체크 + 마이페이지 용 클래스
 */
public class Driver {

	private int d_idx;
	private String type;
	private String id;
	private String pw;
	private String name;
	private String nickname;
	private char gender;

	private String verify;
	private String code;
	private String email;
	private char signout;

	private String ctype;
	private String company;
	private String cemail;
	private String cnum;

	private String lscnum;
	private String idnum1;
	private String idnum2;
	private char lsctype;
	private String sdate;
	private String police;
	private String carnum;
	private String cartype;

	private String d_option;
	
	@Override
	public String toString() {
		return "Driver [d_idx=" + d_idx + ", type=" + type + ", id=" + id + ", pw=" + pw + ", name=" + name
				+ ", nickname=" + nickname + ", gender=" + gender + ", verify=" + verify + ", code=" + code + ", email="
				+ email + ", signout=" + signout + ", ctype=" + ctype + ", company=" + company + ", cemail=" + cemail
				+ ", cnum=" + cnum + ", lscnum=" + lscnum + ", idnum1=" + idnum1 + ", idnum2=" + idnum2 + ", lsctype="
				+ lsctype + ", sdate=" + sdate + ", police=" + police + ", carnum=" + carnum + ", cartype=" + cartype
				+ ", d_option=" + d_option  + "]";
	}

	public Driver() {
	}
	
	

	public Driver(int d_idx, String type, String id, String pw, String name, String nickname, char gender, String verify,
			String code, String email, char signout, String ctype, String company, String cemail, String cnum,
			String lscnum, String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum,
			String cartype, String d_option) {
		this.d_idx = d_idx;
		this.type = type;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.verify = verify;
		this.code = code;
		this.email = email;
		this.signout = signout;
		this.ctype = ctype;
		this.company = company;
		this.cemail = cemail;
		this.cnum = cnum;
		this.lscnum = lscnum;
		this.idnum1 = idnum1;
		this.idnum2 = idnum2;
		this.lsctype = lsctype;
		this.sdate = sdate;
		this.police = police;
		this.carnum = carnum;
		this.cartype = cartype;
		this.d_option = d_option;
	}

	public boolean matchPW(String pw) {
		return pw != null && !pw.isEmpty() && this.pw.equals(pw);
	}
	
	public boolean findID(String name, String email) {
		return name != null && email != null && !name.isEmpty() && !email.isEmpty() && this.name.equals(name) && this.email.equals(email);
	}
	public boolean findPW(String id, String email) {
		return id != null && email != null && !id.isEmpty() && !email.isEmpty() && this.id.equals(id) && this.email.equals(email);
	}

	public void randomCode() {
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 10; i++) {
			int idx = rnd.nextInt(3);

			switch (idx) {
			case 0: // a to z
				temp.append((char) (rnd.nextInt(26) + 97));
				break;
			case 1: // A to Z
				temp.append((char) (rnd.nextInt(26) + 65));
				break;
			case 2: // 0 to 9
				temp.append(rnd.nextInt(10));
				break;
			}
		}
		System.out.println("===난수코드생성===" + temp);
		setCode(temp.toString());
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getVerify() {
		return verify;
	}

	public void setVerify(String verify) {
		this.verify = verify;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public char getSignout() {
		return signout;
	}

	public void setSignout(char signout) {
		this.signout = signout;
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

	public String getCartype() {
		return cartype;
	}

	public void setCartype(String cartype) {
		this.cartype = cartype;
	}

	public String getD_option() {
		return d_option;
	}

	public void setD_option(String d_option) {
		this.d_option = d_option;
	}


}
