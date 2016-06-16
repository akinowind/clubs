	<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>


<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<div  layoutH="0">
	<h3>查看详情</h3><br/>
    <hr />
	<ul>
    	<li><s:property value="c.c_rule"/></li>
        
    </ul>
	<br />
    <br />
    <br />
   
	
    
</div>
