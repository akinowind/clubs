<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageContent">
	<form method="post" action="project/project_fundtotal" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone);">
		<div class="pageFormContent" layoutH="56">
		
			
			<fieldset >
			<input type="hidden" name="pro.pro_id" value='<s:property value="#parameters.id[0]"/>'>
			<dl class="nowrap">
			<dt>项目总经费(元)：</dt>
			<dd><input type="text" name="pro.pro_fundtotal" class="required digits" size="20" maxlength="6"/></dd>
			</dl>
			
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
