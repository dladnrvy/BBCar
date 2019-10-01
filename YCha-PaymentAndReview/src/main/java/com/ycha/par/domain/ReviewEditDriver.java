package com.ycha.par.domain;

public class ReviewEditDriver {
	
	private int rv_idx; 
	private int d_idx; //from client
	private String content; //from client
	private int star; //from client
	
	public int getRv_idx() {
		return rv_idx;
	}
	public void setRv_idx(int rv_idx) {
		this.rv_idx = rv_idx;
	}
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
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
		return "ReviewEditDriver [rv_idx=" + rv_idx + ", d_idx=" + d_idx + ", content=" + content + ", star=" + star
				+ "]";
	}
	
	
}
