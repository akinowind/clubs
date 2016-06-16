package com.club.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.club.model.Member_info;
import com.club.model.News;
import com.club.model.Project;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;

public class ProjectService {
	
	public void pass(Project pro){
		Connection conn = DB.createConn();
		
		String sql = "update project set pro_statue = 2 where  pro_id= ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, pro.getPro_id());
			
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	public void unpass(Project pro){
		Connection conn = DB.createConn();
				
				String sql = "update project set pro_statue = 3 where pro_id= ?";
				PreparedStatement ps = DB.prepare(conn, sql);
				try {
					ps.setInt(1,  pro.getPro_id());
					
					
					 ps.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				DB.close(ps);
				DB.close(conn);
			}

	
	
	public void fundtotal(Project pro){
		
		Connection conn = DB.createConn();
		String sql="update project set pro_fundtotal=? where pro_id =?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, pro.getPro_fundtotal());
			ps.setInt(2,pro.getPro_id());
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		
	}
	
	public void pass(News n){
		Connection conn = DB.createConn();
		
		String sql = "update news set n_statue = 1 where n_id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, n.getN_id());
			
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	public void unpass(News n){
Connection conn = DB.createConn();
		
		String sql = "update news set n_statue = 2 where n_id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, n.getN_id());
			
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	
	public void apply(Project pro){
		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();   
		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
	    
	    String sql="insert into project (pro_cid,pro_name,pro_content,pro_fund,pro_statue,pro_fundtotal) values("+clubid+",?,?,?,1,?)";
	    PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, pro.getPro_name());
			ps.setString(2,pro.getPro_content());
			ps.setString(3, pro.getPro_fund());
			ps.setInt(4, pro.getPro_fundtotal());
			
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	public List<Project> list(){
		List<Project> pros = new ArrayList<Project>();
		Project pro = null;
		Connection conn= DB.createConn();
		String sql="select * from project,club_info where pro_cid =c_id order by pro_statue";
		PreparedStatement ps = DB.prepare(conn, sql);
		
		try {
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				pro=new Project();
				pro.setPro_cid(rs.getInt("pro_cid"));
				pro.setPro_content(rs.getString("pro_content"));
				pro.setPro_fund(rs.getString("pro_fund"));
				pro.setPro_name(rs.getString("pro_name"));
				pro.setPro_statue(rs.getInt("pro_statue"));
				pro.setPro_cname(rs.getString("c_name"));
				pro.setPro_fundtotal(rs.getInt("pro_fundtotal"));
				pro.setPro_id(rs.getInt("pro_id"));
				pros.add(pro);			
		}
		}
			catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return pros;
		
	}
	
}
