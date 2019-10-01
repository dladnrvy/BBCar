package com.ycar.passenger.domain;

import java.util.Random;

// 회원 가입 분기처리 : 제일 상위 도메인
public class PassengerOrigin {
	private int p_idx;
	private String type;

	private String id;
	private String pw;
	private String email;

	private String ctype;
	private String company;

	private String name;
	private String nickname;
	private char gender;

	private String p_option;

	// 생성자
	PassengerOrigin() {

	}

	public PassengerOrigin(String type, String name, String ctype, String company, String p_option, char gender) {
		this.type = type;
		this.name = name;
		this.ctype = ctype;
		this.company = company;
		this.p_option = p_option;
		this.gender = gender;
		makeNickName();
	}

	private void makeNickName() {
		String[] adj = { "그뤠잇", "가냘픈", "대기만성", "모던", "전생에", "여린", "입큰", "발랄한", "심해", "반투명" };
		String[] name = { "렛서팬더", "쉬리", "갈색하이에나", "쇠고래", "고릴라", "왕사마귀", "말미잘산호", "찌르레기", "메추라기", "코요테" };

		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();

		temp.append(adj[rnd.nextInt(10)]);
		temp.append(" ");
		temp.append(name[rnd.nextInt(10)]);

		System.out.println("닉네임생성::::: " + temp);
		setNickname(temp.toString());
	}
	

	@Override
	public String toString() {
		return "PassengerOrigin [p_idx=" + p_idx + ", type=" + type + ", id=" + id + ", pw=" + pw + ", email=" + email
				+ ", ctype=" + ctype + ", company=" + company + ", name=" + name + ", nickname=" + nickname
				+ ", p_option=" + p_option + "]";
	}

	public int getP_idx() {
		return p_idx;
	}

	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getP_option() {
		return p_option;
	}

	public void setP_option(String p_option) {
		this.p_option = p_option;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}
	
	
}
