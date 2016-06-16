package com.club.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.club.model.*;
import com.club.service.ClubService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ClubAction extends ActionSupport {
	//判断是社团查看信息还是管理者查看信息
	private int c_c = 0;
	
	
	
	private Club_info c;
	private List<Club_info> clubs;
	//搜索关键词
	private String c_name="";
	//分页以及批量删除
	private Integer totalCount=0; // 总条数
	private Integer pageCount = 0; // 总页数
	private Integer numPerPage=20;// 每页显示多少条
	private Integer pageNum=1;
	
	private String orderField;
	private String orderDirection;
	private String ids;
	//
	private ClubService clubservice = new ClubService();
	
	public String list(){
		HttpServletRequest request = ServletActionContext.getRequest();
		page();
		clubs = clubservice.list(c_name,pageNum,numPerPage,orderField,orderDirection);
		return SUCCESS;
	}
	
	public String update(){
		
		if(c.getC_id()!=0){
		
			c = clubservice.getClub_info(c.getC_id());
			
		}
		
		return SUCCESS;		
	}
	
	public void inf(){
		
		clubservice.inf(c);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "提交成功!");
		object.put("navTabId", "club_infshow");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
	}
	public String infshow(){
	
		if(c_c==0){
			ActionContext actionContext = ActionContext.getContext();   		  
		    Map session = actionContext.getSession();   
		    int clubid = (Integer) session.get("clubid");
			c=clubservice.infshow(clubid);
		}
		else if(c_c==1)
		{
			c=clubservice.infshow(c.getC_id());
			c_c=1;
		}
		
		return SUCCESS;
	}
	public void save(){
		
		clubservice.saveorupdate(c);
		
		
		JSONObject object=new JSONObject();
	
		object.put("statusCode", "200");
		object.put("message", "提交成功!");
		object.put("navTabId", "club_list");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
		
	}
	
	
	
	
	public void page() {
		
		totalCount = clubservice.getCout(c_name);
		
		pageCount = totalCount % numPerPage == 0 ? totalCount / numPerPage: totalCount / numPerPage + 1;
		
	}
	
public void delete(){
		
		clubservice.delete(ids);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "删除成功!");
		object.put("navTabId", "club_list");
		object.put("rel", "");
		object.put("callbackType", "");
		object.put("forwardUrl", "");
		out(object);
	}
	
	
	
	
	public void out(JSONObject object){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
	    try {
			PrintWriter out=response.getWriter();
			out.print(object);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	public Club_info getC() {
		return c;
	}

	public void setC(Club_info c) {
		this.c = c;
	}






	public Integer getTotalCount() {
		return totalCount;
	}






	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}






	public Integer getPageCount() {
		return pageCount;
	}






	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}






	public Integer getNumPerPage() {
		return numPerPage;
	}






	public void setNumPerPage(Integer numPerPage) {
		this.numPerPage = numPerPage;
	}






	public Integer getPageNum() {
		return pageNum;
	}






	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}






	public String getOrderField() {
		return orderField;
	}






	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}






	public String getOrderDirection() {
		return orderDirection;
	}






	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}






	public String getIds() {
		return ids;
	}






	public void setIds(String ids) {
		this.ids = ids;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public List<Club_info> getClubs() {
		return clubs;
	}

	public void setClubs(List<Club_info> clubs) {
		this.clubs = clubs;
	}

	public int getC_c() {
		return c_c;
	}

	public void setC_c(int c_c) {
		this.c_c = c_c;
	}
	
}
