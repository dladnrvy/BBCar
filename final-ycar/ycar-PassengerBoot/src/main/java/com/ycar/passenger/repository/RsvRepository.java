package com.ycar.passenger.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.ycar.passenger.entity.RsvEntity;

public interface RsvRepository extends JpaRepository<RsvEntity, Integer> {
	
//	-- 탑승자가 예약한 카풀 리스트 
//	select rsv.p_idx, rsv.r_idx, rsv.r_confirm, cp.d_commute, cp.dr_idx, cp.d_idx, cp.d_date, cp.d_starttime, 
//	cp.d_endtime, cp.d_startpoint, cp.d_endpoint, cp.d_fee, cp.d_distance 
//	from D_CARPOOL as cp left join RESERVATION as rsv on rsv.dr_idx = cp.dr_idx where rsv.p_idx = 11;
	public List<RsvEntity> findByPIdx(int pIdx);
	
}
