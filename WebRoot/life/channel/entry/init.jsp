<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	 
</head> 
<body >		  
		<form action="../../../toModule.do?prefix=/life&page=/channel/entry/init2.jsp" method="post" onsubmit="return check_form(this)">	 
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						恢复工号
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
			<li>输入已离职的代理人工号，可以对其恢复到在职状态。</li>			
			</ul>
			</body>
			 
</html:html>
