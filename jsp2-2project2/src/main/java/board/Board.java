package board;

import java.sql.Timestamp;

public class Board {
	private int bd_num;
	private String userMail;
	private String bd_title;
	private Timestamp bd_date;
	private String bd_txt;
	private String bd_img;
	
	public int getBd_num() {
		return bd_num;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public Timestamp getBd_date() {
		return bd_date;
	}
	public void setBd_date(Timestamp bd_date) {
		this.bd_date = bd_date;
	}
	public String getBd_txt() {
		return bd_txt;
	}
	public void setBd_txt(String bd_txt) {
		this.bd_txt = bd_txt;
	}
	public String getBd_img() {
        return bd_img;
    }

    public void setBd_img(String bd_img) {
        this.bd_img = bd_img;
    }
	
}