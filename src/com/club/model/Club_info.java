package com.club.model;

import java.sql.Date;

public class Club_info {
	private int c_id ;
	//社团负责人学号
	private int c_mid;
	private String c_name;
	private Date c_starttime;
	private int c_up;
	private String c_brief;
	private String c_rule;
	private String c_type;
	private String c_logo;
	private String c_office;
	private int c_fund;
	private String c_fundsource;
	private String c_organization;
	private String c_dailyactive;
	private String c_goodactive;
	private String c_prize;

	
	
	
	
	
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public Date getC_starttime() {
		return c_starttime;
	}
	public void setC_starttime(Date c_starttime) {
		this.c_starttime = c_starttime;
	}
	public int getC_up() {
		return c_up;
	}
	public void setC_up(int c_up) {
		this.c_up = c_up;
	}
	public String getC_brief() {
		return c_brief;
	}
	public void setC_brief(String c_brief) {
		this.c_brief = c_brief;
	}
	public String getC_rule() {
		return c_rule;
	}
	public void setC_rule(String c_rule) {
		this.c_rule = c_rule;
	}
	public String getC_type() {
		return c_type;
	}
	public void setC_type(String c_type) {
		this.c_type = c_type;
	}
	public String getC_logo() {
		return c_logo;
	}
	public void setC_logo(String c_logo) {
		this.c_logo = c_logo;
	}
	public String getC_office() {
		return c_office;
	}
	public void setC_office(String c_office) {
		this.c_office = c_office;
	}
	public int getC_fund() {
		return c_fund;
	}
	public void setC_fund(int c_fund) {
		this.c_fund = c_fund;
	}
	public String getC_fundsource() {
		return c_fundsource;
	}
	public void setC_fundsource(String c_fundsource) {
		this.c_fundsource = c_fundsource;
	}
	public String getC_organization() {
		return c_organization;
	}
	public void setC_organization(String c_organization) {
		this.c_organization = c_organization;
	}
	public String getC_dailyactive() {
		return c_dailyactive;
	}
	public void setC_dailyactive(String c_dailyactive) {
		this.c_dailyactive = c_dailyactive;
	}
	public String getC_goodactive() {
		return c_goodactive;
	}
	public void setC_goodactive(String c_goodactive) {
		this.c_goodactive = c_goodactive;
	}
	public String getC_prize() {
		return c_prize;
	}
	public void setC_prize(String c_prize) {
		this.c_prize = c_prize;
	}
	public int getC_mid() {
		return c_mid;
	}
	public void setC_mid(int c_mid) {
		this.c_mid = c_mid;
	}
}
