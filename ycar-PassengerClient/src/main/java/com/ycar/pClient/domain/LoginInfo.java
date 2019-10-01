package com.ycar.pClient.domain;
// session에 저장할 객체
public class LoginInfo {
	private int idx;
	private String id;
	private String nickname;
	private String email;
	private String name;
	
	public LoginInfo(int idx, String id, String nickname, String email, String name) {
		this.idx = idx;
		this.id = id;
		this.nickname = nickname;
		this.email = email;
		this.setName(name);
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
