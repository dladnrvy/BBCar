package com.driver.reservation.dao;

import java.util.List;

import com.driver.reservation.domain.lonlat;
import com.driver.reservation.domain.DriverReservation;

public interface DriverReservationDao {

	// 운전자 저장
	public int InsertReservation(DriverReservation reservation);

	//전체 리스트
	public List<DriverReservation> carpoolAllList(int d_idx);
	
	//카풀요청
	public List<DriverReservation> mycarpoolB(int d_idx);
		
	//나의카풀 - 수락한내역
	public List<DriverReservation> mycarpoolY(int d_idx);
	
	//삭제
	public int deleteCarpool(int dr_idx);
		
	//승낙
	public int concentCarpool(int r_idx);
		
	//거절, 취소
	public int cancleCarpool(int r_idx);
	
	//r_idx에 따른 위도 경도 출력
	public lonlat selectlonlat(int r_idx);
}
