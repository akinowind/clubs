package com.club.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.club.model.Project;
import com.club.service.ProjectService;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectAction extends ActionSupport{
	private ProjectService projectservice = new ProjectService();
	private Project pro;
	private List<Project> pros;
	
	
	public void pass(){
		projectservice.pass(pro);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "通过成功!");
		object.put("navTabId", "project_list");
		object.put("rel", "");
		object.put("callbackType", " ");
		object.put("forwardUrl", "");
		out(object);
	}
	public void unpass(){
		projectservice.unpass(pro);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "不通过成功!");
		object.put("navTabId", "project_list");
		object.put("rel", "");
		object.put("callbackType", "");
		object.put("forwardUrl", "");
		out(object);
		
	}
	

	
	public void apply(){
		projectservice.apply(pro);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "提交成功!等待审批");
		object.put("navTabId", "");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
		
	}
	
	public void fundtotal(){
		
		projectservice.fundtotal(pro);
		JSONObject object=new JSONObject();
		
		object.put("statusCode", "200");
		object.put("message", "更改成功");
		object.put("navTabId", "project_list");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
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
	
	public String list(){
		pros = projectservice.list();
		return SUCCESS;
	}
	
	
//////////////////////////////	
	public Project getPro() {
		return pro;
	}

	public void setPro(Project pro) {
		this.pro = pro;
	}

	public List<Project> getPros() {
		return pros;
	}

	public void setPros(List<Project> pros) {
		this.pros = pros;
	}

}
