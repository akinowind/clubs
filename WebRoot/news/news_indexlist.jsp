<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新闻中心</title>


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
            <td></td>
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
             <td valign="top" height="40" class="uclasstitle"><strong>抢票动态</strong><span>News Center</span></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="uqtform"><br />
                <div class="newslist">
                	
                     <s:iterator value="news" var="n" >
                     	<s:if test="#n.n_type==5">
                      	<li><span style="float:right;"><s:date name="#n.n_inputtime" format="yyyy-MM-dd"/></span><a href="/clubs/news/news_show?n.n_id=<s:property value="#n.n_id"/>"><s:property value="#n.n_title"/></a></li>
                      	</s:if>
					</s:iterator>
					<a href="../news/news_indexlist?currentPage1=1&currentPage2=<s:property value="currentPage2"/>" target="_self">首页</a>
					<s:if test="currentPage1==1">
					上一页
					</s:if>
					<s:else>
					<a href="../news/news_indexlist?currentPage1=<s:property value="currentPage1- 1"/>&currentPage2=<s:property value="currentPage2"/>" target="_self">上一页</a>
					</s:else>
					<s:if test="currentPage1==countPage1">
					下一页
					</s:if>
					<s:else>
					<a href="../news/news_indexlist?currentPage1=<s:property value="currentPage1+ 1"/>&currentPage2=<s:property value="currentPage2"/>" target="_self">下一页</a>
					 </s:else>
					 <a href="../news/news_indexlist?currentPage1=<s:property value="countPage1"/>&currentPage2=<s:property value="currentPage2"/>" target="_self">尾页</a>
			<script type="text/javascript">
			function changePage1(){
				var currentPage1=document.getElementById("currentPage1").value;
					var currentPage2=document.getElementById("currentPage2").value;
				window.open("../news/news_indexlist?currentPage2=" + currentPage2+"&currentPage1="+ currentPage1,"_self");
			}
		</script>
		<select id="currentPage1" onchange="changePage1()">
			<c:forEach begin="1" end="${countPage1 }" step="1" var="num">
				<c:choose>
					<c:when test="${num==currentPage1}">
						<option value="${num}" selected="selected">${num}</option>
					</c:when>
					<c:otherwise>
						<option value="${num}">${num}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
		共${countPage1}页
                </div>
            </td>
          </tr>
		 <tr>
            <td align="left" valign="top" class="uqtform"><br />
              
            </td>
          </tr>
		  <tr>
		  
		  
             <td valign="top" height="40" class="uclasstitle"><strong>社团招聘</strong><span>News Center</span></td>
          </tr>
          <tr>
            <td align="left" valign="top" class="uqtform"><br />
                <div class="newslist">
                     
                      	 <div class="newslist">
                     <s:iterator value="news" var="n" >
                     <s:if test="#n.n_type==1">
                      	<li><span style="float:right;"><s:date name="#n.n_inputtime" format="YYYY-MM-dd"/></span><a href="/clubs/news/news_show?n.n_id=<s:property value="#n.n_id"/>"><s:property value="#n.n_title"/></a></li>
					</s:if>					
					</s:iterator>
					<a href="../news/news_indexlist?currentPage2=1&currentPage1=<s:property value="countPage1"/>" target="_self">首页</a>
					<s:if test="currentPage2==1">
					上一页
					</s:if>
					<s:else>
					<a href="../news/news_indexlist?currentPage2=<s:property value="currentPage2- 1"/>&currentPage1=<s:property value="countPage1"/>" target="_self">上一页</a>
					</s:else>
					<s:if test="currentPage2==countPage2">
					下一页
					</s:if>
					<s:else>
					<a href="../news/news_indexlist?currentPage2=<s:property value="currentPage2+ 1"/>&currentPage1=<s:property value="countPage1"/>" target="_self">下一页</a>
					</s:else>
					 <a href="../news/news_indexlist?currentPage2=<s:property value="countPage2"/>&currentPage1=<s:property value="countPage1"/>" target="_self">尾页</a>
			<script type="text/javascript">
			function changePage2(){
				var currentPage1=document.getElementById("currentPage1").value;
				var currentPage2=document.getElementById("currentPage2").value;
				window.open("../news/news_indexlist?currentPage2=" + currentPage2+"&currentPage1="+ currentPage1,"_self");
			}
		</script>
		<select id="currentPage2" onchange="changePage2()">
			<c:forEach begin="1" end="${countPage2 }" step="1" var="num">
				<c:choose>
					<c:when test="${num==currentPage2}">
						<option value="${num}" selected="selected">${num}</option>
					</c:when>
					<c:otherwise>
						<option value="${num}">${num}</option>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</select>
					共${countPage2}页
						
                </div>
                </div>
            </td>
          </tr>
        </table></td> 
      </tr>
	  
    </table>        
    <table class="udfooter" width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="100" align="center" valign="middle">Copyright &copy; 海风IT协会 <a  target="_blank"  href="safewind.dlmu.edu.cn">2014</a> Inc. All Rights Reserved. </td>
      </tr>
    </table>

      </div>
    </td>
  </tr>
</table>

</body>
</html>
