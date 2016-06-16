<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<form id="pagerForm" method="post" action="club/club_list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="orderField" value="${orderField}" />
	<input type="hidden" name="orderDirection" value="${orderDirection}" />
</form>


<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="club/club_list" method="post">
	<div class="searchBar">
		
	
		<table class="searchContent">
			<tr>
				<td>
					<label>社团名称：</label>
				<input type="text" name="c_name" value="${c_name}" >
				</td>
				
			</tr>
		</table>
		<div class="subBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></li>
			<!-- <li><a class="button" href="demo_page6.html" target="dialog" mask="true" title="查询框"><span>高级检索</span></a></li>   -->	
			</ul>
		</div>
	</div>
	</form>
</div>
<div class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="club/club_update?c.c_id=0" target="dialog" mask="true"><span>添加</span></a></li>
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" postType="string" href="club/club_delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="delete" href="club/club_delete?ids={c_id}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户"><span>删除</span></a></li>
			<li><a class="edit" href="club/club_update?c.c_id={c_id}" target="dialog" mask="true" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="80" orderField="c_id" <s:if test="orderField=='c_id'">class="${orderDirection}"</s:if>>编号</th>
				<th width="120">社团名称</th>
				<th>隶属单位</th>
				<th width="100">类型</th>
				<th width="150">成立时间：</th>
				<th width="80" align="center">信用等级</th>
				<th width="80">详细信息</th>
				<th width="80">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="clubs" var="c">
			<tr target="c_id" rel="<s:property value="#c.c_id"/>" >
				<td><input name="ids" value="<s:property value="#c.c_id"/>" type="checkbox"></td>
				<td><s:property value="#c.c_id"/></td>
				<td><s:property value="#c.c_name"/></td>
				<td><s:if test="#c.c_up==2">社团联合会</s:if><s:elseif test="#c.c_up==3">校团委</s:elseif><s:elseif test="#c.c_up==4">信息科学技术学院团委</s:elseif></td>
				<td><s:property value="#c.c_type"/></td>
				<td><s:date name="#c.c_starttime" format="yyyy-MM-dd"/></td>
				<td>5级</td>
				<td><a href="club/club_infshow?c.c_id=<s:property value="#c.c_id"/>&c_c=1" target="dialog" rel="club_infshow" width="650">查看</a></td>
				<td>
					 <a title="删除" target="ajaxTodo" href="club/club_delete?ids=<s:property value="#c.c_id"/>" class="btnDel">删除</a>
					 <a title="编辑"  target="dialog" mask="true" href="club/club_update?c.c_id=<s:property value="#c.c_id"/>" class="btnEdit">编辑</a>
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
