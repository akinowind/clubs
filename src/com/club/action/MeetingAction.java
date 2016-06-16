package com.club.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.club.model.Meeting;
import com.club.service.MeetingService;
import com.opensymphony.xwork2.ActionSupport;

public class MeetingAction extends ActionSupport {
	
	private Integer totalCount=0; // 总条数
	private Integer pageCount = 0; // 总页数
	private Integer numPerPage=20;// 每页显示多少条
	private Integer pageNum=1;
	private String orderField;
	private String orderDirection;
	
	
	private Meeting me;
	private List<Meeting> mes;
	private MeetingService meetingservice = new MeetingService();
	private String phone;
	
	
	
	public void pass(){
		
		meetingservice.pass(me.getMe_id());
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "通过成功!");
		object.put("navTabId", "meeting_orderlist");
		object.put("rel", "");
		object.put("callbackType", " ");
		object.put("forwardUrl", "");
		out(object);
	}
	public void unpass(){
		meetingservice.unpass(me.getMe_id());
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "不通过成功!");
		object.put("navTabId", "meeting_orderlist");
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
	
	public void save(){
	
		meetingservice.save(me);
		
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "提交成功!等待审批");
		object.put("navTabId", "");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
		
	}
	
	public String room(){
		
	  	me.setA(meetingservice.room(me.getMe_starttime(),me.getMe_endtime()));
	  	
	
		return SUCCESS;
	}
	public String list(){
		page();
	  	mes=meetingservice.list(pageNum,numPerPage,orderField,orderDirection);
	  	
	
		return SUCCESS;
	}
	public String orderlist(){
		page();
		
	  	mes=meetingservice.orderlist(pageNum,numPerPage,orderField,orderDirection);
	  	
	
		return SUCCESS;
	}

	public void page() {
		
		totalCount = meetingservice.getCout();
		System.out.println(totalCount);
		
		pageCount = totalCount % numPerPage == 0 ? totalCount / numPerPage: totalCount / numPerPage + 1;
		
	}
	
	public Meeting getMe() {
		return me;
	}

	public void setMe(Meeting me) {
		this.me = me;
	}

	public List<Meeting> getMes() {
		return mes;
	}

	public void setMes(List<Meeting> mes) {
		this.mes = mes;
	}
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
}
