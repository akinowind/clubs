package com.club.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.club.model.Classroom;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;


public class ClassroomService {
	
	//获取下周一时间
	public String getSunday(){
		
		Calendar cal =Calendar.getInstance();
		cal.setFirstDayOfWeek(2);
		  cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		  String time = cal.getTime()+" 00:00:00";
		  
		  return time;
		
	}
	
	public List<Classroom> getPinfo(int p_id){
		Calendar cal =Calendar.getInstance();
		cal.setFirstDayOfWeek(2);
		  cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		  Date time = cal.getTime();
		  
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
			String time1=sdf.format(time);

		Connection conn = DB.createConn();
		String sql = "select * from classroom,classroom_time,club_info where p_id = p_t_id and p_id="+p_id+" and p_t_statue=2 and p_t_cid = c_id and p_t_date ="+time1+" ";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Classroom> pinfo= new ArrayList<Classroom>();
		try {
			ResultSet rs = ps.executeQuery();
			Classroom p = null;
			if(rs.next())
					{
			  do {
				
				p = new Classroom();
				p.setP_id(rs.getInt("p_id"));
				p.setP_t_cname(rs.getString("c_name"));
				p.setP_t_time(rs.getInt("p_t_time"));
				p.setP_name(rs.getString("p_name"));
				pinfo.add(p);
			}
			  while(rs.next());
					}
			
			else{
				p = new Classroom();
				p.setKong(3);
				p.setP_id(p_id);
				pinfo.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return pinfo;
		
	}
	
	public void order(Classroom p){
		Calendar cal =Calendar.getInstance();
		cal.setFirstDayOfWeek(2);
		  cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		  Date time = cal.getTime();
		  
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
			String time1=sdf.format(time);
			ActionContext actionContext = ActionContext.getContext();   
			  
		    Map session = actionContext.getSession();   
		    int clubid = (Integer) session.get("clubid");
		Connection conn = DB.createConn();
		String sql = "insert into classroom_time (p_t_id,p_media,p_t_date,p_t_statue,p_t_cid,p_t_reason,p_t_time) values (?,?,?,0,?,?,?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,p.getP_id());
			ps.setString(2,p.getP_media());
			ps.setString(3,time1);
			ps.setInt(4,clubid);
			ps.setString(5,p.getP_t_reason());
			ps.setInt(6,p.getP_t_time());
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		DB.close(conn);
		
	}
	
	public List<Classroom> orderlist(Integer currentPage,Integer numPerPage,String orderField,String orderDirection){
		
		Connection conn = DB.createConn();
		String sql = "select top "+numPerPage+" * from classroom ,classroom_time ,club_info  "
				+ "WHERE p_id = p_t_id and p_t_cid = c_id and p_t_statue = 0 and (id not in "
				+ "(select top "+(currentPage-1)*numPerPage+" id from classroom ,classroom_time ,club_info WHERE p_id = p_t_id and p_t_cid = c_id and p_t_statue = 0) )";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Classroom> oinfo= new ArrayList<Classroom>();
		try {
			ResultSet rs = ps.executeQuery();
			Classroom o = null;
			while(rs.next()) {
				o = new Classroom();
				o.setP_id(rs.getInt("p_id"));
				o.setP_media(rs.getString("p_media"));
				o.setP_t_cname(rs.getString("c_name"));
				o.setP_t_time(rs.getInt("p_t_time"));
				o.setP_name(rs.getString("p_name"));
				o.setP_t_reason(rs.getString("p_t_reason"));
				o.setId(rs.getInt("id"));
				oinfo.add(o);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return oinfo;
	}
	
	public void pass(Classroom p){
		Connection conn = DB.createConn();
		String sql = "update classroom_time set p_t_statue = 2 where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,p.getId());
			
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		DB.close(conn);
		
	}
	public void npass(Classroom p){
		Connection conn = DB.createConn();
		String sql = "update classroom_time set p_t_statue = 1 where id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,p.getId());
			
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		DB.close(conn);
	}
	
	/////
	
	
	
	public Integer getCout() {
		int count=0;
		Connection conn = DB.createConn();
		String sql ="select count(1) from classroom_time WHERE p_t_statue = 0 ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				count=rs.getInt(1);
				
			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return count;
	}
	
	
}
