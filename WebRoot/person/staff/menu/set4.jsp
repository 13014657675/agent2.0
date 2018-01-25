<%@ page language="java" pageEncoding="gbk"%>
<%@include file="/tool/common/taglib.jsp"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base/> 
	<link rel="stylesheet" type="text/css" href="../../../tool/styles/main.css">
</head>
<body>
<form action="../../../toModule.do?prefix=/person&page=/staff/menu/set5.jsp" method="post"> 
<input type="hidden" name="c_jobnumber" value="${param.c_jobnumber }">
<table  width="100%" border="1" cellspacing="0">
			<tr>
				<td height="33" colspan="3" background="../../../tool/images/113.gif">
					<div align="left">
						<img src="../../../tool/images/112.gif" width="16" height="15" />
						权限调整
					</div>
				</td>
			</tr>			
			<tr>				
				<td align="right" width="50%">系统 </td>
				<td> <select name="c_xitong" style="width: 120">
				<option value="A" selected="selected">系统设置</option>		 
				<option value="B">人事系统</option>
				<option value="C">OA系统</option>  
				<option value="D">财务系统</option>  
				<option value="E">报表系统</option>  
				<option value="G">寿险系统</option>	
				<option value="H">产险系统</option>		 
				</select>			
				</td>				
			</tr>						
			<tr>
			<td></td>
			<td>
			<input type="submit" value="下一步">
			</td>
			<td></td>
			</tr>			
		</table>
</form>

</body>	
</html:html>
