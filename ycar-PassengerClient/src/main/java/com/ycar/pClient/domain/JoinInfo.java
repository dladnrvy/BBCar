package com.ycar.pClient.domain;

/**
 * 파일설명: 가입시 client 쪽에서 전체 정보 info 받아오는 객체임.
 */
public class JoinInfo {
	private int p_idx;
	private String type; // --

	private String id; // --
	private String pw; // --
	private String email; // --

	private String ctype; // --
	private String company; // --
	private String cemail; // --
	private String cnum; //

	private String name; // --
	// private String idnum1;
	// private String idnum2;

	// private String nickname;
	private char gender;

	private String p_option; // --

	// 생성자
	public JoinInfo() {

	}

	

	@Override
	public String toString() {
		return "JoinInfo [p_idx=" + p_idx + ", type=" + type + ", id=" + id + ", pw=" + pw + ", email=" + email
				+ ", ctype=" + ctype + ", company=" + company + ", cemail=" + cemail + ", cnum=" + cnum + ", name="
				+ name + ", gender=" + gender + ", p_option=" + p_option + "]";
	}



	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}



	public char getGender() {
		return gender;
	}



	public void setGender(char gender) {
		this.gender = gender;
	}

}
