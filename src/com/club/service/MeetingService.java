package com.club.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.club.model.Meeting;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;

public class MeetingService {

	
	
	
	public void pass(int id){
		Connection conn = DB.createConn();
		
		String sql = "update meeting set me_statue = 2 where  me_id= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,id);
			
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	public void unpass(int id){
		Connection conn = DB.createConn();
				
				String sql = "update meeting set me_statue = 3 where me_id= ?";
				PreparedStatement ps = DB.prepare(conn, sql);
				try {
					ps.setInt(1,id);
					
					
					 ps.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				DB.close(ps);
				DB.close(conn);
			}

	
	public void save(Meeting me){
	
		HttpServletRequest request = ServletActionContext.getRequest();
		
		int user=Integer.parseInt(request.getRemoteUser().substring(2,10));
	
		String 	sql="insert into meeting  (me_mid,me_media,me_department,me_person,me_theme,me_starttime,me_endtime,me_host,me_phone,me_part,me_attend,me_content,me_statue,me_number) values (?,?,?,?,?,?,?,?,?,?,?,?,1,"+user+")";
			Connection conn = DB.createConn();
			PreparedStatement ps = DB.prepare(conn, sql);
			try {
				
				ps.setInt(1, me.getMe_mid());
				ps.setString(2, me.getMe_media());
				ps.setString(3, me.getMe_department());
				ps.setString(4,me.getMe_person());
				ps.setString(5, me.getMe_theme());
				ps.setString(6, me.getMe_starttime());
				ps.setString(7, me.getMe_endtime());
				ps.setString(8, me.getMe_host());
				ps.setString(9, me.getMe_phone());
				ps.setString(10, me.getMe_part());
				ps.setString(11, me.getMe_attend());
				ps.setString(12, me.getMe_content());
			
				 ps.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(ps);
			DB.close(conn);
	}
	
	public List<Meeting> list(Integer currentPage,Integer numPerPage,String orderField,String orderDirection){
		
		String 	sql="select top "+numPerPage+" * from meeting where me_statue = 2 and me_id not in (select top "+(currentPage-1)*numPerPage +"me_id from meeting where me_statue=2)";
		Connection conn = DB.createConn();
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Meeting> mes = new ArrayList<Meeting>();
		Meeting me =null;
		try {
			
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()){
				 me= new Meeting();
				 me.setMe_attend(rs.getString("me_attend"));
				 me.setMe_content(rs.getString("me_content"));
				 me.setMe_department(rs.getString("me_department"));
				 me.setMe_endtime2(rs.getTimestamp("me_endtime"));
				 me.setMe_host(rs.getString("me_host"));
				 me.setMe_id(rs.getInt("me_id"));
				 me.setMe_media(rs.getString("me_media"));
				 me.setMe_mid(rs.getInt("me_mid"));
				 me.setMe_number(rs.getInt("me_number"));
				 me.setMe_part(rs.getString("me_part"));
				 me.setMe_person(rs.getString("me_person"));
				 me.setMe_phone(rs.getString("me_phone"));
				 me.setMe_starttime2(rs.getTimestamp("me_starttime"));
				 me.setMe_theme(rs.getString("me_theme"));
				 mes.add(me);
				 
			 }
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return mes;
		
		
	}
public List<Meeting> orderlist(Integer currentPage,Integer numPerPage,String orderField,String orderDirection){
		
		String 	sql="select top "+numPerPage+" * from meeting where me_statue = 1 and me_id not in (select top "+(currentPage-1)*numPerPage +"me_id from meeting where me_statue=1)";
		Connection conn = DB.createConn();
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Meeting> mes = new ArrayList<Meeting>();
		Meeting me =null;
		try {
			
			 
			 ResultSet rs = ps.executeQuery();
			 while(rs.next()){
				 me= new Meeting();
				 me.setMe_attend(rs.getString("me_attend"));
				 me.setMe_content(rs.getString("me_content"));
				 me.setMe_department(rs.getString("me_department"));
				 me.setMe_endtime2(rs.getTimestamp("me_endtime"));
				 me.setMe_host(rs.getString("me_host"));
				 me.setMe_id(rs.getInt("me_id"));
				 me.setMe_mid(rs.getInt("me_mid"));
				 me.setMe_media(rs.getString("me_media"));
				 me.setMe_number(rs.getInt("me_number"));
				 me.setMe_part(rs.getString("me_part"));
				 me.setMe_person(rs.getString("me_person"));
				 me.setMe_phone(rs.getString("me_phone"));
				 me.setMe_starttime2(rs.getTimestamp("me_starttime"));
				 me.setMe_theme(rs.getString("me_theme"));
				 mes.add(me);
				 
			 }
			 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return mes;
		
		
	}
	public int[] room(String start,String end){

		Connection conn = DB.createConn();
		String sql ="select me_starttime,me_endtime,me_mid from meeting  ";
		PreparedStatement ps = DB.prepare(conn, sql);
		int a[] = new int[15];;
		try {
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				if(rs.getInt("me_mid")==1){
					
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[0]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
							
								}
						else {
								a[0]=1;
								}
				
				
				}
				
				else if(rs.getInt("me_mid")==2)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[1]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[1]=1;
								}
				}
				else if(rs.getInt("me_mid")==3)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[2]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[2]=1;
								}
				}
				
				else if(rs.getInt("me_mid")==4)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[3]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[3]=1;
								}
				}
				
				
				else if(rs.getInt("me_mid")==5)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[4]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[4]=1;
								}
				}
				else if(rs.getInt("me_mid")==6)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[5]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[5]=1;
								}
				}
				else if(rs.getInt("me_mid")==7)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[6]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[6]=1;
								}
				}
				else if(rs.getInt("me_mid")==8)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[7]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[7]=1;
								}
				}
				else if(rs.getInt("me_mid")==9)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[8]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[8]=1;
								}
				}
				else if(rs.getInt("me_mid")==10)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[9]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[9]=1;
								}
				}
				else if(rs.getInt("me_mid")==11)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[10]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[10]=1;
								}
				}
				else if(rs.getInt("me_mid")==12)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[11]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[11]=1;
								}
				}
				else if(rs.getInt("me_mid")==13)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[12]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[12]=1;
								}
				}
				else if(rs.getInt("me_mid")==14)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[13]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[13]=1;
								}
				}
				else if(rs.getInt("me_mid")==15)
				{
					if(rs.getString("me_starttime").compareTo(start)>0){
						if(rs.getString("me_starttime").compareTo(end)>0)
						{
							
						}
						else{
							a[14]=1;
							}
						}
						else if(start.compareTo(rs.getString("me_endtime"))>0){
								
								}
						else {
								a[14]=1;
								}
				}
				
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return a;
	}
	
	
	
	
	public Integer getCout() {
		int count=0;
		Connection conn = DB.createConn();
		String sql ="select count(1) from meeting WHERE me_statue = 1";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				count=rs.getInt(1);
				
			}	
			else{System.out.println(count);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return count;
	}
	
}
