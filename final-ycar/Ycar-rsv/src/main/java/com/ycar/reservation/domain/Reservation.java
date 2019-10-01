package com.ycar.reservation.domain;

import java.util.Date;

public class Reservation {
	
	private int r_idx;
	private int p_idx;
	private int dr_idx;
	private Date r_date;
	private String r_confirm;
	
	
	public Reservation() {}
	
	
	public int getR_idx() {
		return r_idx;
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getDr_idx() {
		return dr_idx;
	}
	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public String getR_confirm() {
		return r_confirm;
	}
	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}


	public Reservation(int r_idx, int p_idx, int dr_idx, Date r_date, String r_confirm) {
		super();
		this.r_idx = r_idx;
		this.p_idx = p_idx;
		this.dr_idx = dr_idx;
		this.r_date = r_date;
		this.r_confirm = r_confirm;
	}


	@Override
	public String toString() {
		return "Reservation [r_idx=" + r_idx + ", p_idx=" + p_idx + ", dr_idx=" + dr_idx + ", r_date=" + r_date
				+ ", r_confirm=" + r_confirm + "]";
	}
	
	
}