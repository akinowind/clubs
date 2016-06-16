<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大连海事大学社团管理系统</title>

<link href="themes/default/style.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="themes/css/core.css" rel="stylesheet" type="text/css" media="screen"/>
<link href="themes/css/print.css" rel="stylesheet" type="text/css" media="print"/>
<link href="uploadify/css/uploadify.css" rel="stylesheet" type="text/css" media="screen"/>

<!--[if IE]>
<link href="themes/css/ieHack.css" rel="stylesheet" type="text/css" media="screen"/>
<![endif]-->

<!--[if lte IE 9]>
<script src="js/speedup.js" type="text/javascript"></script>
<![endif]-->

<script src="js/jquery-1.7.2.js" type="text/javascript"></script>
<script src="js/jquery.cookie.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/jquery.bgiframe.js" type="text/javascript"></script>
<script src="xheditor/xheditor-1.2.1.min.js" type="text/javascript"></script>
<script src="xheditor/xheditor_lang/zh-cn.js" type="text/javascript"></script>
<script src="uploadify/scripts/jquery.uploadify.js" type="text/javascript"></script>

<!-- svg图表  supports Firefox 3.0+, Safari 3.0+, Chrome 5.0+, Opera 9.5+ and Internet Explorer 6.0+ -->
<script type="text/javascript" src="chart/raphael.js"></script>
<script type="text/javascript" src="chart/g.raphael.js"></script>
<script type="text/javascript" src="chart/g.bar.js"></script>
<script type="text/javascript" src="chart/g.line.js"></script>
<script type="text/javascript" src="chart/g.pie.js"></script>
<script type="text/javascript" src="chart/g.dot.js"></script>

<script src="js/dwz.core.js" type="text/javascript"></script>
<script src="js/dwz.util.date.js" type="text/javascript"></script>
<script src="js/dwz.validate.method.js" type="text/javascript"></script>
<script src="js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="js/dwz.barDrag.js" type="text/javascript"></script>
<script src="js/dwz.drag.js" type="text/javascript"></script>
<script src="js/dwz.tree.js" type="text/javascript"></script>
<script src="js/dwz.accordion.js" type="text/javascript"></script>
<script src="js/dwz.ui.js" type="text/javascript"></script>
<script src="js/dwz.theme.js" type="text/javascript"></script>
<script src="js/dwz.switchEnv.js" type="text/javascript"></script>
<script src="js/dwz.alertMsg.js" type="text/javascript"></script>
<script src="js/dwz.contextmenu.js" type="text/javascript"></script>
<script src="js/dwz.navTab.js" type="text/javascript"></script>
<script src="js/dwz.tab.js" type="text/javascript"></script>
<script src="js/dwz.resize.js" type="text/javascript"></script>
<script src="js/dwz.dialog.js" type="text/javascript"></script>
<script src="js/dwz.dialogDrag.js" type="text/javascript"></script>
<script src="js/dwz.sortDrag.js" type="text/javascript"></script>
<script src="js/dwz.cssTable.js" type="text/javascript"></script>
<script src="js/dwz.stable.js" type="text/javascript"></script>
<script src="js/dwz.taskBar.js" type="text/javascript"></script>
<script src="js/dwz.ajax.js" type="text/javascript"></script>
<script src="js/dwz.pagination.js" type="text/javascript"></script>
<script src="js/dwz.database.js" type="text/javascript"></script>
<script src="js/dwz.datepicker.js" type="text/javascript"></script>
<script src="js/dwz.effects.js" type="text/javascript"></script>
<script src="js/dwz.panel.js" type="text/javascript"></script>
<script src="js/dwz.checkbox.js" type="text/javascript"></script>
<script src="js/dwz.history.js" type="text/javascript"></script>
<script src="js/dwz.combox.js" type="text/javascript"></script>
<script src="js/dwz.print.js" type="text/javascript"></script>
<!--
<script src="bin/dwz.min.js" type="text/javascript"></script>
-->
<script src="js/dwz.regional.zh.js" type="text/javascript"></script>

