<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<div class="pageContent">
	

	
	<table class="list" width="98%" targetType="navTab"  layoutH="0">
		<thead>
			
			<tr>
				<th width="80">项目名称</th>
				<th width="100">申请社团</th>
				<th width="100">策划</th>
				<th width="100">经费说明</th>
				<th width="100">总经费</th>
				<th  width="100">状态</th>
				
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="pros" var="p">
			<tr>
				<td><s:property value="#p.pro_name"/>
				</td>
				<td><s:property value="#p.pro_cname"/></td>
				<td><s:property value="#p.pro_content" escape="false"/></td>
				<td><s:property value="#p.pro_fund" escape="false"/></td>
				<td><s:property value="#p.pro_fundtotal"/> &nbsp;&nbsp;&nbsp;&nbsp;<a target="dialog" href="project/project_fundtotal.jsp?id=<s:property value="#p.pro_id"/>" ><button>核减</button></a></td>
				
				
				<td>
				<s:if test="#p.pro_statue==1">未审核</s:if>
				<s:elseif test="#p.pro_statue==2">已通过</s:elseif>
				<s:elseif test="#p.pro_statue==3">未通过</s:elseif>
				</td>
				
				<td>
				<a  href="project/project_pass?pro.pro_id=<s:property value="#p.pro_id"/>" target="ajaxTodo" title="确定通过吗？"><span>通过</span></a>&nbsp;
				<a  href="project/project_unpass?pro.pro_id=<s:property value="#p.pro_id"/>" target="ajaxTodo" title="确定不通过吗？"><span>不通过</span></a>
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
