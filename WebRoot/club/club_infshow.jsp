<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageContent">
	
		<div class="pageFormContent" layoutH="56">
		<fieldset>
		<input type="hidden" name="c.c_id" value="1">
		
	<s:if test="c_c==0">
			<p>
				<label>社团名称：</label>
				<input name="sn" type="text" size="30" value="<s:property value="#session.clubname"/>" readonly="readonly"/>
			</p>
	</s:if>		
			<p>
				<label>社团类型：</label>
				<input name="sn" type="text" size="30" value="<s:property value="c.c_type"/>" readonly="readonly"/>
				
			</p>
			<p>
				<label>隶属单位：：</label>
				<input name="sn" type="text" size="30" value=<s:if test="c.c_up==2">"社团联合会"</s:if><s:elseif test="c.c_up==3">"校团委"</s:elseif><s:elseif test="c.c_up==4">"信息科学技术学院团委"</s:elseif><s:else>未选择</s:else> readonly="readonly"/>
				
			</p>
			<p>
				<label>活动场地：</label>
				<input name="c.c_office"  value="<s:property value="c.c_office"/>" type="text" class="required textInput"  readonly="readonly"  >
			</p>
			<p>
				<label>每年活动经费（元）：</label>
				<input name="c.c_fund"  value="<s:property value="c.c_fund"/>" type="text" class="required"   class="textInput" readonly="readonly">
			</p>
			<p>
				<label>经费来源：：</label>
				<input name="sn" type="text" size="30" value="<s:property value="c.c_fundsource"/>" readonly="readonly"/>
			</p>
			
			<dl class="nowrap">
			<dt>社团简介：</dt>
			<dd><s:property value="c.c_brief"/></dd>
			</dl>
			<dl class="nowrap">
			<dt>社团组织机构：</dt>
			<dd><s:property value="c.c_organization" escape="false"/></dd>
			</dl>
			<dl class="nowrap">
			<dt>日常活动：</dt>
			<dd><s:property value="c.c_dailyactive"/></dd>
			</dl><dl class="nowrap">
			<dt>精品活动：</dt>
			<dd><s:property value="c.c_goodactive"/></dd>
			</dl><dl class="nowrap">
			<dt>获奖情况：</dt>
			<dd><s:property value="c.c_prize"/></dd>
			</dl>
			</dl><dl class="nowrap">
			<dt>章程：</dt>
			<dd><s:property value="c.c_rule"/></dd>
			</dl>
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
			
			<li><div class="buttonActive"><div class="buttonContent"><a href="club/club_annualinfo" target="navTab" rel="club_annualinfo"><button type="submit">查看历年社团信息</button></a></div></div></li>
			
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
			<s:if test="c_c==0"><s:if test="#session.userlevel==1">	<li><div class="buttonActive"><div class="buttonContent"><a href="club/club_infupdate" target="navTab" rel="club_infshow2"><button type="submit">修改</button></a></div></div></li></s:if></s:if>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>

</div>
