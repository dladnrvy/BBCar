package com.parboot.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity
@Table(name = "RESERVATION")
public class ReservationEntity {
	
	@Id
	@Column
	private long r_idx;
	
	@Column(length = 10, nullable = false)
	private int p_idx;
	
	@Column(length = 10, nullable = false)
	private int dr_idx;
	
	@Column(nullable = false)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
	private Date r_date;
	
	@Column(length = 10, nullable = false)
	private char r_confirm;

	
	//Lombok 으로 나중에 수정하기 
	public long getR_idx() {
		return r_idx;
	}

	public void setR_idx(long r_idx) {
		this.r_idx = r_idx;
	}

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public int getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(int dr_idx) {
		this.dr_idx = dr_idx;
	}

	public Date getR_date() {
		return r_date;
	}

	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}

	public char getR_confirm() {
		return r_confirm;
	}

	public void setR_confirm(char r_confirm) {
		this.r_confirm = r_confirm;
	}

	@Override
	public String toString() {
		return "ReservationEntity [r_idx=" + r_idx + ", p_idx=" + p_idx + ", dr_idx=" + dr_idx + ", r_date=" + r_date
				+ ", r_confirm=" + r_confirm + "]";
	}	
	
	@ManyToOne	//다 대 일 관계 : 예약 - 카풀경로
	@JoinColumn(name = "dr_idx", insertable = false, updatable = false) //조인 컬럼 정의 
	private CarpoolEntity carpoolEntity; //카풀

	public CarpoolEntity getCarpoolEntity() {
		return carpoolEntity;
	}

	public void setCarpoolEntity(CarpoolEntity carpoolEntity) {
		this.carpoolEntity = carpoolEntity;
	}
	
	@OneToOne(mappedBy = "reservationEntity")  //PAYMENT와 일대일 관계 
	private PaymentEntity paymentEntity;
	
	public PaymentEntity getPaymentEntity() {
		return paymentEntity;
	}

	public void setPaymentEntity(PaymentEntity paymentEntity) {
		this.paymentEntity = paymentEntity;
	}
	
	@ManyToOne
	@JoinColumn(name = "p_idx", insertable = false, updatable = false)
	private PassengerEntity passengerEntity;

	public PassengerEntity getPassengerEntity() {
		return passengerEntity;
	}

	public void setPassengerEntity(PassengerEntity passengerEntity) {
		this.passengerEntity = passengerEntity;
	}
}
