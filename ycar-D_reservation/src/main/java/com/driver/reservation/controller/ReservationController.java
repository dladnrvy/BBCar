package com.driver.reservation.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.driver.reservation.domain.DriverReservation;
import com.driver.reservation.service.InsertReservationService;
import com.driver.reservation.service.ShowListService;
import com.driver.reservation.service.deleteService;



@CrossOrigin
@RestController
@RequestMapping("/rvInsert")
public class ReservationController {

	@Autowired
	private InsertReservationService insertRV;
	@Autowired
	private ShowListService showlist;
	@Autowired
	private deleteService deleteRV;
	
	@PostMapping
	@RequestMapping("/{d_idx}")
	public String InsertRV(
			@RequestBody DriverReservation driverRV,
			@PathVariable("d_idx") int d_idx
			) {
		driverRV.setD_idx(d_idx);
		
		System.out.println("드라이버 idx" + d_idx);
		
		System.out.println("컨트롤러 들어옴!" + driverRV.toString());
		
		int Cnt = 0;
		
		Cnt = insertRV.InsertReservation(driverRV);
		
		return Cnt>0?"success":"fail";
	}
	
	@GetMapping("/{d_idx}")
	public Map<String, Object> SelectRV(
			@PathVariable("d_idx") int d_idx
			) {
		
		Map<String, Object> drv = showlist.showListForDate(d_idx);
				
		System.out.println("검색하고자하는 idx는?" + d_idx);
			
		return drv;
	}
	
	@DeleteMapping("/{dr_idx}")
	public int deleteRV(
			@PathVariable("dr_idx") int dr_idx
			) {
		
		int dr = 0;
		
		dr = deleteRV.deleteCarpoor(dr_idx);
		
		return dr;
	}
	
	
}
