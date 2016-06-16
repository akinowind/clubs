<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>

<div class="pageCentent" layoutH="0">
<meta charset="utf-8" http-equiv="content-type" />
<link href="themes/css/apply.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
	window.onload = function(){
		if(window.attachEvent){  
        	document.getElementsByTagName('body').item('0').style.marginTop = '22px';  
   	 	}
	}
</script>
<body>
<div id="cont">
    <div id="right">
    	<table id="table1">
        	<tr class="t1_tr1">
            	<td class="tleft1">&nbsp;</td>
                <td>&nbsp;</td>
                <td class="tright1"><h2>教室</h2></td>
            </tr>
            <tr><td>&nbsp;</td><td colspan="3" class="t1_tr2">&nbsp;</td></tr>
            <tr>
            	<td>
                	<table id="table_left">
                        <tr><td>一层</td></tr>
                        <tr><td>二层</td></tr>
                        <tr><td>三层</td></tr>
                        <tr><td>五层</td></tr>
                        <tr><td>六层</td></tr>
                    </table>
                </td>
                <td rowspan="6" class="t1_tr4">&nbsp;</td>
                <td>
                	<table id="table1_right">
<!-- p_id命名规范
	同一教室分1，2的，在三位数前加1或2 -->
                    	<tr>
                    		  <td class="g">大型演播厅</td>
              				  <td class="b"><a href="place/classroom_show?p.p_id=102"  target="navTab" rel="classroom">102<br />道具室</a></td>
              				  <td class="p"><a href="place/classroom_show?p.p_id=103"  target="navTab" rel="classroom">103<br />陶艺窑炉室</a></td>
              				  <td class="r"><a href="place/classroom_show?p.p_id=105"  target="navTab" rel="classroom">105<br />化妆室1</a></td>
              				  <td class="y"><a href="place/classroom_show?p.p_id=106"  target="navTab" rel="classroom">106<br />化妆室2</a></td>
                    	</tr>

                        <tr>
                            <td class="g"><a href="place/classroom_show?p.p_id=203"  target="navTab" rel="classroom">203<br />陶艺教室</a></td>
                            <td class="b"><a href="place/classroom_show?p.p_id=204"  target="navTab" rel="classroom">204<br />贵宾室</a></td>
                            <td class="p"><a href="place/classroom_show?p.p_id=205"  target="navTab" rel="classroom">205<br />琴房1</a></td>
                            <td class="r"><a href="place/classroom_show?p.p_id=206"  target="navTab" rel="classroom">206<br />琴房2</a></td>
                        </tr>
                        <tr>
							<td class="g"><a href="place/classroom_show?p.p_id=2306"  target="navTab" rel="classroom">306(2)<br />舞蹈服装仓库</a></td>
							<td class="b"><a href="place/classroom_show?p.p_id=2309"  target="navTab" rel="classroom">309(2)<br />舞蹈教室</a></td>
                        </tr>
                        <tr>
                            <td class="g"><a href="place/classroom_show?p.p_id=503"  target="navTab" rel="classroom">503<br />视频工作室</a></td>
                            <td class="b"><a href="place/classroom_show?p.p_id=504"  target="navTab" rel="classroom">504<br />社团工作室</a></td>
                            <td class="p"><a href="place/classroom_show?p.p_id=2505"  target="navTab" rel="classroom">505(2)<br />青年志愿者协会</a></td>
                            <td class="r"><a href="place/classroom_show?p.p_id=2506"  target="navTab" rel="classroom">506(2)<br />社团联合会</a></td>
                            <td class="y"><a href="place/classroom_show?p.p_id=507"  target="navTab" rel="classroom">507<br />社会实践部</a></td>
                            <td class="g"><a href="place/classroom_show?p.p_id=1513"  target="navTab" rel="classroom">513(1)<br />团学工作研讨室</a></td>
                            <td class="b"><a href="place/classroom_show?p.p_id=2513"  target="navTab" rel="classroom">513(2)<br />洽谈室</a></td>
                        </tr>
                        <tr>
	                      	<td class="g"><a href="place/classroom_show?p.p_id=601"  target="navTab" rel="classroom">601<br />社团工作室</a></td>
                            <td class="b"><a href="place/classroom_show?p.p_id=2602"  target="navTab" rel="classroom">602(2)<br />社团工作室</a></td>
                            <td class="p"><a href="place/classroom_show?p.p_id=2603"  target="navTab" rel="classroom">603(2)<br />社团工作室</a></td>
                            <td class="r"><a href="place/classroom_show?p.p_id=2604"  target="navTab" rel="classroom">604(2)<br />社团工作室</a></td>
                            <td class="y"><a href="place/classroom_show?p.p_id=2605"  target="navTab" rel="classroom">605(2)<br />社团工作室</a></td>
                            <td class="g"><a href="place/classroom_show?p.p_id=2606"  target="navTab" rel="classroom">606(2)<br />社团工作室</a></td>
                            <td class="b"><a href="place/classroom_show?p.p_id=2607"  target="navTab" rel="classroom">607(2)<br />社团工作室</a></td>
                            <td class="p"><a href="place/classroom_show?p.p_id=2609"  target="navTab" rel="classroom">609(2)<br />青年工作室</a></td>
                            <td class="r"><a href="place/classroom_show?p.p_id=2612"  target="navTab" rel="classroom">612(2)<br />声乐教室</a></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</div>
</body>
</div>

