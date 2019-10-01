package com.ny.driver.entity;
/**
 * 운전자 d_idx를 이용,
 * 해당 운전자에게 카풀 신청한 사람의 리스트를 뽑아옴
 * (null값은 신청한 사람이 없는 카풀등록이므로 제외,
 * 특이사항: 
 * 1 @Getter @Setter 를 사용하였으나 실제 적용이 안되어 직접 getter setter generate 함
 * 2 다른 테이블(DRIVER , PASSENGER) 의 같은 이름의 컬럼(nickname) 을 호출하였으나
 * 		DRIVER의 nickname만 호출됨.  
 * @author mand2
 * */


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SecondaryTable;
import javax.persistence.SecondaryTables;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "RESERVATION")
@SecondaryTables({
	@SecondaryTable(name = "D_CARPOOL", pkJoinColumns = @PrimaryKeyJoinColumn(name = "dr_idx")),
	@SecondaryTable(name = "DRIVER", pkJoinColumns = @PrimaryKeyJoinColumn(name = "d_idx")),
	@SecondaryTable(name = "PASSENGER", pkJoinColumns = @PrimaryKeyJoinColumn(name = "p_idx"))
})
public class ReservationEntity {
	
	@Id
	@Column(length = 10)
	private long r_idx;
	
	@Column(length = 10, nullable = false)
	private String r_confirm;
	
	@Column(table = "D_CARPOOL")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date d_date;
	
	@Column(length = 255, nullable = false, table = "D_CARPOOL")
	private String d_startpoint;
	
	@Column(length = 255, nullable = false, table = "D_CARPOOL")
	private String d_endpoint;
	
	private long dr_idx;
	private long d_idx;
	private long p_idx;
	
	
	@Column(table = "DRIVER", name = "nickname")
	private String d_nickname;
	

	@Override
	public String toString() {
		return "ReservationEntity [r_idx=" + r_idx + ", r_confirm=" + r_confirm + ", d_date=" + d_date
				+ ", d_startpoint=" + d_startpoint + ", d_endpoint=" + d_endpoint + ", dr_idx=" + dr_idx + ", d_idx="
				+ d_idx + ", p_idx=" + p_idx + ", d_nickname=" + d_nickname + "]";
	}

	public long getR_idx() {
		return r_idx;
	}

	public void setR_idx(long r_idx) {
		this.r_idx = r_idx;
	}

	public String getR_confirm() {
		return r_confirm;
	}

	public void setR_confirm(String r_confirm) {
		this.r_confirm = r_confirm;
	}

	public Date getD_date() {
		return d_date;
	}

	public void setD_date(Date d_date) {
		this.d_date = d_date;
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

	public long getDr_idx() {
		return dr_idx;
	}

	public void setDr_idx(long dr_idx) {
		this.dr_idx = dr_idx;
	}

	public long getD_idx() {
		return d_idx;
	}

	public void setD_idx(long d_idx) {
		this.d_idx = d_idx;
	}

	public long getP_idx() {
		return p_idx;
	}

	public void setP_idx(long p_idx) {
		this.p_idx = p_idx;
	}

	public String getD_nickname() {
		return d_nickname;
	}

	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}

	
	
	
	
	
}
