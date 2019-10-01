package com.ycar.passenger.domain;
//회원 가입 분기처리 : 두번째 상위 도메인
//재직증명서 인증
public class PassengerP extends PassengerOrigin {
	private String cnum;
	
	// 생성자
	PassengerP(){
		
	}

	/**
	 * @param type
	 * @param name
	 * @param ctype
	 * @param company
	 * @param cnum
	 */
	public PassengerP(String type, String name, String ctype, String company, String cnum, String p_option, char gender) {
		super(type, name, ctype, company, p_option, gender);
		this.cnum = cnum;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	
	
}
