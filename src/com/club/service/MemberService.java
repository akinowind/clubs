package com.club.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.club.model.Member_info;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;


public class MemberService {
	
	
	
	public List<Member_info> list(String member_name,Integer currentPage,Integer numPerPage,String orderField,String orderDirection) {
		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();   
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
		String sql = " ";
		sql="select * from (select top "+numPerPage+" student_id,member_name,c_m_cid,c_m_id,c_name,c_m_job,member_phone,member_college,member_qq,member_email,member_statue,member_class from member_info,club_member,club_info where (c_m_cid = c_id) and (student_id = c_m_mid) and c_m_cid = "+clubid +" and (student_id not in (select top "+(currentPage-1)*numPerPage+" student_id from member_info,club_member where student_id = c_m_mid and c_m_cid = "+clubid +" order by student_id)) and member_name like ? order by student_id) a ";
		if(orderField!=null&&!"".equals(orderField)){
			sql +=" order by "+orderField+" "+orderDirection;
		
		}
	
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Member_info> members = new ArrayList<Member_info>();
		try {
			ps.setString(1, "%"+member_name+"%");
			ResultSet rs = ps.executeQuery();
			Member_info m = null;
			if(rs.next()){
			do{
				m = new Member_info();
				
				m.setStudent_id(rs.getInt("student_id"));
				m.setMember_name(rs.getString("member_name"));
				m.setC_m_cid(rs.getInt("c_m_cid"));
				m.setC_name(rs.getString("c_name"));
				
				m.setC_m_job(rs.getInt("c_m_job"));
				m.setMember_phone(rs.getString("member_phone"));
				m.setMember_college(rs.getString("member_college"));
				m.setMember_email(rs.getString("member_email"));
				m.setMember_qq(rs.getString("member_qq"));
				m.setMember_class(rs.getString("member_class"));
				m.setMember_statue(rs.getInt("member_statue"));
				m.setC_m_id(rs.getInt("c_m_id"));
				
				
				members.add(m);
				
			}	while(rs.next()) ;}	
			else{System.out.println(members);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return members;
		
	}
	public List<Member_info> list2(String member_name,Integer currentPage,Integer numPerPage,String orderField,String orderDirection) {
		Connection conn = DB.createConn();
		
		String sql = " ";
		sql="select * from (select top "+numPerPage+" student_id,member_name,c_m_cid,c_m_id,c_name,c_m_job,member_phone,member_college,member_qq,member_email,member_statue,member_class from member_info,club_member,club_info where (c_m_cid = c_id) and (student_id = c_m_mid)  and (student_id not in (select top "+(currentPage-1)*numPerPage+" student_id from member_info,club_member where student_id = c_m_mid  order by student_id)) and member_name like ? order by student_id) a ";
		if(orderField!=null&&!"".equals(orderField)){
			sql +=" order by "+orderField+" "+orderDirection;
	
			
		}
	
		PreparedStatement ps = DB.prepare(conn, sql);
		List<Member_info> members = new ArrayList<Member_info>();
		try {
			ps.setString(1, "%"+member_name+"%");
			ResultSet rs = ps.executeQuery();
			Member_info m = null;
			if(rs.next()){
			do{
				m = new Member_info();
				
				m.setStudent_id(rs.getInt("student_id"));
				m.setMember_name(rs.getString("member_name"));
				m.setC_m_cid(rs.getInt("c_m_cid"));
				m.setC_name(rs.getString("c_name"));
				
				m.setC_m_job(rs.getInt("c_m_job"));
				m.setMember_phone(rs.getString("member_phone"));
				m.setMember_college(rs.getString("member_college"));
				m.setMember_email(rs.getString("member_email"));
				m.setMember_qq(rs.getString("member_qq"));
				m.setMember_class(rs.getString("member_class"));
				m.setMember_statue(rs.getInt("member_statue"));
				m.setC_m_id(rs.getInt("c_m_id"));
				members.add(m);
				
			}	while(rs.next()) ;}	
			else{System.out.println(members);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return members;
		
	}
     
	public void info(Member_info m)
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		
		int user=Integer.parseInt(request.getRemoteUser().substring(2,10));
		Connection conn = DB.createConn();
		String sql="update member_info set member_name=?,member_phone=?,member_qq=?,member_email=?,member_college=?,member_class=?,member_statue=? where student_id =? ";
		
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, m.getMember_name());
			ps.setString(2, m.getMember_phone());
			ps.setString(3, m.getMember_qq());
			ps.setString(4, m.getMember_email());
			ps.setString(5,m.getMember_college());
			ps.setString(6, m.getMember_class());
			ps.setInt(7, m.getMember_statue());
			ps.setInt(8, user);
			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		DB.close(ps);
		DB.close(conn);
	}
	
	public int getLevel(int user){
		int userlevel = 0;
		Connection conn = DB.createConn();
		String sql ="select c_m_job from club_member where c_m_mid = ? ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,user);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				userlevel=rs.getInt("c_m_job");
				
			}	
			else{System.out.println(userlevel);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return userlevel;
	}
	public int getLevel_1(int user){
		int userlevel_1 = 0;
		Connection conn = DB.createConn();
		String sql ="select t_userlevel from teacher where t_id = ? ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,user);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				userlevel_1=rs.getInt("t_userlevel");
				
			}	
			else{System.out.println(userlevel_1);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return userlevel_1;
	}
	public String getSname(int user){
		String sname="";
		Connection conn = DB.createConn();
		
		String sql ="select member_name,member_statue from member_info where student_id = ? ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,user);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				if(rs.getInt("member_statue")==0)
				{
				sname=null;
				}
				else
				{
					sname=rs.getString("member_name");
				}
			}	
			else{System.out.println();	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return sname;
	}
	
	
	public int getClub(int user){
		int clubid = 0;
		Connection conn = DB.createConn();
		String sql ="select c_m_cid from club_member where c_m_mid = ? ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1,user);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				clubid=rs.getInt("c_m_cid");
				
			}	
			else{System.out.println(clubid);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return clubid;
	}
	public String getClubname(int clubid){
		String clubname=" "; 
		Connection conn = DB.createConn();
		String sql ="select c_name from club_info where   c_id = "+clubid+" ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
			
				clubname=rs.getString("c_name");
				
			}	
			else{System.out.println(clubid);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return clubname;
	}
	public Integer getCout(String member_name) {
		int count=0;
		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();   
		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
		String sql ="select count(1) from member_info,club_member where (student_id = c_m_mid) and c_m_cid ="+clubid+"  and member_name like ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1,"%"+member_name+"%");
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
	//获取修改的信息，传回输入框
	public Member_info getMember_info(int student_id) {
		Member_info m = null;
		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();   
		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
		String sql ="select * from club_member,member_info where c_m_mid =? and c_m_mid = student_id and c_m_cid ="+clubid+"";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			
			ps.setInt(1, student_id);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				
				m = new Member_info();
				m.setMember_name(rs.getString("member_name"));
				m.setStudent_id(rs.getInt("c_m_mid"));
				m.setC_m_job(rs.getInt("c_m_job"));
				
				
				
			}	
			else{System.out.println(m);	}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return m;
	}
	//奖惩记录
	public void addgood(int c_m_id,String addgood){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
	    Connection conn = DB.createConn();
	    String sql="insert into member_perform (m_p_id,m_p_perform,m_p_type,m_p_inputtime) values(?,?,1,?) ";
	    PreparedStatement ps = DB.prepare(conn, sql);
	   
		try {
			ps.setInt(1, c_m_id);
			ps.setString(2, addgood);
			ps.setString(3, df.format(new Date()));
			ps.executeUpdate();		
				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		
		DB.close(conn);
		
		
	}
	
	public void addbad(int c_m_id,String addbad){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
	    Connection conn = DB.createConn();
	    String sql="insert into member_perform (m_p_id,m_p_perform,m_p_type,m_p_inputtime) values(?,?,2,?) ";
	    PreparedStatement ps = DB.prepare(conn, sql);
	   
		try {
			ps.setInt(1, c_m_id);
			ps.setString(2, addbad);
			ps.setString(3, df.format(new Date()));
				
			ps.executeUpdate();	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		
		DB.close(conn);
		
		
	}
	
	
	public List<Member_info> showrecord(int c_m_id){
		ActionContext actionContext = ActionContext.getContext();	  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
	    Connection conn = DB.createConn();
	    Member_info m = null;
	    List<Member_info> ms = new ArrayList<Member_info>();
	    String sql="select m_p_perform,m_p_type from member_perform where m_p_id = "+c_m_id+" ";
	    PreparedStatement ps = DB.prepare(conn, sql);
	   
		try {
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				m = new Member_info();
				
				if(rs.getInt("m_p_type")==1){
							
				m.setC_m_good(rs.getString("m_p_perform"));
				
				}
				else if(rs.getInt("m_p_type")==2)
				{
				m.setC_m_bad(rs.getString("m_p_perform"));
				
				}
				ms.add(m);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		
		DB.close(conn);
		
		return ms;
	}
	
	
	public void delete(String ids){
		ActionContext actionContext = ActionContext.getContext();   
		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
		
		String sql="delete from club_member where c_m_mid in ("+ids+") and c_m_cid = "+clubid +" ";
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
	
	public void saveorupdate(Member_info m){
		ActionContext actionContext = ActionContext.getContext();   
		  
	    Map session = actionContext.getSession();   
	    int clubid = (Integer) session.get("clubid");
		
		String sql="";
		
		if(m.getStatue()==1){
			sql="insert into member_info(student_id,member_name) values(?,?);insert into club_member (c_m_mid,c_m_cid,c_m_job) values(?,?,?)";
			Connection conn = DB.createConn();
			PreparedStatement ps = DB.prepare(conn, sql);
			try {
				
				ps.setInt(1, m.getStudent_id());
				ps.setString(2, m.getMember_name());
				ps.setInt(3, m.getStudent_id());
				ps.setInt(4, clubid);
				ps.setInt(5, m.getC_m_job());
				 ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(ps);
			DB.close(conn);
		}else{
			sql="update club_member set c_m_job = ? where c_m_mid=? and c_m_cid = ?";
			Connection conn = DB.createConn();
			PreparedStatement ps = DB.prepare(conn, sql);
			try {
				
				
				ps.setInt(1, m.getC_m_job());
				ps.setInt(2, m.getStudent_id());
				ps.setInt(3, clubid);
			    ps.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DB.close(ps);
			DB.close(conn);
		}
		
		
	
		
		
		
	}
	
	
}

