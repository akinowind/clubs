<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<div class="pageContent">
	

	
	<table class="list" width="98%" targetType="navTab"  layoutH="0">
		<thead>
			
			<tr>
				<th width="80">会议室</th>
				<th width="80">所需设备</th>
				<th width="180">使用时间</th>
				<th >会议主题</th>
				<th width="100">主持人</th>
				<th  width="100">申请单位</th>
				<th >申请人</th>
				<th width="100">联系电话</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="mes" var="m">
			<tr>
				<td><s:property value="#m.me_mid"/>
				</td>
				<td><s:property value="#m.me_media"/>
				</td>
				<td><s:date name="#m.me_starttime2" format="MM-dd HH:mm"/>~ <s:date name="#m.me_endtime2" format="MM-dd HH:mm"/></td>
				<td><s:property value="#m.me_theme"/></td>
				<td><s:property value="#m.me_host"/></td>
				<td><s:property value="#m.me_department"/></td>
				<td><s:property value="#m.me_person"/></td>
				<td>
				<s:property value="#m.me_phone"/>
				</td>
			</tr>
		</s:iterator>	
		</tbody>
	</table>
	</div>
	
	<div class="panelBar" >
		<div class="pages">
			<span>显示</span>
			<select name="numPerPage" onchange="navTabPageBreak({numPerPage:this.value})">
				<option value="20">20</option>
				<option value="50">50</option>
				<option value="100">100</option>
				<option value="200">200</option>
			</select>
			<span>条，共23条</span>
		</div>
		
		<div class="pagination" targetType="navTab" totalCount="200" numPerPage="20" pageNumShown="10" currentPage="2"></div>

	</div>

</div>
