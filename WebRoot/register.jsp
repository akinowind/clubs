<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>   



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>填写个人信息</title>

<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script type="text/javascript" src="js/register/jquery.poshytip.js"></script>
<script type='text/javascript' src="js/register/jq.validate.js"></script>




<link rel="stylesheet" type="text/css" href="js/register/reset.css" />

<link rel="stylesheet" type="text/css" href="js/register/tip-yellowsimple/tip-yellowsimple.css" />


<style type="text/css">
td{padding:7px;}
.labels {text-align:right;}
</style>

<script type="text/javascript">
$(function(e) {
	var vali=new Validators();
	$("#btn").bind("click", vali.subByJs);
});
</script>



</head>
<body>

<form method="post" action="member/member_info" type="validate">
	<div align="center">
		<h1>您是第一次登陆，请填写个人信息</h1>
		<br />
		<table width="30%" border="0">
		<input type="hidden" name="m.member_statue" value="1"/>
		<tr>
			<td class="labels">中文姓名:</td><td><input type="text" name="m.member_name" maxlength ="10" valType="CHINESE" msg="<font color=red>*</font>中文格式不正确" /></td>
		</tr>
		
		<tr>
			<td class="labels">手机:</td><td><input type="text" name="m.member_phone" maxlength ="20" valType="MOBILE" msg="<font color=red>*</font>手机格式不正确" /></td>
		</tr>
		
		
		<tr>
			<td class="labels">邮箱:</td><td><input type="text" name="m.member_email" maxlength ="50" valType="MAIL" msg="<font color=red>*</font>电子邮箱格式不正确" /></td>
		</tr>
		<tr>
			<td class="labels">QQ:</td><td><input type="text" name="m.member_qq" maxlength ="12" valType="NUMBER" msg="<font color=red>*</font>QQ号只能是数字" /></td>
		</tr>
		<tr>
			<td class="labels">学院:</td><td><input type="text" name="m.member_college" maxlength ="15" valType="CHINESE" msg="<font color=red>*</font>学院输入错误" /></td>
			
		</tr>
		<tr>
			<td class="labels">专业班级:</td><td><input type="text" name="m.member_class" maxlength ="20" valType="CHINESE" msg="<font color=red>*</font>专业班级输入错误（用汉字代替阿拉伯数字）" /></td>
		</tr>
		<tr>
			<td></td>
			<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="hidden" value="提交回调函数" id='btn'/><input type="submit" value="提交" /> </td>
		</tr>
		</table>
	</div>
</form>

</body>
</html>