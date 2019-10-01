
package com.ycar.passenger.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table; 
// 탑승자 선호 경로 table
@Entity
@Table(name = "P_ROUTE")
public class PRouteEntity {
	
	@Id
	@Column(length = 45, nullable = false)
	private char type;

	@Column(length = 45, nullable = false)
	private String place;

	public char getType() {
		return type;
	}

	public void setType(char type) {
		this.type = type;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	@Override
	public String toString() {
		return "PRouteEntity [type=" + type + ", place=" + place + "]";
	}

}
