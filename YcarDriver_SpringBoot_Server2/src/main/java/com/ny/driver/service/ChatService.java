package com.ny.driver.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ny.driver.domain.ChatFriend;
import com.ny.driver.entity.PassengerEntity;
import com.ny.driver.entity.ReservationEntity;
import com.ny.driver.repository.PasngrRepository;
import com.ny.driver.repository.ReservRepository;

/**
 * chatting을 위한 list + 상대방 nickname 출력
 * method를 나눠서 + for문 대신 while문으로 설정하여 속도 개선.
 * 기존 for 문으로 돌릴 때 보다 빠른 출력.
 * */
@Service("chatService")
public class ChatService {

	
	@Autowired
	private ReservRepository resRepository;
	
	@Autowired
	private PasngrRepository pasRepository;
	
	
	//전체리스트 가져오기
	public List<ChatFriend> getLists(String d_idx){
		//return friendList
		List<ChatFriend> friendList = new ArrayList<ChatFriend>();

		
		//나에게 신청한 사람들 list 가져오기
		List<ReservationEntity> list = resRepository.getlists(d_idx);
		
		//반환해야할 chat friend list 값 설정.
		friendList = setFirend(list);
		
		System.out.println("service end ---");
		System.out.println(friendList);
		return friendList;
	}
	
	//신청자의 닉네임 가져오기
	public String getPassengerNickname(Long p_idx) {
		PassengerEntity entity = pasRepository.getOne(p_idx);
		
		return entity.getNickname();
	}
	
	//chat friend 리스트 설정해주기
	public List<ChatFriend> setFirend(List<ReservationEntity> list){
		List<ChatFriend> friendList = new ArrayList<ChatFriend>();
		
		int index = 0 ;
		
		while(index<list.size()) {
			
			ReservationEntity entity = list.get(index);
			System.out.println("넣기전 entity " + entity + "index" + index);
			
			
			String p_nickname = getPassengerNickname(entity.getP_idx());
			System.out.println("nickname 설정? " + p_nickname);
			
			
			friendList.add(new ChatFriend(p_nickname, entity));
			
			index++;
		}
		
		return friendList;
	}
}
