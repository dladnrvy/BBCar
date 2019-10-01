package com.ycar.driver.model.board;

/**
 * 1 board 게시판에 받아올 때,, 쓰는 객체
 * */

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Board {
	private int faq_idx;
	private String title;
	private String nickname;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm", timezone = "Asia/Seoul")
	private Date time;
	private int hit;

	public Board() {
	}

	public Board(int faq_idx, String title, String nickname, Date date, int hit) {
		this.faq_idx = faq_idx;
		this.title = title;
		this.nickname = nickname;
		this.time = date;
		this.hit = hit;
	}

	@Override
	public String toString() {
		return "Board [faq_idx=" + faq_idx + ", title=" + title + ", nickname=" + nickname + ", date=" + time + ", hit="
				+ hit + "]";
	}

	public int getFaq_idx() {
		return faq_idx;
	}

	public void setFaq_idx(int faq_idx) {
		this.faq_idx = faq_idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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

}
