<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="pageContent">
	
	<form method="post" action="member/member_addbad" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
		<input type="hidden" name="m.c_m_id" value="<s:property value="#parameters.id[0]"/>">
		         
            
            <dl class="nowrap">
                <dt>添加惩罚：    </dt>
    <dd>
        <textarea class="required textInput" rows="5" cols="80" name="m.c_m_bad"></textarea>
    </dd>

			</dl>
				
			
		 	
			
			
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">提交</button></div></div></li>
				<li><div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div></li>
			</ul>
		</div>
	</form>
</div>

