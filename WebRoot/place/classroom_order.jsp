<%@page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="pageContent">
	
	<form method="post" action="place/classroom_order" class="pageForm required-validate" onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="58">
           
            
       
            <input type="hidden" name="p.p_id" value="<s:property value="#parameters.p_id[0]"/>" />
             <input type="hidden" name="p.p_t_time" value="<s:property value="#parameters.p_t_time[0]"/>" />
          	<dl class="nowrap">
          		<dt>所需多媒体设备:</dt>
          		<dd><input type="text" class="required" name="p.p_media" size="83"/></dd>
                <dt>用途：    </dt>
   			 <dd>
        		<textarea class="required textInput" rows="5" cols="80" name="p.p_t_reason" maxlength="200"></textarea>
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

