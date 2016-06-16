package com.club.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;



public class Classroom {
	private int p_id;
	private String p_name;
	private String p_t_cname;
	private int p_t_time;
	private String p_t_reason;
	private int id;
	private String p_media;
	//空的时候传参
	private int kong;
	
	
	
	
	
	
	///////////
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_t_cname() {
		return p_t_cname;
	}
	public void setP_t_cname(String p_t_cname) {
		this.p_t_cname = p_t_cname;
	}
	public int getP_t_time() {
		return p_t_time;
	}
	public void setP_t_time(int p_t_time) {
		this.p_t_time = p_t_time;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_t_reason() {
		return p_t_reason;
	}
	public void setP_t_reason(String p_t_reason) {
		this.p_t_reason = p_t_reason;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getKong() {
		return kong;
	}
	public void setKong(int kong) {
		this.kong = kong;
	}
	public String getP_media() {
		return p_media;
	}
	public void setP_media(String p_media) {
		this.p_media = p_media;
	}

}
