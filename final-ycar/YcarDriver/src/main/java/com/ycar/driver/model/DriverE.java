package com.ycar.driver.model;
/**이메일인증
 * */
public class DriverE extends DriverOrigin{
	private String cemail;
	
	//생성자
	public DriverE(String type, char gender, String name, String ctype, String company, String cemail) {
//		super();
		super(type, gender, name, ctype, company);
		this.cemail = cemail;
	}
	
	

	public DriverE(int d_idx, String type, char gender, String name, String ctype, String company, String lscnum,
			String idnum1, String idnum2, char lsctype, String sdate, String police, String carnum, char cartype,
			String d_option, String cemail) {
		super(d_idx, type, gender, name, ctype, company, lscnum, idnum1, idnum2, lsctype, sdate, police, carnum, cartype,
				d_option);
		this.cemail = cemail;
	}



	public DriverE(String cemail) {
	}

	public String getCemail() {
		return cemail;
	}
	public void setCemail(String cemail) {
		this.cemail = cemail;
	}

	
	
}
