package com.ycar.driver.model.board;
/**
 * 페이지 12345 순서까지 나오게
 * */
public class Pagination {
	private int listSize = 10; //한 페이지당 목록개수 10
	private int rangeSize = 5; //페이지범위 5
	private int page = 1; //현재 페이지번호
	private int range = 1; //현재페이지가 속한 범위의 시작번호
	private int listCnt; //게시글 총 개수
	private int pageCnt; //페이지 총개수
	private int rangeCnt; //페이지범위의 총 개수
	private int startIndex = 0; // 시작 인덱스
	private int startPage = 1; //페이지범위 내 시작페이지
	private int endPage = 1; //페이지범위 내 마지막페이지
	private boolean prev; //앞으로 혹은 이전 페이지범위로
	private boolean next; //다음 페이지범위로
	
	
	/**
	 * 첫번째방법
	 * */
	public void paging(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		//전체페이지수
		this.pageCnt = (int)Math.ceil(listCnt*1.0 / listSize);

		//시작페이지
		this.startPage = (range - 1) * rangeSize + 1 ;
		
		//끝페이지
		this.endPage = range * rangeSize ;
		
		//게시판시작번호
		this.startIndex = (page - 1) * listSize;
		
		//이전버튼
		this.prev = range==1 ? false : true;
		
		//다음버튼
		this.next = endPage > pageCnt ? false : true;
		if(this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false; 
		}
		
		
	}
	
	
	/**
	 * 두번째방법,,
	 * */
	//range 범위 세팅
	public void rangeSetting(int page) {
		setRange(page);
		this.startPage = (range - 1) * rangeSize + 1 ;
		this.endPage = startPage + rangeSize ;
		
		if(endPage > pageCnt) {
			this.endPage = pageCnt;
		}
		
		//이전버튼
		this.prev = range==1 ? false : true;
		
		//다음버튼
		this.next = endPage > pageCnt ? false : true;
		
	}
	
	//실제 사용할 생성자,,
	public Pagination(int listCnt, int page) {
		/*현재 페이지*/
		setPage(page);
		
		/*총 게시물 수*/
		setListCnt(listCnt);
		
		/* 1. 총 페이지 수*/
		setPageCnt(listCnt);
		
		/* 2. 총 range 수*/
		setRangeCnt(page);
		
		/* 3. range setting*/
		rangeSetting(page);
		
		/* start index 설정 */
		setStartIndex(page);
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRange() {
		return range;
	}
	public void setRange(int page) {
		this.range = (int)((page - 1) / rangeSize) + 1;
	}
	public int getListCnt() {
		return listCnt;
	}
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getListSize() {
		return listSize;
	}
	public int getRangeSize() {
		return rangeSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int listCnt) {
		this.pageCnt = (int)Math.ceil(listCnt*1.0 / listSize);
	}
	public int getRangeCnt() {
		return rangeCnt;
	}
	public void setRangeCnt(int pageCnt) {
		this.rangeCnt = (int)Math.ceil(pageCnt*1.0 / rangeSize);

	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int page) {
		this.startIndex = (page -1) * listSize;
	}
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	
}
