package com.ycha.par.domain;

public class ReviewEditPassenger {
	
	private int rv_idx; //from client
	private int p_idx; //from client
	private String content; //from client
	private int star; //from client
	
	public int getRv_idx() {
		return rv_idx;
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	
	@Override
	public String toString() {
		return "ReviewEditPassenger [rv_idx=" + rv_idx + ", p_idx=" + p_idx + ", content=" + content + ", star=" + star
				+ "]";
	}
	
	
}
