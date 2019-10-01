package com.ycha.par.domain;

public class Review {
	
	private int rv_idx;
	private int p_idx; //client
	private int d_idx; 
	private int payidx; //client
	private String writer;
	private String content; //client
	private int star; //client
	
	
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
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public int getPayidx() {
		return payidx;
	}
	public void setPayidx(int payidx) {
		this.payidx = payidx;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
		return "Review [rv_idx=" + rv_idx + ", p_idx=" + p_idx + ", d_idx=" + d_idx + ", payidx=" + payidx + ", writer="
				+ writer + ", content=" + content + ", star=" + star + "]";
	}
}
