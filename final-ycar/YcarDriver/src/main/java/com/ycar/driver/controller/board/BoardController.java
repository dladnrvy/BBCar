package com.ycar.driver.controller.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ycar.driver.model.board.Board;
import com.ycar.driver.model.board.Pagination;
import com.ycar.driver.model.board.Post;
import com.ycar.driver.service.board.ListService;

/**
 * 드라이버 faq 게시판 컨트롤러 
 * */

@RestController
@RequestMapping("/faq")
public class BoardController {
	
	@Autowired
	private ListService listService;
	
//	@CrossOrigin
//	@RequestMapping(method = RequestMethod.GET)
//	public String board() {
//		return "faq/list";
//	}
	
	
	@CrossOrigin
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> boardList(@RequestParam(defaultValue = "1", value = "page") int page) {
		
		//전체
		int listCnt = listService.listTotalCnt();
		
		//pagination객체
		Pagination pagination = new Pagination(listCnt, page);
		
		int startIndex = pagination.getStartIndex();
		int listSize = pagination.getListSize();
		
		List<Board> list = listService.selectBoardList(startIndex, listSize);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pagination", pagination);
		
//		for(Board i : list) {
//			System.out.println(i);
//		}
		
		return new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);
	}
	
	//자세한 내용 보여주기
	@CrossOrigin
	@RequestMapping(value = "/{faq_idx}", method = RequestMethod.GET)
	public ResponseEntity<Post> detailPost(@PathVariable("faq_idx")int faq_idx){
		
		Post post = listService.detail(faq_idx);
		return new ResponseEntity<Post>(post, HttpStatus.OK);
	}
}
