package com.driver.reservation.domain;

public class lonlat {

	
	private String d_startlon; // 시작위도
	private String d_startlat; // 경도
	private String d_endlon; // 도착위도
	private String d_endlat; // 경도

	public lonlat() {
	}
	
	

	public lonlat(String d_startlon, String d_startlat, String d_endlon, String d_endlat) {
		this.d_startlon = d_startlon;
		this.d_startlat = d_startlat;
		this.d_endlon = d_endlon;
		this.d_endlat = d_endlat;
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
		return "Lonlat [d_startlon=" + d_startlon + ", d_startlat=" + d_startlat + ", d_endlon=" + d_endlon
				+ ", d_endlat=" + d_endlat + "]";
	}
	
	
	

	
}
