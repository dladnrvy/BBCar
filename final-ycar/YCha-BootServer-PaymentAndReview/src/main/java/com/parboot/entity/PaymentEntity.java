package com.parboot.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "PAYMENT")
public class PaymentEntity {
	
	@Id
	@Column
	private long payidx;
	
	@Column(length = 10, nullable = false)
	private int r_idx; 
	
	@Column
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern ="yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
	private Date paydate;

	@Column(length = 20, nullable = false)
	private String paymethod;

	public long getPayidx() {
		return payidx;
	}

	public void setPayidx(long payidx) {
		this.payidx = payidx;
	}

	public int getR_idx() {
		return r_idx;
	}

	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}

	public Date getPaydate() {
		return paydate;
	}

	public void setPaydate(Date paydate) {
		this.paydate = paydate;
	}

	public String getPaymethod() {
		return paymethod;
	}

	public void setPaymethod(String paymethod) {
		this.paymethod = paymethod;
	}

	@Override
	public String toString() {
		return "PaymentEntity [payidx=" + payidx + ", r_idx=" + r_idx + ", paydate=" + paydate + ", paymethod="
				+ paymethod + "]";
	}
	
	@OneToOne
	@JoinColumn(name = "r_idx", insertable = false, updatable = false) //연관관계주인 : r_idx : insertable = false, updatable = false 설정 필요 
	private ReservationEntity reservationEntity;

	public ReservationEntity getReservationEntity() {
		return reservationEntity;
	}

	public void setReservationEntity(ReservationEntity reservationEntity) {
		this.reservationEntity = reservationEntity;
	}
	
}
