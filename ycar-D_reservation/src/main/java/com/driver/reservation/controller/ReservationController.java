package com.driver.reservation.controller;

import java.util.List;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.driver.reservation.domain.DriverReservation;
import com.driver.reservation.domain.lonlat;
import com.driver.reservation.service.InsertReservationService;
import com.driver.reservation.service.SelectLonLat;
import com.driver.reservation.service.ShowListService;
import com.driver.reservation.service.deleteService;
import com.driver.reservation.service.updateService;



@CrossOrigin
@RestController
@RequestMapping("/carpool")
public class ReservationController {

	@Autowired
	private InsertReservationService insertRV;
	@Autowired
	private ShowListService showlist;
	@Autowired
	private deleteService deleteRV;
	@Autowired
	private updateService updateRV;
	@Autowired
	private SelectLonLat lonlatService;
	
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
	public List<DriverReservation> selectAllList(
			@PathVariable("d_idx") int d_idx
			) {
		
		List<DriverReservation> drv = showlist.showAllList(d_idx);
				
		System.out.println("검색하고자하는 idx는?" + d_idx);
		System.out.println("ajax 가기전 리스트 확인 : " + drv.toString());
			
		return drv;
	}
	
	@GetMapping("/B/{d_idx}")
	public List<DriverReservation> BcarpoolList(
			@PathVariable("d_idx") int d_idx
			) {
		
		List<DriverReservation> drv = showlist.BmycarpoolList(d_idx);
				
		System.out.println("검색하고자하는 idx는?" + d_idx);
			
		return drv;
	}
	
	@GetMapping("/Y/{d_idx}")
	public List<DriverReservation> YcarpoolList(
			@PathVariable("d_idx") int d_idx
			) {
		
		List<DriverReservation> drv = showlist.YmycarpoolList(d_idx);
				
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
	
	@DeleteMapping("/N/{r_idx}")
	public int updateCencleRV(
			@PathVariable("r_idx") int r_idx
			) {
		
		int dr = 0;
		
		dr = updateRV.cancleCarpoor(r_idx);
		
		return dr;
	}
	
	@PutMapping("/Y/{r_idx}")
	public int updateConcentRV(
			@PathVariable("r_idx") int r_idx
			) {
		
		int dr = 0;
		
		dr = updateRV.concentCarpoor(r_idx);
		
		return dr;
	}
	
	@GetMapping("/lonlat/{r_idx}")
	public lonlat selectLonlat(
			@PathVariable("r_idx") int r_idx
			) {
		System.out.println("r_idx 값은 :  " + r_idx);
		lonlat DR = lonlatService.selectlonlat(r_idx);
		
		System.out.println("lonlat을 가져온 결과를 출력해보쟛  : " + DR);
		return DR;
	}
	
	
	
	
}
