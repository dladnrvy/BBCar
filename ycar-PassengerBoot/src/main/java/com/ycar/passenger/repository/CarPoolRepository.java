package com.ycar.passenger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ycar.passenger.entity.DCarpoolEntity;

public interface CarPoolRepository extends JpaRepository<DCarpoolEntity, Long> {

	// 등록된 카풀 리스트 출력 : 예약이 아직 되지 않은 카풀 등록 리스트 (D_CARPOOL의 모든 변수 + RESERVATION의 r_confirm변수)
	//@Query("select d from DCarpoolEntity d join RsvEntity r on d.dr_idx = r.dr_idx where r.r_confirm is null order by d.d_date desc")
	//public List<DCarpoolEntity> list();
	
	//	select rsv.r_idx, rsv.r_confirm, cp.dr_idx, cp.d_idx, cp.d_date, cp.d_starttime, cp.d_endtime, cp.d_startpoint, cp.d_endpoint, cp.d_fee, cp.d_distance from D_CARPOOL as cp
	//	join RESERVATION as rsv ;
	//	-- join한 테이블에서 -> dr_idx검색 ->  r_confirm이 null인 경우는 예약 안한 카풀 목록임 
	//	-- 예약 가능한 것 : B 또는 null
	//@Query("select d from DCarpoolEntity d join RsvEntity r where r.r_confirm is null or = 'B' order by d.d_date desc")
	//public List<DCarpoolEntity> list(); 
	
}
