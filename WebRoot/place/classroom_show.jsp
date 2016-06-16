<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<div class="pageCentent" layoutH="0">
<meta charset="utf-8" http-equiv="content-type" />
<link href="themes/css/apply_in.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	window.onload = function(){
		if(window.attachEvent){  
        	document.getElementsByTagName('body').item('0').style.marginTop = '22px';
			document.getElementById('cont').style.height = '615px'; 
   	 	}
	}
</script>
</head>
<body>

<div id="cont">
    <div id="right2">
    	<div id="tb">
    	<table id="table2" cellpadding="2" cellspacing="2">
        	<tr>
            	<td id="mark"><s:property value="pinfo[0].p_id"/><br /><s:property value="pinfo[0].p_name"/></td>
                <td id="top_mark">8:00~10:00</td>
                <td id="top_mark">10:00~12:00</td>
                <td id="top_mark">12：00~14:00</td>
                <td id="top_mark">14:00~16:00</td>
                <td id="top_mark">16:00~18:00</td>
                <td id="top_mark">18:00~20:00</td>
            </tr> 
            <tr>
            	<td id="week">周一</td>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 11"><s:set name="panduan1" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan1!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=11&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 12"><s:set name="panduan2" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                 <s:if test="#attr.panduan2!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=12&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 13"><s:set name="panduan3" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan3!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=13&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 14"><s:set name="panduan4" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                 <s:if test="#attr.panduan4!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=14&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 15"><s:set name="panduan5" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                 <s:if test="#attr.panduan5!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=15&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 16"><s:set name="panduan6" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                 <s:if test="#attr.panduan6!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=16&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周二</td>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 21"><s:set name="panduan21" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan21!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=21&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 22"><s:set name="panduan22" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan22!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=22&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 23"><s:set name="panduan23" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan23!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=23&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 24"><s:set name="panduan24" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan24!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=24&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 25"><s:set name="panduan25" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan25!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=25&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 26"><s:set name="panduan26" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan26!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=26&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周三</td>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 31"><s:set name="panduan31" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan31!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=31&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 32"><s:set name="panduan32" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan32!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=32&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 33"><s:set name="panduan33" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan33!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=33&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 34"><s:set name="panduan34" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan34!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=34&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 35"><s:set name="panduan35" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan35!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=35&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 36"><s:set name="panduan36" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan36!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=36&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周四</td>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 41"><s:set name="panduan41" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan41!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=41&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 42"><s:set name="panduan42" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan42!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=42&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 43"><s:set name="panduan43" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan43!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=43&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 44"><s:set name="panduan44" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan44!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=44&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 45"><s:set name="panduan45" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan45!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=45&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 46"><s:set name="panduan46" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan46!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=46&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周五</td>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 51"><s:set name="panduan51" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan51!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=51&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 52"><s:set name="panduan52" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan52!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=52&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 53"><s:set name="panduan53" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan53!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=53&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 54"><s:set name="panduan54" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan54!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=54&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 55"><s:set name="panduan55" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan55!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=55&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 56"><s:set name="panduan56" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan56!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=56&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周六</td>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 61"><s:set name="panduan61" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan61!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=61&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 62"><s:set name="panduan62" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan62!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=62&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 63"><s:set name="panduan63" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan63!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=63&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 64"><s:set name="panduan64" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan64!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=64&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 65"><s:set name="panduan65" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan65!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=65&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 66"><s:set name="panduan66" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan66!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=66&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
            <tr>
            	<td id="week">周日</td>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 71"><s:set name="panduan71" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan71!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=71&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 72"><s:set name="panduan72" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan72!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=72&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 73"><s:set name="panduan73" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan73!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=73&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 74"><s:set name="panduan74" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan74!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=74&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                 <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 75"><s:set name="panduan75" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan75!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=75&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
                <s:iterator value="pinfo" var="p"><s:if test="#p.p_t_time == 76"><s:set name="panduan76" value="1" scope="page"/><td  class="yy"><s:property value="#p.p_t_cname"/></td></s:if></s:iterator>
                <s:if test="#attr.panduan76!=1"><td><a target="dialog" href="place/classroom_order.jsp?p_t_time=76&p_id=<s:property value="pinfo[0].p_id"/>" >申请</a></td></s:if>
            </tr>
        </table>
        </div>
    </div>
   
</div>
</body>
</html>
</div>