package com.club.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.club.model.Club_info;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;

public class ClubService {

	public List<Club_info> list(String c_name,Integer currentPage,Integer numPerPage,String orderField,String orderDirection) {
		Connection conn = DB.createConn();
		
		String sql = " ";
		sql="select * from (select top "+numPerPage+" * from club_info where (c_id not in (select top "+(currentPage-1)*numPerPage+" c_id from club_info order by c_id)) and c_name like ? order by c_id) a ";
		if(orderField!=null&&!"".equals(orderField)){
			sql +=" order by "+orderField+" "+orderDirection;
	
			
		}
	
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Club_info> clubs = new ArrayList<Club_info>();
		try {
			ps.setString(1, "%"+c_name+"%");
			ResultSet rs = ps.executeQuery();
			Club_info c = null;
			if(rs.next()){
			do{
				c = new Club_info();
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));
				c.setC_up(rs.getInt("c_up"));
				c.setC_type(rs.getString("c_type"));
				c.setC_starttime(rs.getDate("c_starttime"));
				
				clubs.add(c);
				
				
			}	while(rs.next()) ;}	
			else{System.out.println(clubs);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return clubs;
		
	}
	
	public Club_info getClub_info(int c_id) {
		Club_info c = null;
		Connection conn = DB.createConn();
		String sql ="select * from club_info,club_member where c_id = ? and c_id = c_m_cid and c_m_job = 1";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			ps.setInt(1, c_id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				
				c = new Club_info();
				
				c.setC_name(rs.getString("c_name"));
				c.setC_starttime(rs.getDate("c_starttime"));
				c.setC_id(rs.getInt("c_id"));
				c.setC_mid(rs.getInt("c_m_mid"));
				
				
				
			}	
			else{System.out.println(c);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return c;
	}
	
	public void saveorupdate(Club_info c){
		String sql="";
		
		if(c.getC_id()==0){
			sql="declare @a int insert into club_info(c_name,c_starttime) values(?,?) select @a = @@IDENTITY insert into club_member(c_m_cid,c_m_mid,c_m_job) values (@a,?,1)";
			
			
		}else{
			sql="update club_info,club_member set c_name = ?,c_starttime = ?,c_m_mid = ? where c_id= ? and c_id = c_m_cid and c_m_job = 1 ";
		}
		Connection conn = DB.createConn();
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			ps.setString(1, c.getC_name());
			ps.setDate(2, c.getC_starttime());
			ps.setInt(3, c.getC_mid());
			if(c.getC_id()!=0){
				
				ps.setInt(4, c.getC_id());
				
				
			}
		
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		DB.close(ps);
		DB.close(conn);
		
		
	}
	
	
	public void inf(Club_info c){
		//获取session中的社团ID
		ActionContext actionContext = ActionContext.getContext();   		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
	  //获取session中的社团ID
		String sql="";
		sql="update club_info set c_type = ?,c_up = ?,c_office = ?,c_fund= ?,c_fundsource = ?,c_brief = ?,c_organization=?,c_dailyactive=?,c_goodactive=?,c_prize=?,c_rule=? where  c_id = "+clubid+"  ";
		
		Connection conn = DB.createConn();
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			ps.setString(1, c.getC_type());
			ps.setInt(2, c.getC_up());
			ps.setString(3, c.getC_office());
			ps.setInt(4,c.getC_fund());
			ps.setString(5, c.getC_fundsource());
			ps.setString(6, c.getC_brief());
			ps.setString(7, c.getC_organization());
			ps.setString(8, c.getC_dailyactive());
			ps.setString(9, c.getC_goodactive());
			ps.setString(10, c.getC_prize());
			ps.setString(11, c.getC_rule());
			
		
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		DB.close(ps);
		DB.close(conn);
		
		
	}
	
	public Club_info infshow(int clubid) {
		Connection conn = DB.createConn();
		
		String sql = " ";
		sql="select * from club_info where c_id = ? ";
		
	
		PreparedStatement ps = DB.prepare(conn, sql);
		Club_info c = new Club_info();
		try {
			ps.setInt(1, clubid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				
				c.setC_id(rs.getInt("c_id"));
				c.setC_name(rs.getString("c_name"));
				c.setC_up(rs.getInt("c_up"));
				c.setC_type(rs.getString("c_type"));
				c.setC_starttime(rs.getDate("c_starttime"));
				c.setC_brief(rs.getString("c_brief"));
				c.setC_dailyactive(rs.getString("c_dailyactive"));
				c.setC_fund(rs.getInt("c_fund"));
				c.setC_fundsource(rs.getString("c_fundsource"));
				c.setC_goodactive(rs.getString("c_goodactive"));
				c.setC_office(rs.getString("c_office"));
				c.setC_organization(rs.getString("c_organization"));
				c.setC_prize(rs.getString("c_prize"));
				c.setC_rule(rs.getString("c_rule"));
			
			
				
				
				
			}	
			else{System.out.println("null");	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return c;
		
	}
	
	
	public void delete(String ids){
		String sql="delete from club_info where c_id in ("+ids+")";
		Connection conn = DB.createConn();
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		DB.close(ps);
		DB.close(conn);
	}
	public Integer getCout(String c_name) {
		int count=0;
		Connection conn = DB.createConn();
		String sql ="select count(1) from club_info where c_name like ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1,"%"+c_name+"%");
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
