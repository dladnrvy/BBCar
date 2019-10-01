package com.ycar.driver.model.board;

/**
 * 1 insert할 때에도 쓰는 클래스
 * 2 게시글 자세한 내용 볼 때 보여주는 객체 
 * */

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Post {
	private int faq_idx;
	private int d_idx;
	private String nickname;
	private String title;
	private String cont;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm", timezone="Asia/Seoul")
	private Date time;
	private int hit;

	public Post() {
		this.time = new Date();
	}
	
	//insert할 때 쓰는 생성자
	public Post(int d_idx, String title, String cont) {
		this.d_idx = d_idx;
		this.title = title;
		this.cont = cont;
		this.time = new Date();
	}
	
	public Post(int faq_idx, int d_idx, String title, String cont) {
		this.faq_idx = faq_idx;
		this.d_idx = d_idx;
		this.title = title;
		this.cont = cont;
	}

	public Post(int faq_idx, int d_idx, String title, String cont, Date date, int hit) {
		this.faq_idx = faq_idx;
		this.d_idx = d_idx;
		this.title = title;
		this.cont = cont;
		this.time = date;
		this.hit = hit;
	}
	
	
	public Post(int faq_idx, int d_idx, String nickname, String title, String cont, Date date, int hit) {
		this.faq_idx = faq_idx;
		this.d_idx = d_idx;
		this.nickname = nickname;
		this.title = title;
		this.cont = cont;
		this.time = date;
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "Post [faq_idx=" + faq_idx + ", d_idx=" + d_idx + ", nickname=" + nickname + ", title=" + title
				+ ", cont=" + cont + ", date=" + time + ", hit=" + hit + "]";
	}

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
	public Date getDate() {
		return time;
	}
	public void setDate(Date date) {
		this.time = date;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	
	
	
}
