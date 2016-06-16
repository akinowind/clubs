<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<form id="pagerForm" method="post" action="news/news_list?n.n_type=<s:property value="news[0].n_type"/>">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
</form>
<div class="pageContent">
	

	
	<table class="list" width="98%"  layoutH="25">
		<thead>
			
			<tr>
				<th width="30">编号</th>
				<th width="200">标题</th>
				<th >内容</th>
				<th width="60">详细内容</th>
				<th width="100">作者</th>
				<th  width="100">发布社团</th>
				<th  width="60">状态</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="news" var="n">
			<tr >
			
				<td><s:property value="#n.n_id"/>
				</td>
				<td><s:property value="#n.n_title"/></td>
				<td >
					
						
				<s:if test="%{#n.n_content.length()>60}">
		        <s:property value="#n.n_content.substring(0,10)+'...'" escape="false"/>	
		        </s:if>	
		         <s:else>
		        <s:property value="#n.n_content" escape="false"/>
		        </s:else>
		        </td>
		        <td>		
		      	
		        <a  title="查看详情"  target="dialog" mask="true" rel="showrecord" target="dialog" href="news/news_check?n.n_id=<s:property value="#n.n_id"/>"><button>查看</button></a>
		     		
				</td>
				<td>22<s:property value="#n.n_author"/></td>
				<td><s:property value="#n.n_cname"/></td>
				
				
				<td>
				<s:if test="#n.n_statue==0">未审核</s:if>
				<s:elseif test="#n.n_statue==1">已通过</s:elseif>
				<s:elseif test="#n.n_statue==2">未通过</s:elseif>
				
				
				
				<td>
				<a  href="news/news_pass?n.n_id=<s:property value="#n.n_id"/>" target="ajaxTodo" title="确定通过吗？"><button>通过</button></a>&nbsp;
				<a  href="news/news_unpass?n.n_id=<s:property value="#n.n_id"/>" target="ajaxTodo" title="确定不通过吗？"><button>不通过</button></a>
				
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
				<option <s:if test="numPerPage==10">selected="selected"</s:if> value="10" >10</option>
				
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
	
	
	
	

