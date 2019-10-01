package com.ycar.driver.client.domain;

public class EditDriverPW {
	private int d_idx;
	private String pw;
	@Override
	public String toString() {
		return "EditDriverPW [d_idx=" + d_idx + ", pw=" + pw + "]";
	}
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	
}
