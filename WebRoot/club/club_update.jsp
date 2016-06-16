<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="pageContent">
	
	<form method="post" action="club/club_save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
            <input type="hidden" name="c.c_id" value="<s:property value="c.c_id"/>"/>
		
			<div class="unit">
				<label>社团名称：</label>
				<input type="text" name="c.c_name" value="<s:property value="c.c_name"/>" size="30" maxlength="18" class="required" />
			</div><div class="unit">
				<label>负责人学号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22</label>
				<input type="text" name="c.c_mid" <s:if test="c.c_mid != 0">value="<s:property value="c.c_mid"/>"</s:if>  size="30" maxlength="8" class="required digits" />
			</div>
			<p>
				<label>成立时间：</label>
				<input type="text" name="c.c_starttime" value="<s:date name="c.c_starttime" format="yyyy-MM-dd"/>" class="required date" readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
				<span class="info"></span>
			</p>
		 	
		
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

