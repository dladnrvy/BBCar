package com.ycar.passenger.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

// 운전자 카풀 등록 table
@Entity
@JsonIdentityInfo(generator = ObjectIdGenerators.IntSequenceGenerator.class)
@Table(name = "D_CARPOOL")
public class DCarpoolEntity {

	@Id
	@Column
	private int dr_idx;

	@Column
	private int d_idx;
	@Column
	@Temporal(TemporalType.DATE)
	private Date d_date;
	@Column
	private String d_starttime;
	@Column
	private String d_endtime;
	@Column
	private String d_startpoint;
	@Column
	private String d_endpoint;
	@Column
	private String d_commute;
	@Column
	private int d_fee;
	@Column
	private int d_distance;

	public DCarpoolEntity() {

	}

	public DCarpoolEntity(int dr_idx) {
		this.dr_idx = dr_idx;
	}

	// @OneToMany(cascade = CascadeType.ALL , mappedBy = "dcp")
	// @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	// @OneToMany(targetEntity = RsvEntity.class)

	// @OneToMany(mappedBy = "dcp")
//	@OneToMany

//	@JoinColumn(name = "dr_idx")

	// @OneToMany
	/*
	 * @JoinTable(name = "joinTable", joinColumns =
	 * { @JoinColumn(referencedColumnName = "dr_idx") }, inverseJoinColumns =
	 * { @JoinColumn(referencedColumnName = "dr_idx") })
	 */
	@OneToMany(mappedBy = "dcp")
	//@JoinColumn(name = "dr_idx")
	private List<RsvEntity> rsvlist = new ArrayList<RsvEntity>();

	public List<RsvEntity> getRsvlist() {
		return rsvlist;
	}

	public void setRsvlist(List<RsvEntity> rsvlist) {
		this.rsvlist = rsvlist;
	}

	public int getDr_idx() {
		return dr_idx;
	}

	public int getD_idx() {
		return d_idx;
	}

	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}

	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
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

}
