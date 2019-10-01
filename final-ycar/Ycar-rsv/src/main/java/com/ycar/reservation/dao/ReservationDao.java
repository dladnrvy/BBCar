package com.ycar.reservation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ycar.reservation.domain.Carpool;
import com.ycar.reservation.domain.lonlat;
import com.ycar.reservation.domain.MyCarpool;
import com.ycar.reservation.domain.Reservation;

public interface ReservationDao {

	// 전체 카풀 리스트 출력
	public List<Carpool> allCarpoolList();

	//카풀 검색
	public List<Carpool> searchCarpoolList(@Param("param1")String date, @Param("param2")String time, @Param("param3")String startPoint, @Param("param4")String endPoint);
	
	//예약할 카풀 선택
	public Carpool selectByDr_idx(int dr_idx);

	//예약등록
	public int reserve(Reservation rsv);
	
	//메일 발송할 운전자 이메일 주소 가져오기
	public String getDemail(int dr_idx);
	
//	//회원별 예약 리스트 출력 
//	public List<Reservation> selectByP_idx(int p_idx);
	
	//확정된 예약만 p_idx 별로 보여주기
	public List<MyCarpool> confirmListByP_idx(int p_idx);
	
	//대기예약만~~ 
	public List<MyCarpool> waitingListByP_idx(int p_idx);
	
	//과거예약완료리스트 
	public List<MyCarpool> pastListByP_idx(int p_idx);
	
	// 예약번호로 셀렉트
//	public Reservation selectByR_idx(int r_idx);
	
	//예약취소
	public int delete(int r_idx);
	
	//r_idx에 따른 위도 경도 출력
	public lonlat selectlonlat(int r_idx);
	
}