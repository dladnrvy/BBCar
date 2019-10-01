package com.ycar.passenger.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
// 탑승자 table
@Entity
@Table(name = "PASSENGER")
public class PassengerEntity {
	
	@Id
	@Column
	private String p_option;

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	@Override
	public String toString() {
		return "PassengerEntity [p_option=" + p_option + "]";
	}
	
	

}
