package com.ycar.passenger.domain;

// 탑승자가 예약한 카풀 정보 
import java.util.Date;

public class ChattingDomain {

	private int dr_idx;
	private String r_confirm;
	private int d_idx;
	private Date date;
	private String d_starttime;
	private String d_endtime;
	private String d_startpoint;
	private String d_endpoint;
	private String d_commute;
	private int d_fee;
	private int d_distance;
	private String d_nickname;

	/**
	 * @param dr_idx
	 * @param r_confirm
	 * @param d_idx
	 * @param date
	 * @param d_starttime
	 * @param d_endtime
	 * @param d_startpoint
	 * @param d_endpoint
	 * @param d_commute
	 * @param d_fee
	 * @param d_distance
	 */
	public ChattingDomain(int dr_idx, String r_confirm, int d_idx, Date date, String d_starttime, String d_endtime,
			String d_startpoint, String d_endpoint, String d_commute, int d_fee, int d_distance, String d_nickname) {
		this.dr_idx = dr_idx;
		this.r_confirm = r_confirm;
		this.d_idx = d_idx;
		this.date = date;
		this.d_starttime = d_starttime;
		this.d_endtime = d_endtime;
		this.d_startpoint = d_startpoint;
		this.d_endpoint = d_endpoint;
		this.d_commute = d_commute;
		this.d_fee = d_fee;
		this.d_distance = d_distance;
		this.d_nickname = d_nickname;
	}

	public int getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}

	public String getR_confirm() {
		return r_confirm;
	}

	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getD_commute() {
		return d_commute;
	}

	public void setD_commute(String d_commute) {
		this.d_commute = d_commute;
	}

	public int getD_fee() {
		return d_fee;
	}

	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}

	public int getD_distance() {
		return d_distance;
	}

	public void setD_distance(int d_distance) {
		this.d_distance = d_distance;
	}

	public String getD_nickname() {
		return d_nickname;
	}

	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}

}
