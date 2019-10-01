package com.ycar.passenger.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.passenger.domain.ChattingDomain;
import com.ycar.passenger.entity.DCarpoolEntity;
import com.ycar.passenger.entity.DriverEntity;
import com.ycar.passenger.entity.RsvEntity;
import com.ycar.passenger.repository.DriverRepository;
import com.ycar.passenger.repository.RsvRepository;

@Service("chattingService")
public class ChattingService {

	@Autowired
	private RsvRepository rsvRepo;
	@Autowired
	private DriverRepository dRepo;

	public List<ChattingDomain> rsvList(int p_idx) {

		List<RsvEntity> list = rsvRepo.findByPIdx(p_idx);
		List<ChattingDomain> cdList = new ArrayList<ChattingDomain>();

		for (int i = 0; i < list.size(); i++) {

			RsvEntity rsv = list.get(i);
			DCarpoolEntity dcp = list.get(i).getDcp();

			// 운전자 nickname 가져오기
			String dNick = getDrvierNick(dcp.getD_idx());

			// 카풀 정보 넣기
			cdList.add(new ChattingDomain(rsv.getDr_idx(), rsv.getR_confirm(), dcp.getD_idx(), dcp.getD_date(),
					dcp.getD_starttime(), dcp.getD_endtime(), dcp.getD_startpoint(), dcp.getD_endpoint(),
					dcp.getD_commute(), dcp.getD_fee(), dcp.getD_distance(), dNick));

		}

		return cdList;
	}

	private String getDrvierNick(int d_idx) {

		DriverEntity entity = dRepo.getOne(d_idx);
		String dNick = entity.getNickname();

		return dNick;
	}

}
