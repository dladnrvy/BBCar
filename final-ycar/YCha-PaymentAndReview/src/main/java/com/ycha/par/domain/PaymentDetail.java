package com.ycha.par.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class PaymentDetail {
	
	//10개의 정보 출력 
	private int payidx;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
	private Date paydate;
	private int d_distance;
	private String d_commute;
	private String d_starttime;
	private String d_endtime;
	private int d_fee;
	private String paymethod;
	private String d_startpoint;
	private String d_endpoint;
	
	
	public int getPayidx() {
		return payidx;
	}
	public void setPayidx(int payidx) {
		this.payidx = payidx;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public int getD_distance() {
		return d_distance;
	}
	public void setD_distance(int d_distance) {
		this.d_distance = d_distance;
	}
	public String getD_commute() {
		return d_commute;
	}
	public void setD_commute(String d_commute) {
		this.d_commute = d_commute;
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
	public int getD_fee() {
		return d_fee;
	}
	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
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
	@Override
	public String toString() {
		return "PaymentDetail [payidx=" + payidx + ", paydate=" + paydate + ", d_distance=" + d_distance
				+ ", d_commute=" + d_commute + ", d_starttime=" + d_starttime + ", d_endtime=" + d_endtime + ", d_fee="
				+ d_fee + ", paymethod=" + paymethod + ", d_startpoint=" + d_startpoint + ", d_endpoint=" + d_endpoint
				+ "]";
	}
	
	
	
}
