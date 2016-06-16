<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>内容</title>


<link href="image/ypzy.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="100%" class="utopbg"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
      <div class="upablicw">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="29%" height="50"></td>
            <td width="71%">&nbsp;</td>
          </tr>
          <tr>
            <td><a href="__APP__"><!--<img src="__PUBLIC__/dwz/themes/default/images/login_logo.gif" /> --></a></td>
            <td align="right" class="utoptitle">
            &nbsp;&nbsp;<a href="/clubs/index">系统首页</a>
            &nbsp;&nbsp;<a href="/clubs/news/news_indexlist">新闻动态</a>
            &nbsp;&nbsp;

            &nbsp;&nbsp;</td>
          </tr>
          <tr>
            <td height="40">&nbsp;</td>
            <td class="utoptitle">&nbsp;</td>
          </tr>
        </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="34%" align="left" valign="top"><img src="image/leftpic3.jpg" width="306" height="429" /></td>
        <td width="66%" align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
             <td valign="top" height="40" class="uclasstitle"><strong>新闻动态</strong><span>News Center</span></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="uqtform">
                <div><br /><br />
                  <div style="color:#000; font-size:30px;text-align:center;"><s:property value="n.n_title" /></div>
                  <div style="text-align:center; line-height:250%; color:#999;"><s:date name="n.n_inputtime" format="yyyy-MM-dd HH:mm"/></div>
                  <div style="font-size:12px;line-height:250%;color:#474747;"><s:property value="n.n_content" /></div>
                </div>
				<br/>
				<s:if test="n.n_type==5">
				<div>
				 <h2>票数剩余：<s:property value="n.n_ticket"/>张</h2>
				<center><h1 ><s:if test="n.n_ticket <= 0" >票已售完</s:if><s:elseif test="n.t_phone!=null">您已定过票</s:elseif><s:else><a href="/clubs/news/news_ticketorder.jsp?n_id=<s:property value="n.n_id"/>" style="color:red;">马上抢票</a></s:else></h1></center>
				</div>
				</s:if>
            </td>
          </tr>
        </table></td>        
      </tr>
    </table>        
    <table class="udfooter" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="100" align="center" valign="middle">Copyright &copy; 海风IT协会 <a  target="_blank"  href="safewind.dlmu.eud.cn">2014</a> Inc. All Rights Reserved. </td>
      </tr>
    </table>

      </div>
    </td>
  </tr>
</table>
</body>
</html>
