<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageContent">
	<form method="post" action="project/project_apply" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
		
			
			<fieldset>
			<label>项目名称：</label>
				<input name="pro.pro_name" type="text" size="80"  maxlength="50"/>
			
			<dl class="nowrap">
			<dt>项目策划：</dt>
			<dd><textarea name="pro.pro_content" class="required editor" cols="120" rows="15" tools="simple" ></textarea></dd>
			</dl>
			<dl class="nowrap">
			<dt>项目总经费(元)：</dt>
			<dd><input type="text" name="pro.pro_fundtotal" class="required digits" size="20" maxlength="6"/></dd>
			</dl>
			<dl class="nowrap">
			<dt>项目经费说明：</dt>
			<dd><textarea name="pro.pro_fund" class="required editor" cols="120" rows="20" tools="simple" ></textarea></dd>
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
