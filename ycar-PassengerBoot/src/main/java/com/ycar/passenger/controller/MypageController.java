package com.ycar.passenger.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.passenger.dao.PassengerDaoImpl;
import com.ycar.passenger.domain.ChattingDomain;
import com.ycar.passenger.entity.DCarpoolEntity;
import com.ycar.passenger.entity.MemoEntity;
import com.ycar.passenger.entity.PRouteEntity;
import com.ycar.passenger.entity.PassengerEntity;
import com.ycar.passenger.entity.RsvEntity;
import com.ycar.passenger.repository.CarPoolRepository;
import com.ycar.passenger.repository.MemoRepository;
import com.ycar.passenger.repository.RsvRepository;
import com.ycar.passenger.service.ChattingService;

@RestController
@Controller
@CrossOrigin
public class MypageController {

	// -- 탑승자 메모 기능 --

	@Autowired
	private CarPoolRepository cpRepo;
	@Autowired
	private ChattingService chattingService;

	// [채팅] 탑승자가 예약한 카풀 리스트 출력
	@RequestMapping("/rsvList/{idx}")
	public List<ChattingDomain> rsvList(@PathVariable("idx") int p_idx) {

		System.out.println("예약 리스트01");

		List<ChattingDomain> list = chattingService.rsvList(p_idx);

		for (ChattingDomain chattingDomain : list) {
			System.out.println(chattingDomain);
		}

		return list;
	}

	// [메모] 등록된 카풀 리스트 출력 : 예약이 아직 되지 않은 카풀 등록 리스트
	@RequestMapping("/cpList")
	public List<DCarpoolEntity> cpList() {

		System.out.println("탑승자 메모 01");

		// List<DCarpoolEntity> list = cpRepo.list();
		List<DCarpoolEntity> list = cpRepo.findAll();

		for (DCarpoolEntity dCarpoolEntity : list) {
			System.out.println("탑승자 메모 02" + dCarpoolEntity);

			/*
			 * List<RsvEntity> l1 = dCarpoolEntity.getRsvlist(); for (RsvEntity r : l1) {
			 * System.out.println("02-2" + r.getR_confirm()); }
			 */

		}

		return list;

	}

	@Autowired
	private MemoRepository mmRepo;

	// [메모] 카풀 선택하여 메모 작성 : pIdx = 회원번호 / cIdx = 카풀등록번호
	@PostMapping("/writeMemo/{pIdx}/{dIdx}")
	public String writeMemo(@PathVariable("pIdx") int pIdx, @PathVariable("dIdx") int dIdx,
			@RequestParam("memo") String memo) {

		System.out.println("메모 내용" + memo);
		MemoEntity result = mmRepo.save(new MemoEntity(pIdx, dIdx, memo));
		System.out.println(result);

		return result != null ? "success" : "fail";
	}

	// 작성한 메모에 대한 카풀이 예약 되었는지 확인 : Y 예약됨 / B 예약 대기

	// 메모 수정

	// 메모 삭제

	// --- 탑승자 개인 정보 ---

	@PersistenceContext
	EntityManager entityManager;

	private PassengerDaoImpl dao;

	@RequestMapping("/findEnv/{idx}")
	public PassengerEntity findEnvByIdx(@PathVariable("idx") long idx) {

		this.dao = new PassengerDaoImpl(entityManager);

		PassengerEntity entity = dao.findEnvByIdx(idx);
		System.out.println(entity);

		return entity;
	}

	@RequestMapping("/findRoute/{idx}")
	public List<PRouteEntity> findRouteByIdx(@PathVariable("idx") int idx) {

		System.out.println(idx);

		this.dao = new PassengerDaoImpl(entityManager);

		List<PRouteEntity> entity = dao.findRouteByIdx(idx);
		System.out.println(entity);

		return entity;
	}

}
