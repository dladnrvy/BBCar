package com.ycha.par.domain;

public class ReservationBasicInfo {
	
	private int r_idx;
	private int p_idx;
	private int d_fee;
	
	//kakao api 사용을 위해 setter는 int 형, getter는 string 형으로 저장.
	
	public String getR_idx() {
		return Integer.toString(r_idx);
	}
	public void setR_idx(int r_idx) {
		this.r_idx = r_idx;
	}
	public String getP_idx() {
		return Integer.toString(p_idx);
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getD_fee() {
		return Integer.toString(d_fee);
	}
	public void setD_fee(int d_fee) {
		this.d_fee = d_fee;
	}
	@Override
	public String toString() {
		return "ReservationBasicInfo [r_idx=" + r_idx + ", p_idx=" + p_idx + ", d_fee=" + d_fee + "]";
	}
	
}
