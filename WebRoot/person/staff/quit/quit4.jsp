<%@ page language="java"  pageEncoding="gbk"%>
<%@ include file="/tool/common/taglib.jsp"%> 
<html:html lang="true">
<head>
	<html:base /> 
	<script src="../../../tool/js/pub.js"></script> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">	
</head> 
		<body>		 
		<html:form  action="/staff" onsubmit="return check_form(this)">
		<html:hidden property="jobname" value="quit"/>
		<nested:nest property="staff">	 
		<table width="100%" border="1" cellspacing="0">
				<tr>
					<td height="33" colspan="2" background="../../../tool/images/113.gif">
						<div align="left">
							<img src="../../../tool/images/112.gif" width="16" height="15" />
							离司操作
						</div>
					</td>
				</tr>	
				<tr> 
				<td align="right" width="50%">工号</td>	
				<td width="50%">
					 <nested:text property="c_jobnumber" value="" styleId="req" title="工号不能为空"></nested:text> 
				</td>
				</tr> 		
				<tr> 
				<td align="right" width="50%">姓名</td>	
				<td width="50%"><nested:text property="c_name" value="" styleId="req" title="姓名不能为空"></nested:text>  
				</td>
				</tr> 
				<tr>
				<td align="right" width="50%">
					<input type="submit" value=" 确 定 "/>
				</td>	
				<td align="left" width="50%"> 	
					<input type="reset" value=" 取 消 "/>			
				</tr> 
				</table>
			</nested:nest></html:form>		 
			</body>			 
</html:html>
