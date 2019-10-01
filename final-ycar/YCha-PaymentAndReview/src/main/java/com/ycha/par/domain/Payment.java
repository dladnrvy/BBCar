package com.ycha.par.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Payment {
	
	private int payidx;
	private int r_idx;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
	private Date paydate;
	private String paymethod;
	
	public Payment (){}

	public Payment(int payidx, int r_idx, Date paydate, String paymethod) {
		super();
		this.payidx = payidx;
		this.r_idx = r_idx;
		this.paydate = paydate;
		this.paymethod = paymethod;
	}

	public int getPayidx() {
		return payidx;
	}
	public void setPayidx(int payidx) {
		this.payidx = payidx;
	}
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public Date getPaydate() {
		return paydate;
	}
	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}
	public String getPaymethod() {
		return paymethod;
	}
	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}
	@Override
	public String toString() {
		return "Payment [payidx=" + payidx + ", r_idx=" + r_idx + ", paydate=" + paydate + ", paymethod=" + paymethod
				+ "]";
	}
	
	
}
