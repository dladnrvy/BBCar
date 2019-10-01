package com.ycar.reservation.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyCarpool {

	private int r_idx;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
	private Date r_date;
	private String nickname; //운전자 
	private String d_date;
	private String d_starttime;
	private String d_endtime;
	private String d_startpoint;
	private String d_endpoint;
	private int d_fee;
	private String r_confirm;
	private int dr_idx;
	
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getD_date() {
		return d_date;
	}
	public void setD_date(String d_date) {
		this.d_date = d_date;
	}
	public String getD_starttime() {
		return d_starttime;
	}
	public void setD_starttime(String d_starttime) {
		this.d_starttime = d_starttime;
	}
	public String getD_endtime() {
		return d_endtime;
	}
	public void setD_endtime(String d_endtime) {
		this.d_endtime = d_endtime;
	}
	public String getD_startpoint() {
		return d_startpoint;
	}
	public void setD_startpoint(String d_startpoint) {
		this.d_startpoint = d_startpoint;
	}
	public String getD_endpoint() {
		return d_endpoint;
	}
	public void setD_endpoint(String d_endpoint) {
		this.d_endpoint = d_endpoint;
	}
	public int getD_fee() {
		return d_fee;
	}
	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}
	public String getR_confirm() {
		return r_confirm;
	}
	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}
	public int getDr_idx() {
		return dr_idx;
	}
	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}
	
	
	@Override
	public String toString() {
		return "MyCarpool [r_idx=" + r_idx + ", r_date=" + r_date + ", nickname=" + nickname + ", d_date=" + d_date
				+ ", d_starttime=" + d_starttime + ", d_endtime=" + d_endtime + ", d_startpoint=" + d_startpoint
				+ ", d_endpoint=" + d_endpoint + ", d_fee=" + d_fee + ", r_confirm=" + r_confirm + ", dr_idx=" + dr_idx + "]";
	}

	
}