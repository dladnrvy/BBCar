package com.ycar.passenger.domain;

//회원 가입 분기처리 : 세번째 상위 도메인
//재직증명서인증 + 일반가입
public class PassengerSP extends PassengerP {
	
	private String id;
	private String pw;
	private String email;
	
	// 생성자
	public PassengerSP(){
		
	}
	
	/**
	 * @param type
	 * @param name
	 * @param ctype
	 * @param company
	 * @param cnum
	 */
	public PassengerSP(String type, String name, String ctype, String company, String cnum, String id, String pw, String email, String p_option, char gender) {
		super(type, name, ctype, company, cnum, p_option, gender);
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
