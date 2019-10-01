package com.ycar.driver.model;

public class Route {
	private int d_idx;
	private String r_type;
	private String place;
	
	
	
	public Route(String type, String place) {
		this.r_type = type;
		this.place = place;
	}

	public Route(int d_idx, String type, String place) {
		this.d_idx = d_idx;
		this.r_type = type;
		this.place = place;
	}
	
	public Route() {
	}

	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getType() {
		return r_type;
	}
	public void setType(String type) {
		this.r_type = type;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "Route [d_idx=" + d_idx + ", r_type=" + r_type + ", place=" + place + "]";
	}
	
	
}
