<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %> 
<div class="accountInfo">
	<div class="alertInfo">
		
		<h2>最新消息：</h2>
		<a href="">大连海事大学社团管理系统</a>
		
		
	</div>
	<div class="right">
		<!--  <p>待办工作32项，消息212条</p>-->
		<p><%=new java.text.SimpleDateFormat("yyyy年 MM 月 dd 日").format(new java.util.Date())%></p>
	</div>
	<p><span>大连海事大学社团管理系统</span></p>
	<p><a href="safewind_inf.html" target="dialog">海风团队</a></p>
</div>

<div class="pageCentent">
<div layoutH="80" style="width:98%">
	个人信息：<br/><br/>
	姓名：<s:property value="#session.sname"/><br/><br/>
	学号：<%=request.getRemoteUser() %><br/><br/>
	社团：<s:property value="#session.clubname"/><br/><br/>
	职位：<s:if test="#session.userlevel==0||1">主席</s:if><s:elseif test="#session.userlevel==2">副主席</s:elseif><s:elseif test="#session.userlevel==3">部长</s:elseif><s:elseif test="#session.userlevel==4">副部长</s:elseif><s:elseif test="#session.userlevel==5">会员</s:elseif><s:else>未知职位</s:else><br/>

</div>
</div>