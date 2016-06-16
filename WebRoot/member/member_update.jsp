<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="pageContent">
	
	<form method="post" action="member/member_save" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
           
            
            <s:if test="m.student_id==201">
            <input type="hidden" name="m.statue" value="1" />
            </s:if>
			<div class="unit">
				<label>会员学号：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22</label>
				<input type="text" name="m.student_id" value="<s:property value="m.student_id"/>" size="30" maxlength="8" class="required digits" <s:if test="m.student_id!=201"> readonly="readonly"</s:if> />
			</div>
			
			<div class="unit">
				<label>会员姓名：</label>
				<input type="text" name="m.member_name" value="<s:property value="m.member_name"/>" size="30" maxlength="20" class="required" <s:if test="m.student_id!=201"> readonly="readonly"</s:if>/>
			</div>
			
			<div class="unit">
				<label>社团职位：</label>
				<select name="m.c_m_job" class="required combox">
					<option <s:if test="m.c_m_job==300">selected="selected"</s:if>value="0">请选择</option>
					<option <s:if test="m.c_m_job==1">selected="selected"</s:if>value="1">主席</option>
					<option <s:if test="m.c_m_job==2">selected="selected"</s:if>value="2">副主席</option>
					<option <s:if test="m.c_m_job==3">selected="selected"</s:if>value="3">部长</option>
					<option <s:if test="m.c_m_job==4">selected="selected"</s:if>value="4">副部长</option>
					<option <s:if test="m.c_m_job==5">selected="selected"</s:if>value="5">会员</option>
					
				</select>
			</div>
				
			
		 	
			
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

