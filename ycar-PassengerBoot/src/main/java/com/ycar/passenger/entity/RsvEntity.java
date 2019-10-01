package com.ycar.passenger.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import org.springframework.lang.Nullable;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

// 카풀 예약 table
@Entity
@Table(name = "RESERVATION")
public class RsvEntity {

	@Column(name = "p_idx")
	private int pIdx;

	@Id
	@Column
	private int r_idx;

	@Column(insertable = false, updatable = false)
	private int dr_idx;

	@Column(nullable = true)
	private String r_confirm;

	//@ManyToOne(targetEntity = DCarpoolEntity.class)
	@ManyToOne
	@JoinColumn(name = "dr_idx")
	private DCarpoolEntity dcp;

	@Column(name = "r_date")
	private Date rDate;

	public RsvEntity() {
		this.dcp = new DCarpoolEntity(dr_idx);
	}

	/**
	 * @param pIdx
	 * @param r_idx
	 * @param dr_idx
	 * @param r_confirm
	 * @param dcp
	 * @param rDate
	 */

	public RsvEntity(int pIdx, int r_idx, int dr_idx, String r_confirm, DCarpoolEntity dcp, Date rDate) {
		super();
		this.pIdx = pIdx;
		this.r_idx = r_idx;
		this.dr_idx = dr_idx;
		this.r_confirm = r_confirm;
		this.dcp = dcp;
		this.rDate = rDate;
	}

	public int getpIdx() {
		return pIdx;
	}

	public void setpIdx(int pIdx) {
		this.pIdx = pIdx;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public String getR_confirm() {
		return r_confirm;
	}

	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}

	public DCarpoolEntity getDcp() {
		return dcp;
	}

	public void setDcp(DCarpoolEntity dcp) {
		this.dcp = dcp;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public int getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}

//	@ManyToOne
//	//@JoinColumn(name = "dr_idx", insertable = false, updatable = false)
//	@JoinColumn(name = "dr_idx", insertable = false, updatable = false)
//	private DCarpoolEntity dcp;
//
//	public DCarpoolEntity getDcp() {
//		return dcp;
//	}
//
//	public void setDcp(DCarpoolEntity dcp) {
//		
//		//dcp.getRsvlist().add(this);
//		
//		this.dcp = dcp;
//	}

}
