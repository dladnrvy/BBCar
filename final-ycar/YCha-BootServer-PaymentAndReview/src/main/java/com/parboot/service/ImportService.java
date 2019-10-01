package com.parboot.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.parboot.entity.ReservationEntity;
import com.parboot.repository.ReservationRepository;

@Service("importService")
public class ImportService {
	
	@Autowired
	private ReservationRepository resRepository;

	public Map<String, Object> importRequest(long r_idx) {
		
		ReservationEntity resEntity = resRepository.getOne(r_idx);
		System.out.println("kg inisis로 결제 요청 03" + resEntity.toString());

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("d_fee", resEntity.getCarpoolEntity().getD_fee());
		map.put("email", resEntity.getPassengerEntity().getEmail());
		map.put("name", resEntity.getPassengerEntity().getName());
		System.out.println("kg inisis로 결제 요청 04" + map);
		
		return map;
	}

}
