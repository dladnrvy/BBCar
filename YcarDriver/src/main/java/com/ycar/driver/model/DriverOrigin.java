package com.ycar.driver.model;

import java.util.Random;

public class DriverOrigin {
	private int d_idx;
	private String type;
	private char gender;
	private String name;
	
	private String ctype;
	private String company;

	private String lscnum;
	private String idnum1;
	private String idnum2;
	private char lsctype;
	private String sdate;
	private String police;
	private String carnum;
	private char cartype;
	
	private String d_option;
	
	private String nickname;
	
	//생성자
	public DriverOrigin() {
	}
	
	
	
	public DriverOrigin(String type, char gender, String name, String ctype, String company) {
		this.type = type;
		this.gender = gender;
		this.name = name;
		this.ctype = ctype;
		this.company = company;
		makeNickName();
	}
	
	
	
	public DriverOrigin(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option) {
		this.d_idx = d_idx;
		this.type = type;
		this.gender = gender;
		this.name = name;
		this.ctype = ctype;
		this.company = company;
		this.lscnum = lscnum;
		this.idnum1 = idnum1;
		this.idnum2 = idnum2;
		this.lsctype = lsctype;
		this.sdate = sdate;
		this.police = police;
		this.carnum = carnum;
		this.cartype = cartype;
		this.d_option = d_option;
		makeNickName();
	}



	public DriverOrigin getBasicInfo(String type, char gender, String name, String ctype, String company) {
		DriverOrigin origin = new DriverOrigin(type, gender, name, ctype, company);
		return origin;
	}


	@Override
	public String toString() {
		return "DriverOrigin [d_idx=" + d_idx + ", type=" + type + ", gender=" + gender + ", name=" + name + ", ctype="
				+ ctype + ", company=" + company + ", lscnum=" + lscnum + ", idnum1=" + idnum1 + ", idnum2=" + idnum2
				+ ", lsctype=" + lsctype + ", sdate=" + sdate + ", police=" + police + ", carnum=" + carnum
				+ ", cartype=" + cartype + ", d_option=" + d_option + ", nickname=" + nickname + "]";
	}



	public void makeNickName() {
		String[] adj = {
			"그뤠잇", "가냘픈", "대기만성" , "모던","전생에","여린", "입큰", "발랄한", "심해","반투명"
		};
		String[] name = {
			"렛서팬더", "쉬리", "갈색하이에나", "쇠고래", "고릴라", "왕사마귀", "말미잘산호", "찌르레기", "메추라기", "코요테"	
		};
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		
		temp.append(adj[rnd.nextInt(10)]);
		temp.append(" ");
		temp.append(name[rnd.nextInt(10)]);
		
		System.out.println("닉네임생성::::: " + temp);
		setNickName(temp.toString());
	}
	
	public int getD_idx() {
		return d_idx;
	}
	public void setD_idx(int d_idx) {
		this.d_idx = d_idx;
	}
	public String getNickName() {
		return nickname;
	}
	public void setNickName(String nickName) {
		this.nickname = nickName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
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
	public String getLscnum() {
		return lscnum;
	}
	public void setLscnum(String lscnum) {
		this.lscnum = lscnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIdnum1() {
		return idnum1;
	}
	public void setIdnum1(String idnum1) {
		this.idnum1 = idnum1;
	}
	public String getIdnum2() {
		return idnum2;
	}
	public void setIdnum2(String idnum2) {
		this.idnum2 = idnum2;
	}
	public char getLsctype() {
		return lsctype;
	}
	public void setLsctype(char lsctype) {
		this.lsctype = lsctype;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getPolice() {
		return police;
	}
	public void setPolice(String police) {
		this.police = police;
	}
	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	public char getCartype() {
		return cartype;
	}
	public void setCartype(char cartype) {
		this.cartype = cartype;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getD_option() {
		return d_option;
	}
	public void setD_option(String d_option) {
		this.d_option = d_option;
	}
	
	
}