<script type="text/javascript">
$(function(){
	DWZ.init("dwz.frag.xml", {
		
		statusCode:{ok:200, error:300, timeout:301}, //【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug:false,	// 调试模式 【true|false】
		callback:function(){
			initEnv();
			$("#themeList").theme({themeBase:"themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
});

</script>
 
</head>

<body scroll="no" >
	<div id="layout">
		<div id="header">
			<div class="headerNav">
				<a class="logo" href="http://j-ui.com">标志</a>
				<ul class="nav">
					
					<li><a href="/clubs/index">主页</a></li>
				</ul>
				<ul class="themeList" id="themeList">
					<li theme="default"><div class="selected">蓝色</div></li>
					<li theme="green"><div>绿色</div></li>
					<!--<li theme="red"><div>红色</div></li>-->
					<li theme="purple"><div>紫色</div></li>
					<li theme="silver"><div>银色</div></li>
					<li theme="azure"><div>天蓝</div></li>
				</ul>
			</div>

			<!-- navMenu -->
			
		</div>

		<div id="leftside">
			<div id="sidebar_s">
				<div class="collapse">
					<div class="toggleCollapse"><div></div></div>
				</div>
			</div>
			<div id="sidebar">
				<div class="toggleCollapse"><h2>主菜单</h2><div>收缩</div></div>

				<div class="accordion" fillSpace="sidebar">
				
				<s:if test="#parameters.jump[0]==1">
				
					<div class="accordionHeader">
						<h2><span>Folder</span>教室申请</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a href="tabsPage.html" target="navTab">新大活教室</a>
								<ul>
                               
									<li><a href="place/classroom_list.jsp" target="navTab" rel="classroom_list" fresh="true">申请教室</a></li>
 									<s:if test="#session.userlevel_1>100"> 
									<li><a href="place/classroom_orderlist" target="navTab" rel="classroom_orderlist" fresh="true">审批申请</a></li>
									</s:if> 
									<li><a href="place/meeting_order.jsp" target="navTab" rel="meeting_order" fresh="true">会议室申请</a></li>
									<li><a href="meeting/meeting_list" target="navTab" rel="meeting_list" fresh="true">查看使用情况</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="meeting/meeting_orderlist" target="navTab" rel="meeting_orderlist" fresh="true">审批会议室申请</a></li>
									</s:if> 
									
								</ul>
							</li>
							
							
						</ul>
					</div>
				
			</s:if>
				
				<s:else>
					<div class="accordionHeader">
						<h2><span>Folder</span>我的社团</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a>我的社团</a>
								<ul>
									<li><a href="main.jsp" target="navTab" rel="main">我的主页</a></li>
									<li><a href="member/member_list" target="navTab" rel="member_list" fresh="true">会员列表</a></li>
									<li><a href="club/club_infshow" target="navTab" rel="club_infshow" fresh="true">社团信息</a></li>
								</ul>
							</li>
							
							<!-- 社联管理社团功能 -->
							<s:if test="#session.userlevel_1>100">
							<li><a>管理社团</a>
								<ul>
									
									<li><a href="club/club_list" target="navTab" rel="club_list" fresh="true">社团列表</a></li>
									<li><a href="member/member_list2" target="navTab" rel="member_list2" fresh="true">会员列表</a></li>
								</ul>
							</li>
							</s:if>
							<!-- 社联管理社团功能 结束-->
							
							
						</ul>
						
					</div>
					
					<div class="accordionHeader">
						<h2><span>Folder</span>教室申请</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							<li><a>新大活教室</a>
								<ul>
									
									<li><a href="place/classroom_list.jsp" target="navTab" rel="classroom_list" fresh="true">申请教室</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="place/classroom_orderlist" target="navTab" rel="classroom_orderlist" fresh="true">审批申请</a></li>
									</s:if>
									<li><a href="place/meeting_order.jsp" target="navTab" rel="meeting_order" fresh="true">大型会议室申请</a></li>
									<li><a href="meeting/meeting_list" target="navTab" rel="meeting_list" fresh="true">查看使用情况</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="meeting/meeting_orderlist" target="navTab" rel="meeting_orderlist" fresh="true">审批会议室申请</a></li>
									</s:if>
								</ul>
							</li>
							
							
						</ul>
					</div>
					<div class="accordionHeader">
						<h2><span>Folder</span>项目申请</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							
									
									<li><a href="project/project_apply.jsp" target="navTab" rel="project_apply" fresh="true">申请项目</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="project/project_list" target="navTab" rel="project_list" fresh="true">审批项目</a></li>
									</s:if>
								
							
							
						</ul>
					</div>
					
					
					
					
					<div class="accordionHeader">
						<h2><span>Folder</span>公告新闻</h2>
					</div>
					<div class="accordionContent">
						<ul class="tree treeFolder">
							
									
								<li><a href="news/news_add.jsp?type=1" target="navTab" rel="news_add" fresh="true">添加公告</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="news/news_list?n.n_type=1" target="navTab" rel="news_list" fresh="true">查看公告</a></li>
									</s:if>
									<li><a href="news/news_add.jsp?type=2" target="navTab" rel="news_add" fresh="true">添加新闻</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="news/news_list?n.n_type=2" target="navTab" rel="news_list" fresh="true">查看新闻</a></li>
									</s:if>
									<li><a href="news/news_add.jsp?type=3" target="navTab" rel="goods_list" fresh="true">发布招聘</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="news/news_list?n.n_type=3" target="navTab" rel="news_list" fresh="true">查看招聘</a></li>
									</s:if>
									<li><a href="news/news_add.jsp?type=4" target="navTab" rel="goods_list" fresh="true">发布意见</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="news/news_list?n.n_type=4" target="navTab" rel="news_list" fresh="true">查看意见</a></li>
									</s:if>
									<li><a href="news/news_add.jsp?type=5" target="navTab" rel="goods_list" fresh="true">发布抢票</a></li>
									<s:if test="#session.userlevel_1>100">
									<li><a href="news/news_list?n.n_type=5" target="navTab" rel="news_list" fresh="true">查看抢票</a></li>
									</s:if>
						
						</ul>
					</div>
				</s:else>
					
					
					
					
					
					
					
				</div>
			</div>
		</div>
		<div id="container">
			
			<div id="navTab" class="tabsPage">
				<div class="tabsPageHeader">
					<div class="tabsPageHeaderContent"><!-- 显示左右控制时添加 class="tabsPageHeaderMargin" -->
						<ul class="navTab-tab">
							<li tabid="main" class="main"><a href="javascript:;"><span><span class="home_icon"><s:if test="#parameters.jump[0]==1">会议室申请</s:if><s:else>我的主页</s:else></span></span></a></li>
						</ul>
					</div>
					<div class="tabsLeft">left</div><!-- 禁用只需要添加一个样式 class="tabsLeft tabsLeftDisabled" -->
					<div class="tabsRight">right</div><!-- 禁用只需要添加一个样式 class="tabsRight tabsRightDisabled" -->
					<div class="tabsMore">more</div>
				</div>
				<ul class="tabsMoreList">
					
					<li><a href="javascript:;">我的主页</a></li>
				</ul>
				<div class="navTab-panel tabsPageContent layoutBox">
				<%--会议室申请 --%>
				<s:if test="#parameters.jump[0]==1">
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="alertInfo">
								<center><h2>2013-2014学年（二）</h2></center>
								<center><h2><%=new java.text.SimpleDateFormat("yyyy年 MM 月 dd 日").format(new java.util.Date())%></h2></center>
							</div>
							<div class="right">
								<!-- <p style="line-height:19px">待办工作3项</p>
								<p style="line-height:19px">消息2条</p>  -->
							</div>
							<p><span>欢迎您：<%=request.getRemoteUser() %></span></p>
							<p><s:property value="#session.clubname"/>-<s:if test="#session.userlevel==1">主席</s:if><s:elseif test="#session.userlevel==0">主席</s:elseif><s:elseif test="#session.userlevel==2">副主席</s:elseif><s:elseif test="#session.userlevel==3">部长</s:elseif><s:elseif test="#session.userlevel==4">副部长</s:elseif><s:elseif test="#session.userlevel==5">会员</s:elseif><s:else>未知职位</s:else>:<s:property value="#session.sname"/></p>
						</div>
						<div class="pageFormContent" layoutH="80" >
							<center><div ><a style="font-size:30px;color:red;" href="place/classroom_list.jsp" target="navTab" rel="classroom_list" fresh="true">普通教室申请</a></div></center><br/><br/>
							<center><div><a style="font-size:30px;color:red;" href="place/meeting_order.jsp" target="navTab" rel="meeting_order" fresh="true">会议室申请</a></div></center>
							
						</div>
						
						
					</div>
				</s:if>
				<%--发布意见 --%>
				<s:elseif test="#parameters.jump[0]==2">
				<s:include value="/news/news_add.jsp"></s:include>
				</s:elseif>
				<%--我的主页--%>
				<s:else>
					<div class="page unitBox">
						<div class="accountInfo">
							<div class="alertInfo">
								<center><h2>2013-2014学年（二）</h2></center>
								<center><h2><%=new java.text.SimpleDateFormat("yyyy年 MM 月 dd 日").format(new java.util.Date())%></h2></center>
							</div>
							<div class="right">
								<!-- <p style="line-height:19px">待办工作3项</p>
								<p style="line-height:19px">消息2条</p>  -->
							</div>
							<p><span>欢迎您：<%=request.getRemoteUser() %></span></p>
							<p><s:property value="#session.clubname"/>-<s:if test="#session.userlevel==500">主席</s:if><s:elseif test="#session.userlevel==1">主席</s:elseif><s:elseif test="#session.userlevel==2">副主席</s:elseif><s:elseif test="#session.userlevel==3">部长</s:elseif><s:elseif test="#session.userlevel==4">副部长</s:elseif><s:elseif test="#session.userlevel==5">会员</s:elseif><s:else>未知职位</s:else>:<s:property value="#session.sname"/></p>
						</div>
						<div class="pageFormContent" layoutH="80" >
							<img src="images/adminindex.jpg" alt="海风-大连海事大学社团管理系统"  width="100%" height="100%"/>
							
						</div>
						
						
					</div>
				</s:else>	
				</div>
			</div>
		</div>

	</div>

	<div id="footer">Copyright &copy; 2014 <a href="safewind_inf.html" target="dialog">海风IT协会</a></div>



</body>
</html>