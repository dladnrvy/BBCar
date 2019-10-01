package com.parboot.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "PASSENGER")
public class PassengerEntity {
	
	@Id
	@Column
	private long p_idx;
	
	@Column(length = 20)
	private String name;
	
	@Column(length = 100)
	private String email;

	public long getP_idx() {
		return p_idx;
	}

	public void setP_idx(long p_idx) {
		this.p_idx = p_idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "PassengerEntity [p_idx=" + p_idx + ", name=" + name + ", email=" + email + "]";
	}
}
