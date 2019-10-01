package com.ycar.driver.model;
/**
 * 재직증명서인증
 * */
public class DriverP extends DriverOrigin{
	private String cnum;

	//생성자	
	public DriverP() {
		super();
	}
	
	
	
	public DriverP(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option, String cnum) {
		super(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype,
				d_option);
		this.cnum = cnum;
	}



	public String getCnum() {
		return cnum;
	}
	public void setCnum(String cnum) {
		this.cnum = cnum;
	}
	
	
}
