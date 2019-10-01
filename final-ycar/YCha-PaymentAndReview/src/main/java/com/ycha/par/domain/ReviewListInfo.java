package com.ycha.par.domain;

public class ReviewListInfo {
	
	private int rv_idx;
	private int p_idx; //client
	private int d_idx; 
	private int payidx; //client
	private String writer;
	private String content; //client
	private int star; //client
	private String p_nickname;
	private String d_nickname;
	
	
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
	public String getP_nickname() {
		return p_nickname;
	}
	public void setP_nickname(String p_nickname) {
		this.p_nickname = p_nickname;
	}
	public String getD_nickname() {
		return d_nickname;
	}
	public void setD_nickname(String d_nickname) {
		this.d_nickname = d_nickname;
	}
	
	@Override
	public String toString() {
		return "ReviewListInfo [rv_idx=" + rv_idx + ", p_idx=" + p_idx + ", d_idx=" + d_idx + ", payidx=" + payidx
				+ ", writer=" + writer + ", content=" + content + ", star=" + star + ", p_nickname=" + p_nickname
				+ ", d_nickname=" + d_nickname + "]";
	}
	}
