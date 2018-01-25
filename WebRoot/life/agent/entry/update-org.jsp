<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head> 
<body >		  
		<form action="../../../toModule.do?prefix=/life&page=/agent/entry/update-org2.jsp" method="post" onsubmit="return check_form(this)">	 
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						修改机构
					</div>
				</td>
			</tr> 				
				<tr> 
				<td align="right" width="50%">工号</td>	
				<td width="50%"><input name="c_jobnumber" value="" id="req" title="工号必须填写">  </td>
				</tr> 
				<tr>
				<td align="right" width="50%">
					<input type="submit" value="确 定"/>
				</td>	
				<td align="center" width="50%"> 		
				</td>		
				</tr> 
				</table>
			</form>	 
			<ul>
			<li>修改代理人的所属机构，将作废代理人已设置的事业部血缘关系</li>			
			</ul>
			</body>
			 
</html:html>
