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
  <br/><br/>
   &nbsp;&nbsp;&nbsp;&nbsp;
	教室编号&nbsp;&nbsp;&nbsp;&nbsp;
	教室名称&nbsp;&nbsp;&nbsp;&nbsp;
	申请日期&nbsp;&nbsp;&nbsp;&nbsp;
	<br/><br/>
  <form action="admin/classroom_approve" method="post">
  <s:if test="orders==null">null</s:if>
  <s:else>
   <s:iterator value="orders" var="o">
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<s:property value="#o.p_id"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<s:property value="#o.p_name"/>&nbsp;&nbsp;&nbsp;&nbsp;
	<s:property value="#o.date"/>&nbsp;&nbsp;&nbsp;&nbsp;

<input type="hidden" name="p.id" value="<s:property value="orders[0].p_id"/>">
<input type="hidden" name="p.a.number" value="<s:property value="orders[0].p_a_number"/>">
<a href="admin/classroom_approve?p_id=<s:property value="#o.p_id"/>&p_a_number=<s:property value="#o.p_a_number"/>&hoursel=<s:property value="#o.hoursel"/>" target="navTab" rel="classroom_show_admin"><span style="color:blue">详情查询</span></a>	
	<br/>
	<hr>
  </s:iterator></s:else></form>
    <s:debug></s:debug>
    </div>
  </body>
</html>
