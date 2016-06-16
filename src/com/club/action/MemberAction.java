package com.club.action;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.RequestMap;

import com.club.model.Member_info;
import com.club.service.MemberService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class MemberAction extends ActionSupport {
	

	private List<Member_info> members;
	private Member_info m;
	private String member_name="";

	private Integer totalCount=0; // 总条数
	private Integer pageCount = 0; // 总页数
	private Integer numPerPage=20;// 每页显示多少条
	private Integer pageNum=1;
	
	private String orderField;
	private String orderDirection;
	private String ids;
	
	
	private MemberService memberservice = new MemberService();
	//初始化
	public String init(){
		HttpServletRequest request = ServletActionContext.getRequest();
		int user= 0;
		/*if(!(request.getRemoteUser().equals("2220133229"))&&request.getRemoteUser().length()==10)
		{
		 user=Integer.parseInt(request.getRemoteUser().substring(2,10));
		}*/
		if(request.getRemoteUser().length()==8||request.getRemoteUser().equals("2220133229"))
		{
			if(request.getRemoteUser().equals("2220133229"))
			{
				user =Integer.parseInt(request.getRemoteUser().substring(2, 10));
				System.out.println("----go----"+request.getRemoteUser().substring(2, 10));
			}
			else{
				user=Integer.parseInt(request.getRemoteUser());
			}
		}
		String sname=memberservice.getSname(user);
		if(sname!= null)
		{
			int userlevel = memberservice.getLevel(user);
			int userlevel_1=memberservice.getLevel_1(user);
			int clubid = memberservice.getClub(user);
			String clubname= memberservice.getClubname(clubid);
			
			ActionContext actionContext = ActionContext.getContext();   
			  
		       Map session = actionContext.getSession();   
		  
		       session.put("userlevel", userlevel); 
		       session.put("userlevel_1",userlevel_1);
		       session.put("clubid", clubid);
		       session.put("clubname", clubname);
		       session.put("sname",sname);
		      
		
			return SUCCESS;
		}
		else{
			return "kong";
		}
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
	
	public String info(){
		memberservice.info(m);
		
		return SUCCESS;
	}
	
	public String list(){
		//HttpServletRequest request = ServletActionContext.getRequest();
		page();
		members = memberservice.list(member_name,pageNum,numPerPage,orderField,orderDirection);
		
		return SUCCESS;		
	}
	public String list2(){
		HttpServletRequest request = ServletActionContext.getRequest();
		page();
		
		
		members = memberservice.list2(member_name,pageNum,numPerPage,orderField,orderDirection);
		
		return SUCCESS;		
	}
	public void page() {
		
		totalCount = memberservice.getCout(member_name);
		
		pageCount = totalCount % numPerPage == 0 ? totalCount / numPerPage: totalCount / numPerPage + 1;
		
	}
	//更新-添加会员信息//
	public String update(){
		
		if(m.getStudent_id()!=201){
		
			m = memberservice.getMember_info(m.getStudent_id());
			
		}
		
		return SUCCESS;		
	}
	
	public void save(){
		
		memberservice.saveorupdate(m);
		
		JSONObject object=new JSONObject();
	
		object.put("statusCode", "200");
		object.put("message", "提交成功!");
		object.put("navTabId", "member_list");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");  //closeCurrent
		object.put("forwardUrl", "");
		out(object);
		
	}
	
	public void delete(){
		
		memberservice.delete(ids);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "删除成功!");
		object.put("navTabId", "member_list");
		object.put("rel", "");
		object.put("callbackType", "");
		object.put("forwardUrl", "");
		out(object);
	}
	
	public void addgood(){
		memberservice.addgood(m.getC_m_id(), m.getC_m_good());
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "添加成功!");
		object.put("navTabId", "member_list");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");
		object.put("forwardUrl", "");
		out(object);
	}
	public void addbad(){
		memberservice.addbad(m.getC_m_id(), m.getC_m_bad());
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "添加成功!");
		object.put("navTabId", "member_list");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");
		object.put("forwardUrl", "");
		out(object);
	}
	public String showrecord(){
		members =memberservice.showrecord(m.getC_m_id());
		return SUCCESS;
		
	}
	///////////////////////////////////////////
	public List<Member_info> getMembers() {
		return members;
	}
	public void setMembers(List<Member_info> members) {
		this.members = members;
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
	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}



	public Member_info getM() {
		return m;
	}

	public void setM(Member_info m) {
		this.m = m;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}

	
	
	
}
