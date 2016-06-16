package com.club.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.club.model.*;
import com.club.service.ClassroomService;
import com.opensymphony.xwork2.ActionSupport;

public class ClassroomAction extends ActionSupport {
	private ClassroomService classroomservice = new ClassroomService();
	private Classroom p;
	
	private Integer totalCount=0; // 总条数
	private Integer pageCount = 0; // 总页数
	private Integer numPerPage=20;// 每页显示多少条
	private Integer pageNum=1;
	private String orderField;
	private String orderDirection;
	//////
	private List<Classroom> pinfo;
	
	
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
	public String show(){
		
		pinfo = classroomservice.getPinfo(p.getP_id());
		
		return SUCCESS;
	}
	
	public void order(){
		classroomservice.order(p);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "提交成功!请等待审核");
		object.put("navTabId", "");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
		
	}
	
	
	
	
	
	public void page() {
		
		totalCount = classroomservice.getCout();
		
		pageCount = totalCount % numPerPage == 0 ? totalCount / numPerPage: totalCount / numPerPage + 1;
		
	}
	

	
	public String orderlist(){
		

		page();
		pinfo = classroomservice.orderlist(pageNum,numPerPage,orderField,orderDirection);
		return SUCCESS;
	}
	
	
	public void pass(){
		
		classroomservice.pass(p);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "通过成功!");
		object.put("navTabId", "classroom_orderlist");
		object.put("rel", "");
		object.put("callbackType", "");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
	}
	
	public void npass(){
		classroomservice.npass(p);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "不通过成功!");
		object.put("navTabId", "classroom_orderlist");
		object.put("rel", "");
		object.put("callbackType", "");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
	}
	
	
	
	
	
	

	




	public Classroom getP() {
		return p;
	}




	public void setP(Classroom p) {
		this.p = p;
	}




	public List<Classroom> getPinfo() {
		return pinfo;
	}




	public void setPinfo(List<Classroom> pinfo) {
		this.pinfo = pinfo;
	}
	public ClassroomService getClassroomservice() {
		return classroomservice;
	}
	public void setClassroomservice(ClassroomService classroomservice) {
		this.classroomservice = classroomservice;
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
}
