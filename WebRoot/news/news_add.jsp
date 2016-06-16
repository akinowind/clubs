<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageContent">
	<form method="post" action="news/news_add" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
			<s:if test="#parameters.jump[0]==2">
					<input type="hidden"  name=n.n_type value="4" />
			</s:if>
			<s:else>
			<input type="hidden"  name=n.n_type value="<s:property value="#parameters.type[0]"/>" />
			</s:else>
			<fieldset>
			<label>标题：</label>
				<input name="n.n_title" type="text" size="80"  maxlength="50" class="required"/>
			
			<dl class="nowrap">
			<s:if test="#parameters.type[0]==5">
			<dt>总票数(张)：</dt>
			
			<dd><input name="n.n_ticket" type="text"   size="20"  class="digits required"/></dd>
			</s:if>
			</dl>
			<dl class="nowrap">
			<dt>内容：</dt>
			<dd><textarea name="n.n_content" class="required editor" cols="120" rows="20" tools="simple" ></textarea></dd>
			</dl>
		
			</fieldset>
		</div>
		<div class="formBar">
			<ul>
				<!--<li><a class="buttonActive" href="javascript:;"><span>保存</span></a></li>-->
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">确认</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>
