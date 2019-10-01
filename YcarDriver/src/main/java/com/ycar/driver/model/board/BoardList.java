package com.ycar.driver.model.board;
/**
 * 게시글 리스트로 보여주는 객체
 * */

import java.util.List;

public class BoardList {
	private List<Board> list; //list형식
	private int totalPosts; //전체 게시글 수
	private int no; //번호
	private int curPageNumber; //현재페이지
	private int pageTotalCnt; //페이지 전체 수
	@Override
	public String toString() {
		return "BoardList [list=" + list + ", totalPosts=" + totalPosts + ", no=" + no + ", curPageNumber="
				+ curPageNumber + ", pageTotalCnt=" + pageTotalCnt + "]";
	}
	public List<Board> getList() {
		return list;
	}
	public void setList(List<Board> list) {
		this.list = list;
	}
	public int getTotalPosts() {
		return totalPosts;
	}
	public void setTotalPosts(int totalPosts) {
		this.totalPosts = totalPosts;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getCurPageNumber() {
		return curPageNumber;
	}
	public void setCurPageNumber(int curPageNumber) {
		this.curPageNumber = curPageNumber;
	}
	public int getPageTotalCnt() {
		return pageTotalCnt;
	}
	public void setPageTotalCnt(int pageTotalCnt) {
		this.pageTotalCnt = pageTotalCnt;
	}
	
	
}
