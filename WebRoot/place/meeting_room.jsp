<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>


<div class="pageContent" >

	<table class="table" layoutH="30"  width="100%">
		<thead>
			<tr>
				
				<th >选择</th>
				<th >会议室</th>
				<th >描述</th>
				
			</tr>
		</thead>
		<tbody>
			
			<tr>
				<td>
				<s:if test="me.a[0]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'1', orgName:'104多功能厅'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>104</td>
				<td>多功能厅</td>
				
				
			</tr><tr>
				<td>
				<s:if test="me.a[1]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'2', orgName:'201多功能厅'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>201</td>
				<td>多功能厅</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[2]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'3', orgName:'207琴房1'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>207</td>
				<td>琴房1</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[3]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'4', orgName:'208琴房2'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>208</td>
				<td>琴房2</td>
				
				
			</tr><tr>
				<td>
				<s:if test="me.a[4]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'5', orgName:'209琴房3'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>209</td>
				<td>琴房3</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[5]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'6', orgName:'210团学活动室1'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>210</td>
				<td>团学活动室1</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[6]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'7', orgName:'211器乐排练室1'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>211</td>
				<td>器乐排练室1</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[7]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'8', orgName:'212器乐排练室'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>212</td>
				<td>器乐排练室2</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[8]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'9', orgName:'308团学活动室2'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>308</td>
				<td>团学活动室2</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[9]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'10', orgName:'310舞蹈排练室'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>310</td>
				<td>舞蹈排练室</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[10]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'11', orgName:'501会议中心'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>501</td>
				<td>会议中心</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[11]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'12', orgName:'610会议室'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>610</td>
				<td>会议室</td>
				
				
			</tr>
			<tr>
				<td>
				<s:if test="me.a[12]==0">
					<a class="btnSelect" href="javascript:$.bringBack({me_mid:'13', orgName:'611团学活动室3'})" title="确定选择">选择</a>
				</s:if>
				<s:else>时间冲突</s:else>
				</td>
				<td>611</td>
				<td>团学活动室3</td>
				
				
			</tr>
		</tbody>
		
	</table>

	
</div>
