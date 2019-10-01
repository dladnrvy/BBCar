package com.ycar.passenger.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "DRIVER")
public class DriverEntity {
	
	@Id
	@Column
	private int d_idx;
	@Column
	private String nickname;

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

}
