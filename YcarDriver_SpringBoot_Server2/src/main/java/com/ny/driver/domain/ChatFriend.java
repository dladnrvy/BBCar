package com.ny.driver.domain;

import java.util.Date;

import com.ny.driver.entity.ReservationEntity;

public class ChatFriend {
	private long r_idx;
	private String r_confirm;
	private Date d_date;
	private String d_startpoint;
	private String d_endpoint;
	
	private long dr_idx;
	private long d_idx;
	private long p_idx;
	
	private String d_nickname;
	private String p_nickname;
	
	public ChatFriend() {
	}
	
	public ChatFriend(String p_nickname, ReservationEntity entity) {
		this.r_idx = entity.getR_idx();
		this.r_confirm = entity.getR_confirm();
		this.d_date = entity.getD_date();
		this.d_startpoint = entity.getD_startpoint();
		this.d_endpoint = entity.getD_endpoint();
		this.dr_idx = entity.getDr_idx();
		this.d_idx = entity.getD_idx();
		this.p_idx = entity.getP_idx();
		this.d_nickname = entity.getD_nickname();
		
		this.p_nickname = p_nickname;
	}

	public ChatFriend(long r_idx, String r_confirm, Date d_date, String d_startpoint, String d_endpoint, long dr_idx,
			long d_idx, long p_idx, String d_nickname, String p_nickname) {
		this.r_idx = r_idx;
		this.r_confirm = r_confirm;
		this.d_date = d_date;
		this.d_startpoint = d_startpoint;
		this.d_endpoint = d_endpoint;
		this.dr_idx = dr_idx;
		this.d_idx = d_idx;
		this.p_idx = p_idx;
		this.d_nickname = d_nickname;
		this.p_nickname = p_nickname;
	}
	@Override
	public String toString() {
		return "ChatFriend [r_idx=" + r_idx + ", r_confirm=" + r_confirm + ", d_date=" + d_date + ", d_startpoint="
				+ d_startpoint + ", d_endpoint=" + d_endpoint + ", dr_idx=" + dr_idx + ", d_idx=" + d_idx + ", p_idx="
				+ p_idx + ", d_nickname=" + d_nickname + ", p_nickname=" + p_nickname + "]";
	}
	public long getR_idx() {
		return r_idx;
	}
	public void setR_idx(long r_idx) {
		this.r_idx = r_idx;
	}
	public String getR_confirm() {
		return r_confirm;
	}
	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
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
	public long getDr_idx() {
		return dr_idx;
	}
	public void setDr_idx(long dr_idx) {
		this.dr_idx = dr_idx;
	}
	public long getD_idx() {
		return d_idx;
	}
	public void setD_idx(long d_idx) {
		this.d_idx = d_idx;
	}
	public long getP_idx() {
		return p_idx;
	}
	public void setP_idx(long p_idx) {
		this.p_idx = p_idx;
	}
	public String getD_nickname() {
		return d_nickname;
	}
	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}
	public String getP_nickname() {
		return p_nickname;
	}
	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}  
	
	
}
