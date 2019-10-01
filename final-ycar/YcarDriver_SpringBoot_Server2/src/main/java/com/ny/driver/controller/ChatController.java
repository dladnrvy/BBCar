package com.ny.driver.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.ny.driver.domain.ChatFriend;
import com.ny.driver.entity.ReservationEntity;
import com.ny.driver.service.ChatService;

@RestController
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	
	@GetMapping("/chat/{d_idx}")
	public ResponseEntity<List<ChatFriend>> getLists(@PathVariable("d_idx") String d_idx){
		System.out.println("들어오나? 01     " + d_idx);
		
		List<ChatFriend> list = chatService.getLists(d_idx);
		
		System.out.println("들어오나? Controller    02     "+ list);
		
		return new ResponseEntity<List<ChatFriend>>(list, HttpStatus.OK);
	}
	
	
	
}
