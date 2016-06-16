<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<form id="pagerForm" method="post" action="member/member_list">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
	<input type="hidden" name="orderField" value="${orderField}" />
	<input type="hidden" name="orderDirection" value="${orderDirection}" />
</form>


<div class="pageHeader">
	<form rel="pagerForm" onsubmit="return navTabSearch(this);" action="member/member_list" method="post">
	<div class="searchBar">
		
	
		<table class="searchContent">
			<tr>
				<td>
					<label>姓名：：</label>
				<input type="text" name="member_name" value="${member_name}" >
				
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
			<li><a title="确实要删除这些记录吗?" target="selectedTodo" rel="ids" postType="string" href="member/member_delete" class="delete"><span>批量删除</span></a></li>
			<li><a class="delete" href="member/member_delete?ids={student_id}" target="ajaxTodo" title="确定要删除吗？" warn="请选择一个用户"><span>删除</span></a></li>
			<li><a class="edit" href="member/member_update?m.student_id={student_id}" target="dialog" mask="true" warn="请选择一个用户"><span>修改</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="demo/common/dwz-team.xls" target="dwzExport" targetType="navTab" title="实要导出这些记录吗?"><span>导出EXCEL</span></a></li>
		</ul>
	</div>
	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th  width="20"><input type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th width="80" orderField="student_id" <s:if test="orderField=='student_id'">class="${orderDirection}"</s:if>>学号</th>
				<th width="80">姓名</th>
				<th width="100">社团</th>
				<th width="100">职位</th>
				<th width="100">手机号码</th>
				<th width="180">邮箱</th>
				<th width="100">QQ号</th>
				<th width="150" align="center">学院</th>
				<th width="150" align="center">专业班级</th>
				<th width="100">奖惩记录</th>
				<th width="80">操作</th>
				<th width="80">状态</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="members" var="m">
			<tr target="student_id" rel="<s:property value="#m.student_id"/>">
				<td><input name="ids" value="<s:property value="#m.student_id"/>" type="checkbox"></td>
				<td>22<s:property value="#m.student_id"/></td>
				<td><s:property value="#m.member_name"/></td>
				<td><s:property value="#m.c_name"/></td>
				<td><s:if test="#m.c_m_job==1">主席</s:if><s:elseif test="#m.c_m_job==0">主席</s:elseif><s:elseif test="#m.c_m_job==2">副主席</s:elseif><s:elseif test="#m.c_m_job==3">部长</s:elseif><s:elseif test="#m.c_m_job==4">副部长</s:elseif><s:elseif test="#m.c_m_job==5">会员</s:elseif><s:else>未知职位</s:else></td>
				<td><s:property value="#m.member_phone"/></td>
				<td><s:property value="#m.member_email"/></td>
				<td><s:property value="#m.member_qq"/></td>
				<td><s:property value="#m.member_college"/></td>
				<td><s:property value="#m.member_class"/></td>
				<td>
					<a  title="添加奖励"  target="dialog"  mask="true" rel="addgood" target="dialog" href="member/member_addgood.jsp?id=<s:property value="#m.c_m_id"/>">
    					<img src="images/icon/ico_blog.gif" alt="添加奖励"></img>
					</a>
					<a  title="添加惩罚"  target="dialog" mask="true" rel="addbad" target="dialog" href="member/member_addbad.jsp?id=<s:property value="#m.c_m_id"/>">
    					<img src="images/icon/ico_blog2.gif" alt="添加惩罚"></img>
					</a>
					<a  title="查看记录"  target="dialog" mask="true" rel="showrecord" target="dialog" href="member/member_showrecord?id=<s:property value="#m.c_m_id"/>">
    					<img src="images/icon/uOrder.png" alt="查看记录"></img>
					</a>
				</td>
				<td>	
					
					 <a title="删除" target="ajaxTodo" href="member/member_delete?ids=<s:property value="#m.student_id"/>" class="btnDel">删除</a>
					 <a title="编辑"  target="dialog" mask="true" href="member/member_update?m.student_id=<s:property value="#m.student_id"/>" class="btnEdit">编辑</a>
				</td>
				<td><s:if test="#m.member_statue==0">未注册</s:if><s:elseif test="#m.member_statue==1">已注册</s:elseif></td>
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
