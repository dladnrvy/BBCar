package com.ycar.driver.model.board;

public class BoardEdit {
	private int faq_idx;
	private int d_idx;
	private String title;
	private String cont;
	
	public int getFaq_idx() {
		return faq_idx;
	}
	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCont() {
		return cont;
	}
	public void setCont(String cont) {
		this.cont = cont;
	}

	public BoardEdit(int faq_idx, int d_idx, String title, String cont) {
		this.faq_idx = faq_idx;
		this.d_idx = d_idx;
		this.title = title;
		this.cont = cont;
	}
	@Override
	public String toString() {
		return "BoardEdit [faq_idx=" + faq_idx + ", d_idx=" + d_idx + ", title=" + title + ", cont=" + cont + "]";
	}
	
	
}
