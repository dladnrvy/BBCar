package com.ycar.driver.service.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ycar.driver.dao.BoardDao;
import com.ycar.driver.model.board.Board;
import com.ycar.driver.model.board.BoardList;
import com.ycar.driver.model.board.Post;

/**
 * 게시글 리스트 보여주는 서비스
 * */

@Service(value = "listService")
public class ListService {
	@Autowired
	private SqlSessionTemplate template;
	private BoardDao dao;
	
	final int POSTS_PER_CNT = 5; //page당 나올 게시글 수
	
	//리스트 보여주기 - 두번째방법
	public List<Board> selectBoardList(int startIndex, int listSize){
		List<Board> list = null;
		
		dao = template.getMapper(BoardDao.class);
		
		list = dao.selectBoardList(startIndex, listSize);
		
		return list;
	}
	
	//리스트 총 개수 가져오기
	public int listTotalCnt() {
		dao = template.getMapper(BoardDao.class);
		return dao.getListTotalCnt();
	}
	
	
	//자세한 내용보여주기
	public Post detail(int faq_idx) {
		dao = template.getMapper(BoardDao.class);
		return dao.showDetailBoard(faq_idx);
	}
	
}
