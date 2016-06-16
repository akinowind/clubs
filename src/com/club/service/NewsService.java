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

import com.club.model.News;
import com.club.util.DB;
import com.opensymphony.xwork2.ActionContext;

public class NewsService {
	private int size=5;
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
	public void add(News n){

		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();
	    Map session = actionContext.getSession();
	    int clubid = (Integer) session.get("clubid");
		HttpServletRequest request = ServletActionContext.getRequest();

		int user=Integer.parseInt(request.getRemoteUser().substring(2,10));
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		String sql = "insert into news (n_title,n_content,n_author,n_clubid,n_type,n_statue,n_ticket,n_inputtime) values (?,?,"+user+","+clubid+",?,0,?,?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setString(1, n.getN_title());
			ps.setString(2,n.getN_content());
			ps.setInt(3, n.getN_type());
			ps.setInt(4, n.getN_ticket());
			ps.setString(5, df.format(new Date()));

			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	//订票
	public void ticketorder(News n){
		Connection conn = DB.createConn();
		HttpServletRequest request = ServletActionContext.getRequest();

		int user=Integer.parseInt(request.getRemoteUser().substring(2,10));


		String sql = "update news set n_ticket = n_ticket - 1 where n_id = ?;insert into ticket (t_n_id,t_sid,t_phone) values (?,"+user+",?)";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, n.getN_id());
			ps.setInt(2, n.getN_id());
			ps.setString(3, n.getT_phone());

			 ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
	}
	public List<News> indexlist(int currentPage1,int currentPage2){
		Connection conn = DB.createConn();
		String sql = "select* from(select top "+size+" * from news,club_info where  c_id = n_clubid and n_statue=1 and n_type=5 and( n_id not in(select top "+(currentPage1-1)*size+" n_id from  news,club_info  where  c_id = n_clubid and n_statue=1  and  n_type=5 ))) as a union all select * from(select top "+size+" * from news,club_info where  c_id = n_clubid and n_statue=1 and n_type= 1 and  (n_id not in(select top "+(currentPage2-1)*size+" n_id from  news,club_info where  c_id = n_clubid and n_statue=1 and n_type= 1 ))) as b;";
		PreparedStatement ps = DB.prepare(conn, sql);
		List<News> news = new ArrayList<News>();
		try {
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				News m = new News();
				m.setN_type(rs.getInt("n_type"));
				m.setN_author(rs.getInt("n_author"));
				m.setN_clubid(rs.getInt("n_clubid"));
				m.setN_content(rs.getString("n_content"));
				m.setN_id(rs.getInt("n_id"));
				m.setN_title(rs.getString("n_title"));
				m.setN_cname(rs.getString("c_name"));
				m.setN_statue(rs.getInt("n_statue"));
				m.setN_inputtime(rs.getTimestamp("n_inputtime"));
				news.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);

		return news;
	}
	public String judge(int id){
		HttpServletRequest request = ServletActionContext.getRequest();
		String phone = null;
		int user=Integer.parseInt(request.getRemoteUser().substring(2,10));
		Connection conn = DB.createConn();
		String sql = "select  t_phone from ticket where  t_n_id = ? and t_sid ="+user+" ";
		PreparedStatement ps = DB.prepare(conn, sql);
		try {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){

				phone=rs.getString("t_phone");

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return phone;
	}
	public News show(int id){
		Connection conn = DB.createConn();
		String sql = "select  * from news,club_info where  c_id = n_clubid and n_id = ?";
		PreparedStatement ps = DB.prepare(conn, sql);
		News m = new News();

		try {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			if(rs.next()){

				m.setN_type(rs.getInt("n_type"));
				m.setN_author(rs.getInt("n_author"));
				m.setN_clubid(rs.getInt("n_clubid"));
				m.setN_content(rs.getString("n_content"));
				m.setN_id(rs.getInt("n_id"));
				m.setN_title(rs.getString("n_title"));
				m.setN_cname(rs.getString("c_name"));
				m.setN_statue(rs.getInt("n_statue"));
				m.setN_ticket(rs.getInt("n_ticket"));
				m.setN_inputtime(rs.getTimestamp("n_inputtime"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);

		return m;
	}

	public News check(int n_id){
		ActionContext actionContext = ActionContext.getContext();
	    Map session = actionContext.getSession();
	    Connection conn = DB.createConn();
	    News n = null;
	    String sql="select n_content from news where n_id = ?";
	    PreparedStatement ps = DB.prepare(conn, sql);

		try {
			ps.setInt(1,n_id );
			ResultSet rs = ps.executeQuery();



			if(rs.next()){
				n = new News();
				n.setN_content(rs.getString("n_content")) ;



			}
			else{System.out.println("无数据");	}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		DB.close(ps);

		DB.close(conn);

		return n;
	}
		public List<News> list(News n,Integer currentPage,Integer numPerPage){
		Connection conn = DB.createConn();
		//String sql = "select * from news,club_info where n_type = ? and c_id = n_clubid order by n_statue asc";
		String sql = "select top "+numPerPage+" *from news,club_info where n_type=? and c_id= n_clubid and(n_id not in(select top "+(currentPage-1)*numPerPage+" n_id from  news,club_info where n_type =? and c_id = n_clubid))";
		
		PreparedStatement ps = DB.prepare(conn, sql);
		List<News> news = new ArrayList<News>();
		try {
			ps.setInt(1,n.getN_type());
			ps.setInt(2,n.getN_type());
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				News m = new News();

				m.setN_author(rs.getInt("n_author"));
				m.setN_clubid(rs.getInt("n_clubid"));
				m.setN_content(rs.getString("n_content"));
				m.setN_id(rs.getInt("n_id"));
				m.setN_title(rs.getString("n_title"));
				m.setN_cname(rs.getString("c_name"));
				m.setN_statue(rs.getInt("n_statue"));
				m.setN_type(rs.getInt("n_type"));
				news.add(m);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);

		return news;
	}

	public Integer getCout(News n) {
		int count=0;

		Connection conn = DB.createConn();
		ActionContext actionContext = ActionContext.getContext();

	    Map session = actionContext.getSession();

	    	String sql ="select count(1) from news,club_info where n_type=? and c_id= n_clubid ";

			PreparedStatement ps = DB.prepare(conn, sql);
			try {
				ps.setInt(1,n.getN_type());
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
	public Integer getTicket_Count(){
		int countPage=0;
		Connection conn = DB.createConn();
		String sql ="select count(*) total from news,club_info where  c_id = n_clubid and n_statue=1 and n_type=5 ";
		//String sql = "select* from(select top 5 * from news,club_info where  c_id = n_clubid and n_statue = 1 and n_type=5 and n_id not in(select top ((?-1)*?) n_id from  news,club_info  where  c_id = n_clubid and n_statue = 1 and n_type=5 order by n_inputtime DESC) as a union all select * from(select top 5 * from news,club_info where  c_id = n_clubid and n_type= 1) as b;";
		PreparedStatement ps = DB.prepare(conn, sql);
		//List<News> news = new ArrayList<News>();
		try {
			

			ResultSet rs = ps.executeQuery();
			

			if(rs.next()){
				int total=rs.getInt("total");
				countPage=total%size==0? total/5 : total/5 + 1;
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return countPage;
		
	}
	//社团招聘
	public Integer getRecruit_Count(){ 
		int countPage=0;
		Connection conn = DB.createConn();
		String sql ="select count(*) total1 from news,club_info where  c_id = n_clubid and n_statue=1 and n_type= 1 ";
		//String sql = "select* from(select top 5 * from news,club_info where  c_id = n_clubid and n_statue = 1 and n_type=5 and n_id not in(select top ((?-1)*?) n_id from  news,club_info  where  c_id = n_clubid and n_statue = 1 and n_type=5 order by n_inputtime DESC) as a union all select * from(select top 5 * from news,club_info where  c_id = n_clubid and n_type= 1) as b;";
		PreparedStatement ps = DB.prepare(conn, sql);
		//List<News> news = new ArrayList<News>();
		try {
			

			ResultSet rs = ps.executeQuery();
			

			if(rs.next()){
				int total=rs.getInt("total1");
				countPage=total%size==0? total/5 : total/5 + 1;
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		DB.close(conn);
		return countPage;

		
	}

}
