package com.ycar.passenger.domain;
// 회원 가입 분기처리 : 두번째 상위 도메인
// 이메일 인증
public class PassengerE extends PassengerOrigin{
	private String cemail;
	
	// 생성자
	/**
	 * @param type
	 * @param name
	 * @param ctype
	 * @param company
	 * @param cemail
	 */
	public PassengerE(String type, String name, String ctype, String company, String cemail, String p_option, char gender) {
		super(type, name, ctype, company, p_option, gender);
		this.cemail = cemail;
	}
	
	public PassengerE(String cemail) {
		
	}

	public String getCemail() {
		return cemail;
	}

	public void setCemail(String cemail) {
		this.cemail = cemail;
	}
	
	
	
}
