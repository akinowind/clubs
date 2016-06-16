<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>


<div layoutH="50">

	<table class="table" width="100%" layoutH="138">
		<thead>
			<tr>
				<th width="30">信息编号</th>
				<th width="130">修改时间(年-月-日)</th>
				<th width="80">社团名称</th>
				<th width="60">社团类型</th>
				<th width="80">隶属单位</th>
				<th width="100">活动场地</th>
				<th width="50">每年活动经费（元）</th>
				<th width="80">经费来源</th>
				<th width="180" >社团简介</th>
				<th width="90">社团组织机构</th>
				<th width="90">日常活动</th>
				<th width="90">精品活动</th>
				<th width="90">获奖情况</th>
				<th width="90" >章程</th>
			</tr>
		</thead>
		<tbody>
		<s:iterator value="clubs" var="c">
			<tr >
				<td><s:property value="#c.c_huid"/></td>
				<td><s:property value="#c.c_changetime"/></td>
				<td><s:property value="#c.c_name"/></td>
				<td><s:property value="#c.c_type"/></td>
				
				
			
			
				<td><input name="sn" type="text" size="10" value=<s:if test="#c.c_up==2">"社团联合会"</s:if><s:elseif test="#c.c_up==3">"校团委"</s:elseif><s:elseif test="#c.c_up==4">"信息科学技术学院团委"</s:elseif><s:else>未选择</s:else> readonly="readonly"/>
				</td>
		
				
				<td>
		
				<s:property value="#c.c_office"/>
				</td>
				<td><s:property value="#c.c_fund"/></td>
				<td><s:property value="#c.c_fundsource"/></td>
				<td><s:property value="#c.c_brief"/></td>
				<td><s:property value="#c.c_organization"/></td>
				
				<td>
	
				<div class="huliang" >
			
				<a  title="详情"  target="dialog" mask="true" rel="showrecord"  href="club/club_check?c.c_huid=<s:property value="#c.c_huid"/>"><button>查看详情</button></a>
				
								
				</div>
				</td>
			
				
			
				
				
				<td>
				
				<div class="huliang" >
				
				<a  title="详情"  target="dialog" mask="true" rel="showrecord"  href="club/club_check1?c.c_huid=<s:property value="#c.c_huid"/>"><button>查看详情</button></a>
					
				</div>
	
				</td>
				
				
				<td>
				
				<div class="huliang" >
				
				<a  title="详情"  target="dialog" mask="true" rel="showrecord"  href="club/club_check2?c.c_huid=<s:property value="#c.c_huid"/>"><button>查看详情</button></a>
						
				</div>
				
				</td>
				
				
				
				<td>
			
				<div class="huliang" >
			
				<a  title="详情"  target="dialog" mask="true" rel="showrecord"  href="club/club_check3?c.c_huid=<s:property value="#c.c_huid"/>"><button>查看详情</button></a>
					
				</div>
				
				</td>
			
				
				
			</tr>
		</s:iterator>
			 
		</tbody>
	</table>
	
	
</div>
