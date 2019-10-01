package com.ycar.passenger.domain;
// session에 저장할 객체
public class LoginInfo {
	private int idx;
	private String nickname;
	private String email;
	private String name;
	
	// 로그인 할때 넘겨주는 용도
	public LoginInfo(int idx, String nickname, String email, String name) {
		this.idx = idx;
		this.nickname = nickname;
		this.email = email;
		this.name = name;
	}	

	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
