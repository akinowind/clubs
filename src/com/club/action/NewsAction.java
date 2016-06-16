package com.club.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.club.model.News;
import com.club.service.NewsService;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport {
	private NewsService newsservice = new NewsService();
	private News n;
	private List<News> news;
	 int a;
	 private Integer countPage1=0;
	 private Integer countPage2=0;
	private Integer currentPage1=1;
	private Integer currentPage2=1;

	public Integer getCountPage1() {
		return countPage1;
	}
	public void setCountPage1(Integer countPage1) {
		this.countPage1 = countPage1;
	}
	public Integer getCountPage2() {
		return countPage2;
	}
	public void setCountPage2(Integer countPage2) {
		this.countPage2 = countPage2;
	}
	public Integer getCurrentPage1() {
		return currentPage1;
	}
	public void setCurrentPage1(Integer currentPage1) {
		this.currentPage1 = currentPage1;
	}
	public Integer getCurrentPage2() {
		return currentPage2;
	}
	public void setCurrentPage2(Integer currentPage2) {
		this.currentPage2 = currentPage2;
	}
	private Integer totalCount=0; // 总条数
	private Integer pageCount = 0; // 总页数
	public Integer getPageCount() {
		return pageCount;
	}
	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}
	private Integer numPerPage=20;// 每页显示多少条
	
	
	public Integer getNumPerPage() {
		return numPerPage;
	}
	public void setNumPerPage(Integer numPerPage) {
		this.numPerPage = numPerPage;
	}
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	private Integer pageNum=1;
	public Integer getPageNum() {
		return pageNum;
	}
	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}
	public void add(){
		newsservice.add(n);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "添加成功!");
		object.put("navTabId", "");
		object.put("rel", "");
		object.put("callbackType", "closeCurrent");
		object.put("forwardUrl", "");
		out(object);

	}
	public String list(){
		//HttpServletRequest request = ServletActionContext.getRequest();
		
		page();
		
		news = newsservice.list(n,pageNum,numPerPage);
		
		

		return SUCCESS;
	}
	public void page() {
		

		totalCount =newsservice.getCout(n);


		pageCount = totalCount % numPerPage == 0 ? totalCount / numPerPage: totalCount / numPerPage + 1;

	}

	public String check(){
		n =newsservice.check(n.getN_id());
		return SUCCESS;

	}
	public String indexlist(){
		countPage1=newsservice.getTicket_Count();
		countPage2=newsservice.getRecruit_Count();
		
		news = newsservice.indexlist(currentPage1,currentPage2);
		


		return SUCCESS;
	}
	
	public String show(){

		n = newsservice.show(n.getN_id());
		n.setT_phone(newsservice.judge(n.getN_id()));

		return SUCCESS;
	}
	public void pass(){
		newsservice.pass(n);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "通过成功!");
		object.put("navTabId", "news_list");
		object.put("rel", "news_list");
		object.put("callbackType", " ");
		object.put("forwardUrl", "");
		out(object);


	}
	public void unpass(){
		newsservice.unpass(n);
		JSONObject object=new JSONObject();
		object.put("statusCode", "200");
		object.put("message", "不通过成功!");
		object.put("navTabId", "news_list");
		object.put("rel", "news_list");
		object.put("callbackType", "");
		object.put("forwardUrl", "");
		out(object);

	}
	//订票
	public String ticketorder(){


		newsservice.ticketorder(n);

		return SUCCESS;
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
/////////
	public News getN() {
		return n;
	}

	public void setN(News n) {
		this.n = n;
	}
	public List<News> getNews() {
		return news;
	}
	public void setNews(List<News> news) {
		this.news = news;
	}

}
