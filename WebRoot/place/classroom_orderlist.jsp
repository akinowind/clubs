<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<form id="pagerForm" method="post" action="place/classroom_orderlist">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${numPerPage}" />
<%-- 	<input type="hidden" name="orderField" value="${orderField}" />
	<input type="hidden" name="orderDirection" value="${orderDirection}" /> --%>
</form>
<div class="pageContent">


	
	<table class="table" width="100%" layoutH="50">
		<thead>
			
			<tr>
				<th width="60">教室号</th>
				<th width="120">所需多媒体设备</th>
				<th width="100">教室名称</th>
				<th width="100">申请社团</th>
				<th width="100">申请日期</th>
				<th  width="100">申请时间</th>
				<th >申请用途</th>
				<th width="120">操作</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="pinfo" var="p">
			<tr>
				<td><s:property value="#p.p_id"/>
				</td>
				<td><s:property value="#p.p_media"></s:property>
				</td>
				<td><s:property value="#p.p_name"/></td>
				<td><s:property value="#p.p_t_cname"/></td>
				<td>
				<s:if test="#p.p_t_time==11">下周一</s:if><s:elseif test="#p.p_t_time==12">下周一</s:elseif><s:elseif test="#p.p_t_time==13">下周一</s:elseif><s:elseif test="#p.p_t_time==14">下周一</s:elseif><s:elseif test="#p.p_t_time==15">下周一</s:elseif><s:elseif test="#p.p_t_time==16">下周一</s:elseif>
				<s:elseif test="#p.p_t_time==21">下周二</s:elseif><s:elseif test="#p.p_t_time==22">下周二</s:elseif><s:elseif test="#p.p_t_time==23">下周二</s:elseif><s:elseif test="#p.p_t_time==24">下周二</s:elseif><s:elseif test="#p.p_t_time==25">下周二</s:elseif><s:elseif test="#p.p_t_time==26">下周二</s:elseif>
				<s:elseif test="#p.p_t_time==31">下周三</s:elseif><s:elseif test="#p.p_t_time==32">下周三</s:elseif><s:elseif test="#p.p_t_time==33">下周三</s:elseif><s:elseif test="#p.p_t_time==34">下周三</s:elseif><s:elseif test="#p.p_t_time==35">下周三</s:elseif><s:elseif test="#p.p_t_time==36">下周三</s:elseif>
				<s:elseif test="#p.p_t_time==41">下周四</s:elseif><s:elseif test="#p.p_t_time==42">下周四</s:elseif><s:elseif test="#p.p_t_time==43">下周四</s:elseif><s:elseif test="#p.p_t_time==44">下周四</s:elseif><s:elseif test="#p.p_t_time==45">下周四</s:elseif><s:elseif test="#p.p_t_time==46">下周四</s:elseif>
				<s:elseif test="#p.p_t_time==51">下周五</s:elseif><s:elseif test="#p.p_t_time==52">下周五</s:elseif><s:elseif test="#p.p_t_time==53">下周五</s:elseif><s:elseif test="#p.p_t_time==54">下周五</s:elseif><s:elseif test="#p.p_t_time==55">下周五</s:elseif><s:elseif test="#p.p_t_time==56">下周五</s:elseif>
				<s:elseif test="#p.p_t_time==61">下周六</s:elseif><s:elseif test="#p.p_t_time==62">下周六</s:elseif><s:elseif test="#p.p_t_time==63">下周六</s:elseif><s:elseif test="#p.p_t_time==64">下周六</s:elseif><s:elseif test="#p.p_t_time==65">下周六</s:elseif><s:elseif test="#p.p_t_time==66">下周六</s:elseif>
				<s:elseif test="#p.p_t_time==71">下周日</s:elseif><s:elseif test="#p.p_t_time==72">下周日</s:elseif><s:elseif test="#p.p_t_time==73">下周日</s:elseif><s:elseif test="#p.p_t_time==74">下周日</s:elseif><s:elseif test="#p.p_t_time==75">下周日</s:elseif><s:elseif test="#p.p_t_time==76">下周日</s:elseif>
				</td>
				<td>
				<s:if test="#p.p_t_time==11">8:00~10:00</s:if><s:elseif test="#p.p_t_time==12">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==13">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==14">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==15">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==16">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==21">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==22">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==23">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==24">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==25">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==26">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==31">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==32">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==33">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==34">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==35">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==36">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==41">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==42">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==43">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==44">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==45">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==46">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==51">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==52">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==53">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==54">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==55">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==56">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==61">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==62">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==63">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==64">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==65">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==66">18:00~20:00</s:elseif>
				<s:elseif test="#p.p_t_time==71">8:00~10:00</s:elseif><s:elseif test="#p.p_t_time==72">10:00~12:00</s:elseif><s:elseif test="#p.p_t_time==73">12：00~14:00</s:elseif><s:elseif test="#p.p_t_time==74">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==75">14:00~16:00</s:elseif><s:elseif test="#p.p_t_time==76">18:00~20:00</s:elseif>
				</td>
				<td><s:property value="#p.p_t_reason"/></td>
				<td>
				<a  href="place/classroom_pass?p.id=<s:property value="#p.id"/>" target="ajaxTodo" title="确定通过吗？" class="button"><span>通过</span></a>
				<a  href="place/classroom_npass?p.id=<s:property value="#p.id"/>" target="ajaxTodo" title="确定不通过吗？" class="button"><span>不通过</span></a>
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
