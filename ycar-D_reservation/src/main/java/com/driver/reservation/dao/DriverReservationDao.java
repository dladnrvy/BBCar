package com.driver.reservation.dao;

import java.util.List;

import com.driver.reservation.domain.DriverReservation;

public interface DriverReservationDao {

	// 운전자 저장
	public int InsertReservation(DriverReservation reservation);

	// 과거 리스트 출력
	public List<DriverReservation> pastList(int idx);

	// 미래 리스트 출력
	public List<DriverReservation> futureList(int idx);

	// 현재 리스트 출력
	public List<DriverReservation> todayList(int idx);

	//삭제
	public int deleteCarpool(int dr_idx);
}
