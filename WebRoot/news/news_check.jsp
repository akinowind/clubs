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
    	<li><s:iterator value="n" var="n"><s:property value="#n.n_content" escape="false"/></s:iterator></li>
        
    </ul>
	<br />
    <br />
    <br />
   
	
    
</div>
