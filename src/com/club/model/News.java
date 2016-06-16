package com.club.model;

import java.sql.Timestamp;

public class News {
	private int n_id;
	private String n_title;
	private String n_content;
	private int n_author;
	private int n_type;
	private int n_clubid;
	private String n_cname;
	private int n_statue;
	private int n_ticket = 0;
	private String t_phone;
	private Timestamp n_inputtime;
	
	
	
	public int getN_statue() {
		return n_statue;
	}
	public void setN_statue(int n_statue) {
		this.n_statue = n_statue;
	}
	public int getN_id() {
		return n_id;
	}
	public void setN_id(int n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_author() {
		return n_author;
	}
	public void setN_author(int n_author) {
		this.n_author = n_author;
	}
	public int getN_type() {
		return n_type;
	}
	public void setN_type(int n_type) {
		this.n_type = n_type;
	}
	public int getN_clubid() {
		return n_clubid;
	}
	public void setN_clubid(int n_clubid) {
		this.n_clubid = n_clubid;
	}
	public String getN_cname() {
		return n_cname;
	}
	public void setN_cname(String n_cname) {
		this.n_cname = n_cname;
	}
	public int getN_ticket() {
		return n_ticket;
	}
	public void setN_ticket(int n_ticket) {
		this.n_ticket = n_ticket;
	}
	public String getT_phone() {
		return t_phone;
	}
	public void setT_phone(String t_phone) {
		this.t_phone = t_phone;
	}
	public Timestamp getN_inputtime() {
		return n_inputtime;
	}
	public void setN_inputtime(Timestamp n_inputtime) {
		this.n_inputtime = n_inputtime;
	}
	
}
