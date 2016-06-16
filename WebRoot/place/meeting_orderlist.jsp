<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<form id="pagerForm" method="post" action="meeting/meeting_orderlist">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
<%-- 	<input type="hidden" name="orderField" value="${orderField}" />
	<input type="hidden" name="orderDirection" value="${orderDirection}" /> --%>
</form>
<div class="pageContent">

	
	<table class="table" width="100%" layoutH="138">
		<thead>
			
			<tr>
				<th width="80">会议室</th>
				<th width="180">使用时间</th>
				<th width="100">所需多媒体设备</th>				
				<th >会议主题</th>
				<th width="100">主持人</th>
				<th  width="100">申请单位</th>
				<th >申请人</th>
				<th width="100">联系电话</th>
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="mes" var="m">
			<tr>
				<td><s:property value="#m.me_mid"/>
				</td>
				<td><s:date name="#m.me_starttime2" format="MM-dd HH:mm"/>~ <s:date name="#m.me_endtime2" format="MM-dd HH:mm"/></td>
				<td><s:property value="#m.me_media" ></s:property></td>
				<td><s:property value="#m.me_theme"/></td>
				<td><s:property value="#m.me_host"/></td>
				<td><s:property value="#m.me_department"/></td>
				<td><s:property value="#m.me_person"/></td>
				<td>
				<s:property value="#m.me_phone"/>
				</td>
				<td>
				<a  href="meeting/meeting_pass?me.me_id=<s:property value="#m.me_id"/>" target="ajaxTodo" title="确定通过吗？"><span>通过</span></a>&nbsp;
				<a  href="meeting/meeting_unpass?me.me_id=<s:property value="#m.me_id"/>" target="ajaxTodo" title="确定不通过吗？"><span>不通过</span></a>
				</td>
			</tr>
		</s:iterator>	
		</tbody>
	</table>
	
			<div class="panelBar">
		<div class="pages">
			<span>显示</span>
			<select class="combox" name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option <s:if test="numPerPage==1">selected="selected"</s:if> value="1" >1</option>
				<option <s:if test="numPerPage==2">selected="selected"</s:if> value="2" >2</option>
				
				<option <s:if test="numPerPage==20">selected="selected"</s:if> value="20" >20</option>
				<option <s:if test="numPerPage==50">selected="selected"</s:if> value="50">50</option>
				<option <s:if test="numPerPage==100">selected="selected"</s:if> value="100">100</option>
				<option <s:if test="numPerPage==200">selected="selected"</s:if> value="200">200</option>
			</select>
			<span>条，共${totalCount}条</span>
		</div>
		<div class="pagination" targetType="${targetType}" totalCount="${totalCount}" numPerPage="${numPerPage}" pageNumShown="10" currentPage="${pageNum}"></div>

	</div>
	</div>
	


