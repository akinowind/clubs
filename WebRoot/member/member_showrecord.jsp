<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div  layoutH="0">
	<h3>奖励记录</h3><br/>
    <hr />
	<ul>
    	<s:iterator value="members" var="m"><li><s:property value="#m.c_m_good" escape="false"/></li></s:iterator>
        
    </ul>
	<br />
    <br />
    <br />
   
	<h3>惩罚记录</h3><br/> <hr />
    <ul>
    	<s:iterator value="members" var="m"><li><s:property value="#m.c_m_bad" escape="false"/></li></s:iterator>
        
    </ul>
   
    <br />
    <br />
    <br />
    
</div>
