package com.ycar.driver.client.domain;

public class LoginDriverInfo {
	private int d_idx;
	private String id ;
	private String name;
	private String nickname;	
	public LoginDriverInfo() {
	}
	
//기본정보만	
	public LoginDriverInfo(int d_idx, String id, String name, String nickname) {
		this.d_idx = d_idx;
		this.id = id;
		this.name = name;
		this.nickname = nickname;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	@Override
	public String toString() {
		return "LoginDriverInfo [d_idx=" + d_idx + ", id=" + id + ", name=" + name + ", nickname=" + nickname + "]";
	}
	
	
}
