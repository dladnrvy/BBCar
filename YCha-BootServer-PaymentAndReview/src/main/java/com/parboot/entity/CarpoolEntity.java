package com.parboot.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "D_CARPOOL")
public class CarpoolEntity {
	
	@Id
	@Column
	private long dr_idx;
	
	@Column(length = 10, nullable = false)
	private int d_idx;
	
	@Column(nullable = false)
	private Date d_date;
	
	@Column(length = 255, nullable = false)
	private String d_starttime;
	
	@Column(length = 255, nullable = false)
	private String d_endtime;
	
	@Column(length = 255, nullable = false)
	private String d_startpoint;
	
	@Column(length = 255, nullable = false)
	private String d_endpoint;
	
	@Column(length = 4, nullable = false)
	private String d_commute;
	
	@Column(length = 10, nullable = false)
	private int d_fee;
	
	@Column(length = 20, nullable = false)
	private int d_distance;
	
	@Column(length = 500, nullable = false)
	private String d_startlon;
	
	@Column(length = 500, nullable = false)
	private String d_startlat;
	
	@Column(length = 500, nullable = false)
	private String d_endlon;
	
	@Column(length = 500, nullable = false)
	private String d_endlat;
	

	public Long getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(Long dr_idx) {
		this.dr_idx = dr_idx;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
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

	public String getD_startlon() {
		return d_startlon;
	}

	public void setD_startlon(String d_startlon) {
		this.d_startlon = d_startlon;
	}

	public String getD_startlat() {
		return d_startlat;
	}

	public void setD_startlat(String d_startlat) {
		this.d_startlat = d_startlat;
	}

	public String getD_endlon() {
		return d_endlon;
	}

	public void setD_endlon(String d_endlon) {
		this.d_endlon = d_endlon;
	}

	public String getD_endlat() {
		return d_endlat;
	}

	public void setD_endlat(String d_endlat) {
		this.d_endlat = d_endlat;
	}
	
	@Override
	public String toString() {
		return "CarpoolEntity [dr_idx=" + dr_idx + ", d_idx=" + d_idx + ", d_date=" + d_date + ", d_starttime="
				+ d_starttime + ", d_endtime=" + d_endtime + ", d_startpoint=" + d_startpoint + ", d_endpoint="
				+ d_endpoint + ", d_commute=" + d_commute + ", d_fee=" + d_fee + ", d_distance=" + d_distance
				+ ", d_startlon=" + d_startlon + ", d_startlat=" + d_startlat + ", d_endlon=" + d_endlon + ", d_endlat="
				+ d_endlat + "]";
	}

	/*@OneToMany(mappedBy = "carpoolEntity") //대상 entity 에서 관계로 설정된 변수
	private List<ReservationEntity> reservations = new ArrayList<ReservationEntity>();
	
	public List<ReservationEntity> getReservations() {
		return reservations;
	}
	
	public void setReservations(List<ReservationEntity> reservations) {
		this.reservations = reservations;
	}*/
}
