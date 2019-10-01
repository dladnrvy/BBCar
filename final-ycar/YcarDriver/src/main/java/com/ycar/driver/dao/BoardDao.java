package com.ycar.driver.dao;

import java.util.List;

import com.ycar.driver.model.board.Board;
import com.ycar.driver.model.board.BoardEdit;
import com.ycar.driver.model.board.Post;

public interface BoardDao {
	
	//글쓰기
	public int insertBoard(Post post);

	//글리스트
	public List<Board> selectBoardList(int startIndex, int listSize);
	
	//글 전체 개수
	public int getListTotalCnt();
	
	//글수정
	public int editBoard(BoardEdit boardEdit);
	
	//삭제
	public int delBoard(int faq_idx); 
	
	//글 자세히 읽기
	public Post showDetailBoard(int faq_idx);
	
	
}
