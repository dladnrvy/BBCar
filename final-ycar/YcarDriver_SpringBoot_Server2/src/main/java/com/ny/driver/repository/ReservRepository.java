package com.ny.driver.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ny.driver.entity.PassengerEntity;
import com.ny.driver.entity.ReservationEntity;


public interface ReservRepository extends JpaRepository<ReservationEntity, Long> {
	
//	@Query(value = "SELECT * "
//			+ " from RESERVATION r" 
//			+ " left join D_CARPOOL c"
//			+ " on c.dr_idx = r.dr_idx"
//			+ " inner join DRIVER d"
//			+ " on d.d_idx = c.d_idx"
//			+ " inner join PASSENGER p" 
//			+ " on r.p_idx = p.p_idx" 
//			+ " where r.r_confirm is not null" 
//			+ " and d.d_idx = ?1"
//			+ " order by r.dr_idx , r.r_idx"
//			,nativeQuery = true)
	@Query(value = "SELECT "
			+ "c.dr_idx"
			+ " , r.r_idx"
			+ " , r.p_idx"
			+ " , c.d_date"
			+ " , c.d_startpoint"
			+ " , c.d_endpoint"
			+ " , r.r_confirm"
			+ " , d.d_idx"
			+ " , d.nickname"
			+ " from RESERVATION r" 
			+ " left join D_CARPOOL c"
			+ " on c.dr_idx = r.dr_idx"
			+ " inner join DRIVER d"
			+ " on d.d_idx = c.d_idx"
			+ " where r.r_confirm is not null" 
			+ " and d.d_idx = ?1"
			+ " order by r.dr_idx , r.r_idx"
			,nativeQuery = true)
//	이렇게 해도 reservationentity에 적용된 모든 field값들이 나옴.
	public List<ReservationEntity> getlists(String d_idx);
	
//	public PassengerEntity FindByP_idx(long p_idx);
//	@Query(value = "SELECT * FROM PASSENGER where p_idx = 1?" , nativeQuery = true)
//	public PassengerEntity getNicknameOfPassenger(long p_idx);
}
