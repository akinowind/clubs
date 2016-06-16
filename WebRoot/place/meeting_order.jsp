<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>


<div class="pageContent">
	<form method="post" action="meeting/meeting_save" class="pageForm required-validate" onsubmit="return validateCallback(this, navTabAjaxDone);">
		<div class="pageFormContent" layoutH="56">
		
			
			
			<fieldset>
			<p>
				<label>申请单位：</label>
				<input name="me.me_department" type="text" size="20"  class="required"/>
			</p>
			
			<p>
				<label>申请人：</label>
				<input name="me.me_person" type="text" size="20"  class="required"/>
			</p>
			<dl class="nowrap">
			<dt>会议主题：</dt>
			<dd><input name="me.me_theme" type="text" size="50"  class="required"/></dd>
			</dl>
			<p> <label>所需多媒体设备：</label><input type="text" name="me.me_media" size="35" class="required" />
			<p>
				<label>开始时间：</label>
			
				<input type="text" name="me.me_starttime" id="start" class="date required" dateFmt="yyyy-MM-dd HH:mm"   readonly="true"/>
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			
			<p>
				<label>结束时间：</label>
				<input type="text" name="me.me_endtime" id="end" class="date required" dateFmt="yyyy-MM-dd HH:mm" readonly="true"/>
			
				<a class="inputDateButton" href="javascript:;">选择</a>
			</p>
			<p>
				<label>主持人：</label>
				<input name="me.me_host" type="text" size="20"  class="required" />
			</p>
			
			<p>
				<label>联系电话：</label>
				<input name="me.me_phone" type="text"    size="20"  class="digits required"/>
			</p>
				
			<p>
				<label>选择会议室</label>
				<input  name="me.me_mid" value="" type="hidden"/>
				<input class="required" name="me.orgName" type="text"   lookupGroup="me" readonly="true"/>
				
				
				<a class="btnLook" href="meeting/meeting_room?me.me_starttime={start}&me.me_endtime={end} " lookupGroup="me"  mask="true" title="选择会议室" width="580" height="300" >查找带回</a>	
			</p>
			<dl class="nowrap">
			<dt>参会人员：</dt>
			<dd><input name="me.me_part" type="text" size="80"  class="required"/></dd>
			</dl>
			<dl class="nowrap">
			<dt>出席校领导：</dt>
			<dd><input name="me.me_attend" type="text" size="80"  /></dd>
			</dl>
			<dl class="nowrap">
			<dt>会议内容：</dt>
			<dd><textarea name="me.me_content" class="required" cols="80" rows="12" ></textarea></dd>
			</dl><dl class="nowrap">
			
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
