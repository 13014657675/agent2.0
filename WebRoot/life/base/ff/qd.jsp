<%@ page language="java" pageEncoding="gbk" import="java.util.*"%>
<%@include file="/tool/common/taglib.jsp"%>
<html:html lang="true">
<head>
	<html:base />  
	<script src="../../../tool/js/pub.js"></script>
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
	<script type='text/javascript' src='../../../dwr/engine.js'> </script>
	<script type='text/javascript' src='../../../dwr/util.js'> </script>
	<script type='text/javascript' src='../../../dwr/interface/Organization.js'></script> 
	<script type="text/javascript">
		function set()
		{  
			var c_orgtypeid=document.getElementsByName("c_orgtypeid")[0].value   
			Organization.get_typeorg(c_orgtypeid, get);
			return false;
		}
		function get(datas)
		{					 
			DWRUtil.removeAllOptions('c_orgid');					
			DWRUtil.addOptions('c_orgid', datas, 'value', 'label'); 			 
		} 		 
	</script>
</head>
<body onload="set()">
<form action="../../../toModule.do?prefix=/life&page=/base/ff/qd2.jsp"  method="post" onsubmit="return check_form(this)">   
		<table width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="2" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						发放清单打印
					</div>
				</td>
			</tr>					
			
			<tr>
			<td align="right" width="50%">日期</td>
			<td>
			<input name="c_date" value="" maxlength="8" id="req" title="日期必须填写">
			</td>
			</tr>
			
			<tr>				
				<td align="right">
				<input type="submit" value="下一步 ">
				</td>			
				<td> 
				</td>			
			</tr>
		</table>
</form> 
</body>
</html:html>
