<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageContent">
	<form method="post" action="club/club_inf" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
		<fieldset>
		<input type="hidden" name="c.c_id" value="1">
			<p>
				<label>社团名称：</label>
				<input name="sn" type="text" size="30" value="<s:property value="#session.clubname"/>" readonly="readonly"/>
			</p>
			
			<p>
				<label>社团类型：</label>
				<select name="c.c_type" class="required combox" >
					<option value="">请选择</option>
					<option <s:if test='c.c_type=="艺术类" '>selected="selected"</s:if> value="艺术类">艺术类</option>
					<option <s:if test='c.c_type == "体育类"'>selected="selected"</s:if> value="体育类">体育类</option>
					<option <s:if test=' c.c_type == "科技类" '>selected="selected"</s:if> value="科技类">科技类</option>
					<option <s:if test='c.c_type == "学术类"'>selected="selected"</s:if> value="学术类">学术类</option>
					<option <s:if test='c.c_type == "实践类"'>selected="selected"</s:if> value="实践类">实践类</option>
					<option <s:if test='c.c_type == "公益类"'>selected="selected"</s:if> value="公益类">公益类</option>
				</select>
			</p>
			<p>
				<label>隶属单位：：</label>
				<select name="c.c_up" class="required combox">
					<option value="">请选择</option>
					<option  <s:if test="c.c_up==2 ">selected="selected"</s:if> value="2">社团联合会</option>
					<option <s:if test="c.c_up==3 ">selected="selected"</s:if> value="3">校团委</option>
					<option <s:if test="c.c_up==4 ">selected="selected"</s:if> value="4">信息科学技术学院团委</option>
					
				</select>
			</p>
			<p>
				<label>活动场地：</label>
				<input name="c.c_office"  value="<s:property value="c.c_office"/>" type="text" class="required textInput"    >
			</p>
			<p>
				<label>每年活动经费（元）：</label>
				<input name="c.c_fund"  value="<s:property value="c.c_fund"/>" type="text" class="required"   class="textInput">
			</p>
			<p>
				<label>经费来源：：</label>
				<select name="c.c_fundsource" class="required combox">
					<option value="">请选择</option>
					<option <s:if test='c.c_fundsource == "经费支持"'>selected="selected"</s:if> value="经费支持">经费支持</option>
					<option <s:if test='c.c_fundsource == "外联赞助"'>selected="selected"</s:if> value="外联赞助">外联赞助</option>									
				</select>
			</p>
			
			<dl class="nowrap">
			<dt>社团简介：</dt>
			<dd><textarea name="c.c_brief"  class="required" cols="80" rows="6" tools="simple" maxlength="200"><s:property value="c.c_brief"/></textarea></dd>
			</dl>
			<dl class="nowrap">
			<dt>社团组织机构：</dt>
			<dd><textarea name="c.c_organization"  class="required editor" cols="80" rows="12" tools="simple" ><s:property value="c.c_organization" escape="false"/></textarea></dd>
			</dl>
			<dl class="nowrap">
			<dt>日常活动：</dt>
			<dd><textarea name="c.c_dailyactive"  class="required" cols="80" rows="12" ><s:property value="c.c_dailyactive"/></textarea></dd>
			</dl><dl class="nowrap">
			<dt>精品活动：</dt>
			<dd><textarea name="c.c_goodactive"  class="required" cols="80" rows="12" ><s:property value="c.c_goodactive"/></textarea></dd>
			</dl><dl class="nowrap">
			<dt>获奖情况：</dt>
			<dd><textarea name="c.c_prize"  class="required" cols="80" rows="12" ><s:property value="c.c_prize"/></textarea></dd>
			</dl>
			</dl><dl class="nowrap">
			<dt>章程：</dt>
			<dd><textarea name="c.c_rule"  class="required" cols="80" rows="12" ><s:property value="c.c_rule"/></textarea></dd>
			</dl>
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
