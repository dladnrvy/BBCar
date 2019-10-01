package com.ycar.passenger.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

// 탑승자 마이페이지 내 메모장 table
@Entity
@Table(name = "P_MEMO")
public class MemoEntity {

	@Id
	@Column
	private int m_idx;

	@Column
	private int p_idx;
	@Column
	private int dr_idx;
	@Column
	private String context;

	/**
	 * @param p_idx
	 * @param dr_idx
	 * @param context
	 */
	public MemoEntity(int p_idx, int dr_idx, String context) {
		this.p_idx = p_idx;
		this.dr_idx = dr_idx;
		this.context = context;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
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

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	@Override
	public String toString() {
		return "MemoEntity [m_idx=" + m_idx + ", p_idx=" + p_idx + ", dr_idx=" + dr_idx + ", context=" + context + "]";
	}
	
	

}
