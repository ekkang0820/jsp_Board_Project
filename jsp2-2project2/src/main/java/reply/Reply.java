package reply;

import java.sql.Timestamp;

public class Reply {
	private int re_num;
	private int bd_num;
	private String re_txt;
	private Timestamp re_date;
	private String userMail;
	
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public int getRe_num() {
		return re_num;
	}
	public void setRe_num(int re_num) {
		this.re_num = re_num;
	}
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public String getRe_txt() {
		return re_txt;
	}
	public void setRe_txt(String re_txt) {
		this.re_txt = re_txt;
	}
	public Timestamp getRe_date() {
		return re_date;
	}
	public void setRe_date(Timestamp re_date) {
		this.re_date = re_date;
	}
}
