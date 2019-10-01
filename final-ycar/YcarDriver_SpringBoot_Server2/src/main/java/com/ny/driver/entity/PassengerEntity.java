package com.ny.driver.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PASSENGER")
public class PassengerEntity {
	@Id
	private Long p_idx;
	
	@Column(name = "nickname")
	private String nickname;

	@Override
	public String toString() {
		return "PassengerEntity [p_idx=" + p_idx + ", nickname=" + nickname + "]";
	}

	public Long getP_idx() {
		return p_idx;
	}

	public void setP_idx(Long p_idx) {
		this.p_idx = p_idx;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
}
