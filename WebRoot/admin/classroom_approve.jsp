<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'classroom_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <div layoutH="0">
  <h2 style="color:red">已成功申请信息：</h2>
 <s:iterator value="success" var="s">
	<br/> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请人学号：22201<s:property value="#s.p_a_number"/><br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请人姓名：<s:property value="#s.p_a_name"/><br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请日期：<s:date name="#s.date" format="yyyy-MM-dd"/><br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请时间：<s:if test="#s.hoursel==1">8:00——10:00</s:if>  
    <s:elseif test="#s.hoursel==2">10:00——12:00</s:elseif>
    <s:elseif test="#s.hoursel==3">13:00——15:00</s:elseif>
    <s:elseif test="#s.hoursel==4">15:00——17:00</s:elseif><br/><br/><br/>
 
	
  </s:iterator>
  <hr>  
<h2 style="color:red"> 未审批信息详情：</h2><br/> <br/>
  <s:if test="applications==null">null</s:if>
  <s:else>
 
  <s:iterator value=" applications" var="a">
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;教室名称：<s:property value="#a.p_name"/> <br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请人学号：22201<s:property value="#a.p_a_number"/> <br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请人姓名：<s:property value="#a.p_a_name"/> <br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;教室编号：<s:property value="#a.p_id"/><br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请日期：<s:property value="#a.date"/><br/>
 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请时间段：<s:if test="#a.hoursel==1">8:00——10:00</s:if>  
    <s:elseif test="#a.hoursel==2">10:00——12:00</s:elseif>
    <s:elseif test="#a.hoursel==3">13:00——15:00</s:elseif>
    <s:elseif test="#a.hoursel==4">15:00——17:00</s:elseif>
	<br/>
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;申请理由：<s:property value="#a.p_a_reason"/><br/>
<form action="admin/agree" method="post">
	<input type="hidden" name="p_id" value="<s:property value="#a.p_id"/>">
	<input type="hidden" name="p_t_hoursel" value="<s:property value="#a.p_t_hoursel"/>">
	<input type="hidden" name="p_t_date" value="<s:property value="#a.p_t_date"/>">
	<input type="hidden" name="p_a_number" value="<s:property value="#a.p_a_number"/>">
	 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="agree" value="审批通过" />
<br/>
	</form>
	<form action="admin/disagree" method="post"> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;不通过原因：<input type="text" name="p_disagreereason"/>
	<input type="hidden" name="id" value="<s:property value="#a.id"/>">
	<input type="hidden" name="p_a_number" value="<s:property value="p_a_number"/>">
<input type="submit" name="disagree" value="审批不通过" /><br/><br/><br/>
	</form>
  </s:iterator></s:else>
    <s:debug></s:debug>
    </div>
  </body>
</html>
